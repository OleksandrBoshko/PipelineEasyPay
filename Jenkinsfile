pipeline {
    agent {
        label 'master'  
    }

    stages {
        stage("SCM") {
            steps {
                checkout scm
            }
        }
        stage("Build") {
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
