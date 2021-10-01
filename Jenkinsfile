pipeline {
    agent { docker 'kaarla/terraform-terratest' }
    environment {
        AWS_ACCESS_KEY_ID=$AWS_KEY_ID
        AWS_SECRET_ACCESS_KEY=$AWS_SECRET_KEY
        AWS_SESSION_TOKEN=$AWS_TOKEN
    }
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
                sh "mkdir -p ~/.aws/credentials"

                sh '''
                    // cat <<EOF > ~/.aws/credentials
                    // [default]
                    // aws_access_key_id=$AWS_KEY_ID
                    // aws_secret_access_key=
                    // aws_session_token=$
                    // EOF

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