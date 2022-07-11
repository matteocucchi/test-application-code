pipeline {
    agent {
        docker { image 'centos:centos7' }
    }
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
        
        stage('TEST') { 
            steps { 
                script{
                    sh "whoami"
                }
            }
        }
        
/*        stage('Clone conf repository') { 
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
                    env.VERSIONE_NEW = sh(script:"expr "+env.VERSIONE_OLD+" + 1", returnStdout: true).trim()
                }
            }
        }

        stage('CHECK FOR DOCKER') { 
            steps { 
                script{
                    def dockerHome = tool 'docker'
        	        env.PATH = "${dockerHome}/bin:${env.PATH}"
                    sh "ls -la /var/run/"
                }
            }
        }

        stage('Build') { 
            steps { 
                script{
                    
                    docker.build('test-app')
                }
            }
        }

        stage('Login') {
			steps {
                sh 'docker login -u '+DOCKERHUB_CREDENTIAL_USR+' -p '+DOCKERHUB_CREDENTIAL_PSW               
			}
		}

		stage('Push') {
			steps {
                sh 'docker tag test-app:latest '+DOCKERHUB_CREDENTIAL_USR+'/test-app:'+VERSIONE_NEW
				sh 'docker push '+DOCKERHUB_CREDENTIAL_USR+'/test-app:'+VERSIONE_NEW
			}
		}
        stage('Version Update'){
            steps{
                script{                    
                    dir ('test-application') {
                        sh "echo ((gc dev/deployment.yaml) -replace '"+VERSIONE_OLD+"', '"+VERSIONE_NEW+"') > dev/deployment.yaml"
                        sh "git add ."
                        sh "git commit -m '"+env.VERSIONE_OLD+"-->"+env.VERSIONE_NEW+"'"
                        sh "git push origin HEAD:main"
                    }
                }
            }
        }
*/
	}
	post {
		always {
			sh 'docker logout'
		}
	}
}
