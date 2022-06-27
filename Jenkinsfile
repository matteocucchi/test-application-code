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
				bat 'docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'
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