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
   	stage("Gradle build") {
	    steps {
                sh 'gradle clean build -x test'
	    }    
	}    
	stage("Delivery") {
            steps {
		    sh 'cp '+"${env.WORKSPACE}"+"/build/libs/PipelineEasyPay_master-1.0-SNAPSHOT.war "+'/opt/tomcat/webapps/ROOT.war'
            }
        }   
       }     	
    post {
        failure {
                mail subject: "APP WAS NOT DEPLOYED",
                    body: "FAILURE",
                    to: 'oleksandr.boshko@gmail.com'
            }
            success {
                mail subject: "APP WAS DEPLOYED",
                    body: "OK",
                    to: 'oleksandr.boshko@gmail.com'
            }                
            always {
                deleteDir()
                } 
        } 
    
}
