pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Deploy') {
            steps {
                script {
                    // Deploy to another server
                    sshagent(['jenkins-github-cicd']) {
                        sh 'ssh root@8.222.224.164 "cd /root/jenkins; git pull origin master; ./deploy.sh"'
                    }
                }
            }
        }
    }
}