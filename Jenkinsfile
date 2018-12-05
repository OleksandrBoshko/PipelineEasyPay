pipeline {
    agent none

    stages {
        stage('SCM') {
            agent { 
                node { 
                    label 'master'
                }
            }
            steps {
                checkout scm
            }
        }
        stage("Build") {
            agent {
                node {
                    label 'master'
                }
            }
	        steps {
                sh 'gradle clean build -x test'
	        }    
	    }
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
