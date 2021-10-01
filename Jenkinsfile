pipeline {
    agent { docker 'kaarla/terraform-terratest' }
    environment {
        AWS_ACCESS_KEY_ID="${AWS_KEY_ID}"
        AWS_SECRET_ACCESS_KEY="${AWS_SECRET_KEY}"
        AWS_SESSION_TOKEN="${AWS_TOKEN}"
    }
    stages {
        stage('validate') {
            steps {
                sh '''
                    chmod +x scripts/terraform-validate.sh
                    ./terraform-validate.sh
                '''
            }
        }
        stage('terratest') {
            steps {
                sh '''
                    echo "$AWS_ACCESS_KEY_ID"
                    // terraform apply --auto-approve
                '''
                sh '''
                    echo "$AWS_ACCESS_KEY_ID"
                    // terraform destroy --auto-approve
                '''
            }
        }
        stage('versioning') {
            when {
                branch 'master'
            }
            steps {
                sh 'go version'
            }
        }
        stage('publish') {
            when {
                branch 'master'
            }
            steps {
                sh 'terraform --version'
            }
        }
    }
}