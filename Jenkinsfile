pipeline {
    agent {
        label 'master'
    }
    options {
        skipDefaultCheckout()
    }
    stages {
	stage("BUILD: Build by gradle"){
	    agent {
  	    	label "${BUILD}";
	    }	
	    steps {
		sh('build.sh')
	    }    
	}
        stage("ONE: One big stage") {
            agent {
	    	label "$ONE";
	    }
            steps {
                sh "sudo service postgresql reload"
                sh "sudo -u postgres psql postgres -c 'DROP DATABASE easypay_db;'"
                sh "sudo mv /var/lib/jenkins/workspace/EasyPay/build/libs/EasyPay-1.0-SNAPSHOT.war /opt/tomcat/webapps/ROOT.war"
                sh "sudo -u postgres psql postgres -c 'CREATE DATABASE easypay_db;'"
                sh "sudo -u postgres psql postgres -c 'GRANT ALL PRIVILEGES ON DATABASE easypay_db TO postgres;'"
                sh "sudo -u postgres psql easypay_db < /var/lib/jenkins/workspace/EasyPay/2.sql"
                sh "sudo systemctl restart tomcat"
            }
        }
    }
}

