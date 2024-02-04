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
                sh 'echo Build!!'
                sh 'npm install' 
            }
        }
        stage('Test') {
            steps {
                sh 'echo Test!!'
                sh './jenkins/scripts/test.sh'
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