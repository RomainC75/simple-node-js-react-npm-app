pipeline {
    agent {
        docker {
            image 'node:20.11.0-alpine3.19' 
            args '-p 3000:3000' 
        }
    }
    stages {
        stage('Build') { 
            steps {
                script {
                    def app = docker.build("RomainC75/test")
                }
                sh 'echo Build!!'
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                script{
                    app.inside {            
                        sh 'echo Test!!'
                        sh './jenkins/scripts/test.sh'
                    }  
                }
            }
        }
        stage('Push'){
            step{
                docker.withRegistry('https://registry.hub.docker.com', 'DockerHub') {            
                    app.push("${env.BUILD_NUMBER}")            
                    app.push("latest")        
                }    
            }
        }
        stage('Deliver') {
            steps {
                sh 'echo Deliver!!'
                sh './jenkins/scripts/deliver.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
    }
}