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
                    export HELLO="monse"
                    echo "this is a example of steps"
                    echo $HELLO
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