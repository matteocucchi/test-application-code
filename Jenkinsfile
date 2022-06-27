pipeline {
    agent any
    environment{
        DOCKERHUB_CREDENTIAL=credentials('dockerhub')
        image_version=2.0
    }
    stages {
         stage('Clone repository') { 
            steps { 
                script{
                    checkout scm
                }
            }
        }

        stage('Build') { 
            steps { 
                script{
                 app = docker.build("test-app")
                }
            }
        }

        stage('Login') {
			steps {
                bat 'docker login -u '+DOCKERHUB_CREDENTIAL_USR+' -p '+DOCKERHUB_CREDENTIAL_PSW               
			}
		}

		stage('Push') {
			steps {
                bat 'docker tag test-app:latest '+DOCKERHUB_CREDENTIAL_USR+'/test-app:'+image_version
				bat 'docker push '+DOCKERHUB_CREDENTIAL_USR+'/test-app:'+image_version
			}
		}
	}

	post {
		always {
			bat 'docker logout'
		}
	}
}