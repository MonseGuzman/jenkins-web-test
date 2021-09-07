pipeline {
    agent { docker 'kaarla/terraform-terratest' }
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_KEY')
        AWS_SESSION_TOKEN = credentials('AWS_TOKEN')
    }
    stages {
        stage('validate') {
            steps {
                sh '''
                    echo "$AWS_ACCESS_KEY_ID"

                    terraform init
                    echo "TERRAFORM VALIDATE"
                    terraform validate
                '''
            }
        }
        stage('terratest') {
            steps {
                sh '''
                    echo $AWS_ACCESS_KEY_ID
                    // terraform apply --auto-approve
                '''
            }
        }
        stage('versioning') {
            steps {
                sh 'go version'
            }
        }
        stage('publish') {
            steps {
                sh 'terraform --version'
            }
        }
    }
}