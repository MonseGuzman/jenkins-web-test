
// Jenkinsfile
@Library('library-example') _

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
                linux 'validate'
                
                example()

                sh '''
                    echo "hola"
                '''
                // sh '''
                //     chmod +x scripts/terraform-validate.sh
                //     ls 
                //     pwd
                //     sh ./scripts/terraform-validate.sh
                // '''
            }
        }
        stage('terratest') {
            steps {
	            // checkout scm

                // example 'terratest'
                sh '''
                    ls scripts
                    ls

                    chmod +x scripts/terraform-validate.sh
                    sh ./scripts/terraform-validate.sh
                '''
                // sh '''
                //     echo "$AWS_ACCESS_KEY_ID"
                //     // terraform destroy --auto-approve
                // '''
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
    post {
        always {
            deleteDir() /* clean up our workspace */
        }
    }
}