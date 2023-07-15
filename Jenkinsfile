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
                    sshagent(credentials: ['jenkins-id']) {
                        sh 'ssh -o StrictHostKeyChecking=no root@8.222.224.164 "cd /root/jenkins; git pull origin master; bash ./deploy.sh"'
                    }
                }
            }
        }
    }
}
