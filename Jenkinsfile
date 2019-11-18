pipeline {
    agent any
    stages {
        stage ('git') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage ('making artifact') {
            steps {
                sh 'mvn package'
            }
        }
        stage ('docker image build'){
            steps {
                sh 'docker build -t devops-image3 .'
                sh 'docker tag devops-image3 etashsingh29/devops-image3'
            }
        }
        stage ('docker push') {
            steps {
                sh 'docker push etashsingh29/devops-image3'
            }
        }
        stage ('docker run') {
            steps {
                sh '''if [ ! "$(docker ps -q -f name=etash-image3)" ]; then
                                               if [ $(docker inspect -f '{{.State.Running}}' etash-image3) = "true" ]; then
                                                   docker rm -f etash-image3
                                               fi
                                                   docker run -d -p 5000:4200 --name etash-image3 etashsingh29/devops-image3
                                               fi'''
            }
        }
    }
}