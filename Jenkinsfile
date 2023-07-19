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
                    sshagent(['ec2-server-key']) {
                        sh 'ssh -o StrictHostKeyChecking=no root@34.125.194.161 "cd /root/jenkins; git pull origin master; ./deploy.sh"'
                    }
                }
            }
        }
    }
}
