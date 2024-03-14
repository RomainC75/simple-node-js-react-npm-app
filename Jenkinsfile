pipeline {
    agent any
    stages {
        stage('Build') { 
            steps {
                sh 'docker build -t RomainC75/test .'
            }
        }
        stage('Test') { 
            steps {
                sh './jenkins/scripts/test.sh' 
            }
        }
        // rest of your stages...
    }
    // rest of your pipeline...
}