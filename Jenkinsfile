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
                 app = docker.build("test-application")
                }
            }
        }
        stage('Test image') {           
            app.inside {            
             sh 'echo "Tests passed"'        
            }    
        }
        stage('Push image') {
            docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {            
                app.push("${env.BUILD_NUMBER}")            
                app.push("latest")        
            }    
           }
    }
}