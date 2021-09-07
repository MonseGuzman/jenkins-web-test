pipeline {
    agent { docker 'kaarla/terraform-terratest' }
    stages {
        stage('validate') {
            steps {
                sh '''
                    echo ${env.WORKSPACE}

                    terraform init
                    echo "TERRAFORM VALIDATE"
                    terraform validate
                '''
            }
        }
        stage('terratest') {
            steps {
                sh '''
                    echo $AWS_KEY_ID
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