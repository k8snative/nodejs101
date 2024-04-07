pipeline {
    agent none // Remove the agent node declaration here

    stages {
        stage('Selecting Node') {
            agent {
                node {
                    label 'localmachine'
                }
            }
            steps {
                script {
                    if (env.BRANCH_NAME == 'develop') {
                        // Deploy on the 'develop' branch
                        dir('/home/farrukh/application-nodejs/deployment-develop') {
                            sh './deployment_script.sh'
                        }
                    } else if (env.BRANCH_NAME == 'qa') {
                        // Deploy on the 'qa' branch
                        dir('/home/farrukh/application-nodejs/deployment-qa') {
                            sh './deployment_script.sh'
                        }
                    } else if (env.BRANCH_NAME == 'uat') {
                        // Deploy on the 'uat' branch
                        dir('/home/farrukh/application-nodejs/deployment-uat') {
                            sh './deployment_script.sh'
                        }
                    } else {
                        // Skip execution for other branches
                        echo "Skipping script execution for branch ${env.BRANCH_NAME}"
                    }
                }
            }
        }
    }
}
