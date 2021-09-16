pipeline {
    agent any
   parameters {
        booleanParam(name: 'Refresh', defaultValue: false, description: 'Refresh this Job')

        string(name: 'codeLocation', defaultValue: 'AngularCode', description: '')
        string(name: 'bucketName', defaultValue: '', description: '')


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
                  sh """
                    cd ${params.codeLocation}
                    docker build -t angular .
                    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 630532976899.dkr.ecr.us-east-1.amazonaws.com
                    docker tag angular 630532976899.dkr.ecr.us-east-1.amazonaws.com/gokloudwebsite:angular
                    docker push 630532976899.dkr.ecr.us-east-1.amazonaws.com/gokloudwebsite:angular
                  """
            }
        }
        stage('Infrastructure Provisioning') {
            steps{
                echo ' Infrastructure as code...'
                  sh"""
                    cd /terraform
                    terraform init
                    terraform apply -var-file="values.tfvars"

                  """
            }
        }
    }
        post {
    cleanup {
        cleanWs(cleanWhenFailure: false)
    }
    }
}
