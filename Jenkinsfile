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
            }
        }
    }
}
