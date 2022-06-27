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
				echo DOCKERHUB_CREDENTIAL_USR
                sh 'echo ${DOCKERHUB_CREDENTIAL}'
                
			}
		}
/*
		stage('Push') {
			steps {
				bat 'docker push test-app:latest'
			}
		}*/
	}

	post {
		always {
			bat 'docker logout'
		}
	}
}