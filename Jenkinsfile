pipeline {
    agent any
    environment{
        DOCKERHUB_CREDENTIAL=credentials('dockerhub')
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
				bat 'docker push '+DOCKERHUB_CREDENTIAL_USR+'/test-app:latest'
			}
		}
	}

	post {
		always {
			bat 'docker logout'
		}
	}
}