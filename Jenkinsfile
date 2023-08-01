pipeline {
    agent any 
    stages {
        stage {
            steps {
                
                echo "clone"
                git url:"https://github.com/Quvonchdev/django-todo-cicd.git", branch: "main"   
            }
        }
        stage {
            steps {
                echo "build"
                sh "docker build -t django ."
            }
        }
        stage {
            steps {
                echo "push docker hub"
                whithCredentials([usernamePassword(credentialsId:"dockerhub",passwordVariable:"dockerhubPass",usernameVariable:"dockerhubUser")]){
                    sh "docker tag django ${env.dockerhubUser}/django:latest"
                    sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPass}"
                    sh "docker push ${env.dockerhubUser}/django:latest"
            }
        }
        stage {
            steps {
                echo "deploy"
            }
        }
    }
}
