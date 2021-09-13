pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh '''echo "Building Code" 
                      docker build -t nodeapp:$BUILD_NUMBER .'''
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
