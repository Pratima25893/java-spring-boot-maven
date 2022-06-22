pipeline {

    agent any

    tool {
        maven "Maven 3.0.5"
    }

    stages {
        stage("checkut SCM") {
            step{
                git branch: 'main', credentialsId: 'Gitnew', url: 'https://github.com/Pratima25893/java-spring-boot-maven'
            }
        }
    }

    stages {
        stage ("clean and compile") {
            steps {
                sh "mvn clean compile"
            }
        }
    }

    stages {
        stages ("build maven") {
            steps {
                sh "mvn package"
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

    stages {
        stage ("doker image build") {
            steps {
                echo "hello"
                sh "docker build -it pratimadewde/project1/springboot-maven:${BUILD_NUMBER}"
            }
        }
    }

    stages {
        stage ("docker login"){
            steps {
                withCredentials([string(credentialsId: 'DockerCreds', variable: 'dockerpwd')]) {
                     sh "docker login -u pratimadewde -p ${dockerpwd}"
                 }
            }
        }
    }

    stages {
        stage ("docker image push"){
            steps{
                sh "docker push pratimadewde/project1/springboot-maven:${BUILD_NUMBER}"
            }
        }
    }

    stages {
        stage ("docker deploy"){
            steps {
                sh "docker run -itd -p 8081:8080 pratimadewde/project1/springboot-maven:${BUILD_NUMBER}"
            }
        }
    }
}