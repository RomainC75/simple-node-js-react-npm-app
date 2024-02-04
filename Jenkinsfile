pipeline {
    agent none
    stages {
        stage('Build') { 
            agent {
                docker {
                   image 'node:20.11.0-alpine3.19' 
                    args '-p 3000:3000' 
                }
            }
            steps {
                sh 'echo Build!!'
                sh 'npm install' 
            }
        }
        stage('Test') {
            agent {
                docker {
                   image 'node:20.11.0-alpine3.19' 
                    args '-p 3000:3000' 
                }
            }
            steps {
                sh 'echo Test!!'
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Deliver') {
            agent {
                docker {
                   image 'node:20.11.0-alpine3.19' 
                    args '-p 3000:3000' 
                }
            }
            steps {
                sh 'echo Deliver!!'
                sh './jenkins/scripts/deliver.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
    }
}