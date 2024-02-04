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
    }
}