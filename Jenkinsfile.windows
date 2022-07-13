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
                    powershell "git clone https://github.com/matteocucchi/test-application.git"
                }
            }
        }        

        stage('Get Current Version') {
            steps{
                script{
                    env.VERSIONE_OLD = powershell(script:"((gc test-application/dev/deployment.yaml | findstr '        image: matteocucchi/test-app:') -replace '        image: matteocucchi/test-app:', '')", returnStdout: true).trim()
                    env.VERSIONE_NEW = powershell(script:"[string]([double]((gc test-application/dev/deployment.yaml | findstr '        image: matteocucchi/test-app:') -replace '        image: matteocucchi/test-app:', '') + 0.1)", returnStdout: true).trim()
                }
            }
        }

        stage('Build') { 
            steps { 
                script{
                    //powershell "docker build -t 'test-app' ."
                    app = docker.build("test-app")
                }
            }
        }

        stage('Login') {
			steps {
                powershell 'docker login -u '+DOCKERHUB_CREDENTIAL_USR+' -p '+DOCKERHUB_CREDENTIAL_PSW               
			}
		}

		stage('Push') {
			steps {
                powershell 'docker tag test-app:latest '+DOCKERHUB_CREDENTIAL_USR+'/test-app:'+VERSIONE_NEW
				powershell 'docker push '+DOCKERHUB_CREDENTIAL_USR+'/test-app:'+VERSIONE_NEW
			}
		}
        stage('Version Update'){
            steps{
                script{                    
                    dir ('test-application') {
                        powershell "echo ((gc dev/deployment.yaml) -replace '"+VERSIONE_OLD+"', '"+VERSIONE_NEW+"') > dev/deployment.yaml"
                        powershell "git add ."
                        powershell "git commit -m '"+env.VERSIONE_OLD+"-->"+env.VERSIONE_NEW+"'"
                        powershell "git push origin HEAD:main"
                    }
                }
            }
        }
	}

	post {
		always {
			powershell 'docker logout'
		}
	}
}