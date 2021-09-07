pipeline {
    agent { docker 'kaarla/terraform-terratest' }
    stages {
        stage('validate') {
            steps {
                // sh '''
                // cat <<EOF > $HOME/.aws/credentials
                // [default]
                // aws_access_key_id=credentials(AWS_KEY_ID)
                // aws_secret_access_key=$AWS_SECRET_KEY
                // aws_session_token=$AWS_TOKEN
                // EOF
                // '''

                sh '''
                    echo credentials(AWS_KEY_ID)
                    echo $AWS_KEY_ID
                    // terraform init
                    // echo "TERRAFORM VALIDATE"
                    // terraform validate
                '''
            }
        }
        stage('terratest') {
            steps {
                sh '''
                    terraform apply --auto-approve
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