pipeline {
    agent any 
    stages {
        stage("clone git"){
            steps {
                
                echo "clone"
                git url:"https://github.com/Quvonchdev/django-todo-cicd.git", branch: "main"   
            }
        }
        stage("build"){
            steps {
                echo "build"
                sh "docker build -t django ."
            }
        }
        stage("push to docker"){
            steps {
                echo "push docker hub"
                withCredentials([usernamePassword(credentialsId:"dockerhub",passwordVariable:"dockerhubPass",usernameVariable:"dockerhubUser")]){
                    sh "docker tag django ${env.dockerhubUser}/django:latest"
                    sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPass}"
                    sh "docker push ${env.dockerhubUser}/django:latest"
                }
            }
        }
        stage("deploy"){
            steps {
                echo "deploy"
                sshagent(['jenkins-cicd']) {
                    sh "ssh -o StrictHostKeyChecking=no root@34.125.74.64 docker pull quvonchdev/django-node-cicd:latest"
                    sh 'ssh -o StrictHostKeyChecking=no root@34.125.74.64 "docker stop django-app || true"'
                    sh 'ssh -o StrictHostKeyChecking=no root@34.125.74.64 "docker rm -f django-app || true"'
                    sh 'ssh -o StrictHostKeyChecking=no root@34.125.74.64 "docker run -p 8000:8000 -d -v /lokali/katalogingiz:/app/backend/db --name=django-app quvonchdev/django-node-cicd:latest"'
                }
            }
        }
    }
}
