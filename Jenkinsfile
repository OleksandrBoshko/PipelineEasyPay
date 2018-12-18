pipeline {
    agent {
        label 'master'  
    }
    tools {
        gradle 'gradle-4'
    } 
    stages {
     /*   stage("SCM") {
            steps {
                checkout scm
            }
        }  */
	stage("Tomcat clean") {
            steps {
		    if (fileExists ('/opt/tomcat/webapps/ROOT.war')) {
			fileOperations([fileDeleteOperation(excludes: '', includes: '/opt/tomcat/webapps/ROOT')])
		    } else {
			sh 'echo "first build"'
		    }
		    
		    /*
		    if (fileExists '/opt/tomcat/webapps') {
		    fileOperations([fileDeleteOperation(excludes: '', includes: '/opt/tomcat/webapps/ROOT.war')])
		    } 
                sh './tomcat_clean.sh' */
            }    
        }  
   	stage("Gradle build") {
	    steps {
                sh 'gradle clean build -x test'
	    }    
	}    
	stage("Tomcat .war") {
            steps {
		    sh 'cp '+"${env.WORKSPACE}"+"/build/libs/PipelineEasyPay_master-1.0-SNAPSHOT.war "+'/opt/tomcat/webapps/ROOT.war'
            }
        }   
       }     	
    post {
        failure {
		emailextrecipients([upstreamDevelopers()])
                mail subject: "APP WAS NOT DEPLOYED",
                    body: "FAILURE",
                    to: 'oleksandr.boshko@gmail.com'
            }
            success {
		emailextrecipients([upstreamDevelopers()])
                mail subject: "APP WAS DEPLOYED",
                    body: "OK",
                    to: 'oleksandr.boshko@gmail.com'
            }                
            always {
                deleteDir()
                } 
        } 
    
}
