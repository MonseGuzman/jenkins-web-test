pipeline {
    agent { docker 'kaarla/terraform-terratest' }
    stages {
        stage('validate') {
            steps {
                sh '''
                    terraform init
                    echo "TERRAFORM VALIDATE"
                    terraform validate
                '''
            }
        }
        stage('terratest') {
            steps {
                sh '''
                    cat <<EOF > .aws/credentials
                    [default]
                    aws_access_key_id=$AWS_KEY_ID
                    aws_secret_access_key=$AWS_SECRET_KEY
                    aws_session_token=$AWS_TOKEN
                    EOF

                    echo "$AWS_ACCESS_KEY_ID"
                    terraform apply --auto-approve
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