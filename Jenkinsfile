pipeline {
    agent any
    environment {
        dockerhub = credentials('dockerhub')
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
                bat 'echo $dockerhub_USR $dockerhub_PSW'
				//bat 'docker login -u $dockerhub_USR -p $dockerhub_PSW'
			}
		}

		stage('Push') {

			steps {
				bat 'docker push test-app:latest'
			}
		}
	}

	post {
		always {
			bat 'docker logout'
		}
	}
}