pipeline {
    agent any
   parameters {
        booleanParam(name: 'Refresh', defaultValue: false, description: 'Refresh this Job')

        string(name: 'codeLocation', defaultValue: '/', description: '')

    }
    stages {
        stage('Build') {
            steps {
                sh """
                      echo ${params.codeLocation}                      
                      cd ${params.codeLocation}
                      echo "Building Code"
                      whoami
                      npm install
                      ls
                      """
            }
        }
        stage('Upload ') {
            steps {
                
                echo 'Testing..'
                sh """
                    cd ${params.codeLocation}
                    ng build
                  """
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
        post {
    cleanup {
        cleanWs(cleanWhenFailure: false)
    }
    }
}
