pipeline {
    agent none
    
    stages {
        stage("Hello World!") {
	    agent {
                node {
                    label 'master'
                }
            }
	    steps {
		sh 'touch hello.txt'
		sh 'echo "Hello World!" >> hello.txt'
	    }

        }
    }
}
