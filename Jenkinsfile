pipeline {
    agent {
        docker { image: koosiedemoer/netty-tcnative-alpine }
    }
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
                sh 'docker build -t devops-image3'
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
                sh
            }
        }
    }
}