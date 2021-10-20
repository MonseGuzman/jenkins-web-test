// Jenkinsfile
@Library('library-example@main') _

SSMpipeline()

// pipeline {
//     // agent any
//     agent { docker 'kaarla/terraform-terratest' }
//     environment {
//         AWS_ACCESS_KEY_ID="${AWS_KEY_ID}"
//         AWS_SECRET_ACCESS_KEY="${AWS_SECRET_KEY}"
//         AWS_SESSION_TOKEN="${AWS_TOKEN}"
//         TFE_TOKEN="${TFE_TOKEN}"
//     }
//     stages {
//         stage('setup') {
//             steps {
//                 linux 'setup'
                
//                 example()
//             }
//         }
//         // It's already test :D 
//         stage('validate') { 
//             when {
//                 branch 'master'
//             }
//             steps {
//                 linux 'validate'
                
//                 validate()
//             }
//         }
//         stage('terratest') {
//             steps {
//                 linux 'terratest'
                
//                 terratest()
//                 // terraform destroy --auto-approve
//             }
//         }
//         stage('versioning') {
//             when {
//                 branch 'master'
//             }
//             steps {
//                 linux 'versioning'

//                 sh '''
//                     go install github.com/git-chglog/git-chglog/cmd/git-chglog@latest
//                 '''

//                 versionTagging()
//             }
//         }
//         stage('publish') {
//             when {
//                 branch 'master'
//             }
//             steps {
//                 linux 'publish'

//                 sh '''
//                     cd scripts
                    
//                     echo "##[command]Install tflint"
//                     source install-tools.sh; cache_tool_installer tflint 0.20.3
//                 '''
//             }
//         }
//     }
//     post {
//         always {
//             echo "Cleaning up Workspace"
//             deleteDir() /* clean up our workspace */
//         }
//     }
// }