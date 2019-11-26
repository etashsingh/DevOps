pipeline {
    agent {
        node { label 'node1' }
    }
    tools {
        maven 'maven'
    }
    stages {
        stage ('git') {
            steps {
                sh 'mvn clean install'
                sh 'pwd'
                sh 'whoami'
                sh 'which docker'
            }
        }
        stage ('making artifact') {
            steps {
                sh 'mvn package'
            }
        }
        stage ('docker image build'){
            steps {
                sh 'docker build -t devops-image4 .'
                sh 'docker tag devops-image4 etashsingh29/devops-image4'
            }
        }
        stage ('docker push') {
            steps {
                sh 'docker push etashsingh29/devops-image4'
            }
        }
        stage ('docker run') {
            steps {
                sh '''if [ ! "$(docker ps -q -f name=etash-image4)" ]; then
                                               if [ "$(docker ps -aq -f status=exited -f name=etash-image4)" ]; then
                                                   docker rm etash-image4
                                               fi
                                                   docker run -d -p 4200:4200 --name etash-image4 etashsingh29/devops-image4
                                               fi'''
            }
        }
    }
    post {
//         success {
//                  junit 'target/surefire-reports/*.xml'
//         }
        success {
            emailext (
                 subject: "Job '${env.JOB_NAME} ${env.BUILD_NUMBER}'",
                 body: """<p>Check console output at <a href="${env.BUILD_URL}">${env.JOB_NAME}</a></p>""",
                 to: "etash.singh@knoldus.com",
                 from: "etashsingh29@gmail.com"
            )
        }
    }
}