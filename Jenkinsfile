// Jenkinsfile
@Library('library-example') _

pipeline {
    // agent any
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
                
                validate()

                sh '''
                    echo "hola"
                '''
            }
        }
        stage('terratest') {
            when {
                branch 'master'
            }
            steps {
                linux 'terratest'

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
                linux 'versioning'

                sh 'go version'
            }
        }
        stage('publish') {
            when {
                branch 'master'
            }
            steps {
                linux 'publish'

                sh '''
                    cd scripts
                    
                    echo "##[command]Install tflint"
                    source install-tools.sh; cache_tool_installer tflint 0.20.3
                '''
            }
        }
    }
    post {
        always {
            echo "Cleaning up Workspace"
            deleteDir() /* clean up our workspace */
        }
    }
}