pipeline {
    agent { docker 'kaarla/terraform-terratest' }
    stages {
        stage('validate') {
            steps {
                echo "hello world"
                // sh 'echo "hello world'
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
                go version
            }
        }
        stage('publish') {
            steps {
                terraform --version
            }
        }
    }
}