pipeline {
    agent any
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

        stage('Test') {
            steps{
                script{
                    bat 'echo bella'
                }
            }
        }

        /*
        stage('Push image') {
            steps { 
                script{
                    docker.withRegistry('https://hub.docker.com', 'dockerhub') {
                        app.push()
                    }
                }
            }
        }
        */
    }
}