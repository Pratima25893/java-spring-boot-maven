pipeline {

    agent any

    tools {
        maven "maven3"
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
                sh "docker build -t pratimadewde/docker_jenkins_springboot:${BUILD_NUMBER} ."
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
                sh "docker push pratimadewde/docker_jenkins_springboot:${BUILD_NUMBER}"
            }
        }
        stage ("ansible deploy"){
            steps {
                sh "ls /var/lib/jenkins/workspace/springbootwithansible/"
                ansiblePlaybook become: false, credentialsId: 'ansiblecred', disableHostKeyChecking: true, installation: 'ansible', inventory: 'dev.inv', playbook: 'deploy-docker.yml'
            }
        }

    }
    
}
