pipeline {
    agent { docker { image 'kaarla/terraform-terratest' } }
    stages {
        stage('validate') {
            steps {
                sh 'echo "hello world'
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
        stage('vversioning') {
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