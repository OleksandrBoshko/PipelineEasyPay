pipeline {
    agent none
/*
    agent {
        label 'master'
    }
    options {
        skipDefaultCheckout()
    }
*/

    stages {
        stage('Deploy') {
            agent { 
                node { 
                    label 'master'
                }
            }
            options {
                retry(5)
                timestamps()
            }
            steps {
                checkout scm
            }
        }
        stage("Tomcat clean") {
            agent {
                node {
                    label 'master'
                }
            }
            steps {

                sh './tomcat_clean.sh'
/*
                if (fileExists('/opt/tomcat/webapps/ROOT.war')) {
                    echo 'Yes'
                } else {
                    echo 'No'
                }

                sh 'if [ -d /opt/tomcat/webapps/ROOT ]; then sudo rm -rf /opt/tomcat/webapps/ROOT fi'
                sh 'if [ -f /opt/tomcat/webapps/ROOT.war ]; then sudo rm -f /opt/tomcat/webapps/ROOT.war fi'
*/
            }    
        }
	    stage("Gradle build") {
            agent {
                node {
                    label 'master'
                }
            }
	        steps {
                sh 'cd /var/lib/jenkins/workspace/PipelineEasyPay_master'
                sh 'sudo gradle clean build -x test'
	        }    
	    } 
        stage("Drop database") {
            agent {
                node {
                    label 'master'
                }
            }
            steps {
                sh "sudo service postgresql reload"
                sh "sudo -u postgres psql postgres -c 'DROP DATABASE easypay_db;'"
            }
        }
        stage("Tomcat .war") {
            agent {
                node {
                    label 'master'
                }
            }
            steps {
                sh "sudo mv /var/lib/jenkins/workspace/PipelineEasyPay_master/build/libs/PipelineEasyPay_master-1.0-SNAPSHOT.war /opt/tomcat/webapps/ROOT.war"
            }
        }
        stage("Create database") {
            agent {
                node {
                    label 'master'
                }
            }
            steps {
                sh "sudo -u postgres psql postgres -c 'CREATE DATABASE easypay_db;'"
                sh "sudo -u postgres psql postgres -c 'GRANT ALL PRIVILEGES ON DATABASE easypay_db TO postgres;'"
            }
        }
        stage("Restore database") {
            agent {
                node {
                    label 'master'
                }
            }
            steps {
                sh "sudo -u postgres psql easypay_db < /var/lib/jenkins/workspace/PipelineEasyPay_master/2.sql"
            }
        }
        stage("Tomcat restart") {
            agent {
                node {
                    label 'master'
                }
            }
            steps {
                sh "sudo systemctl restart tomcat"
            }
            post {
                failure {
                    mail subject: "APP WAS NOT DEPLOYED",
                        body: "FAILURE",
                        to: 'who@gmail.com'
                }
                success {
                    mail subject: "APP WAS DEPLOYED",
                        body: "OK",
                        to: 'who@gmail.com'
                }
                always {
                    deleteDir()
                }
            }
        }
    }
}