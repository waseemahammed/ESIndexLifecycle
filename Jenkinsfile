pipeline {
    agent any
   parameters {
        booleanParam(name: 'Refresh', defaultValue: false, description: 'Refresh this Job')

        string(name: 'codeLocation', defaultValue: 'AngularCode', description: '')
        string(name: 'bucketName', defaultValue: '', description: '')
        string(name: 'ImageTag', defaultValue: 'angular', description: '')
        string(name: 'ECR_Tag', defaultValue: 'first', description: '')
        


    }
    stages {
        stage('Build') {
            steps {
                sh """
                      echo ${params.codeLocation}                      
                      cd ${params.codeLocation}
                      echo "Building Code"
                      whoami
                      curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
                      . ~/.nvm/nvm.sh
                      nvm install node
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
                    
                   
                    npm run-script ng build 
                  """
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                  sh """
                    cd ${params.codeLocation}
                    docker build -t ${params.ImageTag} .
                    aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 016505711272.dkr.ecr.us-east-1.amazonaws.com
                    docker tag ${params.ImageTag} 016505711272.dkr.ecr.us-east-2.amazonaws.com/gokloudwebsite:${params.ECR_Tag}
                    docker push 016505711272.dkr.ecr.us-east-2.amazonaws.com/gokloudwebsite:${params.ECR_Tag}
                  """
            }
        }
        stage('Infrastructure Provisioning') {
            steps{
                echo ' Infrastructure as code...'
                  sh"""
                    cd terraform
                    terraform init
                    terraform apply -var-file="values.tfvars" -auto-approve
                    terraform apply -var="imageURI=016505711272.dkr.ecr.us-east-2.amazonaws.com/gokloudwebsite:${params.ECR_Tag}"
                    terraform output dns_name

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
