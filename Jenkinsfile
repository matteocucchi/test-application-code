pipeline {
    agent any
    environment{
        DOCKERHUB_CREDENTIAL=credentials('dockerhub')
    }
    stages {
        stage('Clone code repository') { 
            steps { 
                script{
                    checkout scm
                }
            }
        }
        stage('Clone conf repository') { 
            steps { 
                script{
                    dir ('test-application') {
                        deleteDir()
                    }
                    sh "git clone https://github.com/matteocucchi/test-application.git"
                }
            }
        }        

        stage('Get Current Version') {
            steps{
                script{
                    env.VERSIONE_OLD = sh(script:"grep 'image: matteocucchi/test-app:' test-application/dev/deployment.yaml | sed 's*        image: matteocucchi/test-app:**'", returnStdout: true).trim()
                    //env.VERSIONE_NEW = shell(script:"echo '"+env.VERSIONE_OLD+" + 0.1' | bc", returnStdout: true).trim()
                    //shell "echo "+env.VERSIONE_OLD+" "+env.VERSIONE_NEW            
                    sh "echo "+env.VERSIONE_OLD        
                }
            }
        }
/*
        stage('Build') { 
            steps { 
                script{
                 app = docker.build("test-app")
                }
            }
        }

        stage('Login') {
			steps {
                shell 'docker login -u '+DOCKERHUB_CREDENTIAL_USR+' -p '+DOCKERHUB_CREDENTIAL_PSW               
			}
		}

		stage('Push') {
			steps {
                shell 'docker tag test-app:latest '+DOCKERHUB_CREDENTIAL_USR+'/test-app:'+VERSIONE_NEW
				shell 'docker push '+DOCKERHUB_CREDENTIAL_USR+'/test-app:'+VERSIONE_NEW
			}
		}
        stage('Version Update'){
            steps{
                script{                    
                    dir ('test-application') {
                        shell "echo ((gc dev/deployment.yaml) -replace '"+VERSIONE_OLD+"', '"+VERSIONE_NEW+"') > dev/deployment.yaml"
                        shell "git add ."
                        shell "git commit -m '"+env.VERSIONE_OLD+"-->"+env.VERSIONE_NEW+"'"
                        shell "git push origin HEAD:main"
                    }
                }
            }
        }
*/
	}
	post {
		always {
			shell 'docker logout'
		}
	}
}