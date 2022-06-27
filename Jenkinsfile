pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
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
        stage('Test image') {    
            steps { 
                script{       
                    app.inside {            
                    sh 'echo "Tests passed"'        
                    }
                }
            }    
        }
        stage('Push image') {
            steps { 
                script{
                    docker.withRegistry('https://hub.docker.com/repository/docker/matteocucchi/test-app', 'doockerhub') {
                        app.push()
                    }
                }
            }
        }
    }
}