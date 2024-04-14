pipeline {
    agent {
        label 'ec2instance'
    }
 
    stages {
        stage('Deploying on Develop, QA and UAT') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'develop') {
                        dir('/home/farrukh/application-nodejs/deployment-develop') {
                            sh './deployment_script.sh'
                        }
                    } else if (env.BRANCH_NAME == 'qa') {
                        dir('/home/farrukh/application-nodejs/deployment-qa') {
                            sh './deployment_script.sh'
                        }
                    } else if (env.BRANCH_NAME == 'uat') {
                        dir('/var/www/application-nodejs/deployment-uat') {
                            sh './deployment_script.sh'
                        }
                    } else {
                        echo "Skipping script execution for branch ${env.BRANCH_NAME}"
                    }
                }
            }
        }
    }
}