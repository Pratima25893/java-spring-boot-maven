pipeline {

    agent any

    tools {
        maven "maven3.2"
    }

    stages {
        stage("checkut SCM") {
            steps{
                git branch: 'main', credentialsId: 'Gitnew', url: 'https://github.com/Pratima25893/java-spring-boot-maven'
            }
        }
        stage ("clean and compile") {
            steps {
                sh "mvn clean compile"
            }
        }
        stage ("build maven") {
            steps {
                sh "mvn package"
            }
        }
        stage ("doker image build") {
            steps {
                echo "hello"
                sh "docker build -t https://hub.docker.com/repository/docker/pratimadewde/docker_jenkins_springboot:${BUILD_NUMBER}"
            }
        }
        stage ("docker login"){
            steps {
                withCredentials([string(credentialsId: 'DockerCreds', variable: 'dockerpwd')]) {
                     sh "docker login -u pratimadewde -p ${dockerpwd}"
                 }
            }
        }
        stage ("docker image push"){
            steps{
                sh "docker push https://hub.docker.com/repository/docker/pratimadewde/docker_jenkins_springboot:${BUILD_NUMBER}"
            }
        }
        stage ("docker deploy"){
            steps {
                sh "docker run -itd -p 8081:8080 https://hub.docker.com/repository/docker/pratimadewde/docker_jenkins_springboot:${BUILD_NUMBER}"
            }
        }

    }

//     stages ("test") {
//         steps {
//             step {
//                 sh "junit ..."
//             }
//         }
//     }

}
