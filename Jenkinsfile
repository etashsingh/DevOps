pipeline {
    agent { node { label 'node1' } }
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
                sh 'docker tag devops-image3 etashsingh29/devops-image3:latest'
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
                                               if [ "$(docker ps -aq -f status=exited -f name=etash-image3)" ]; then
                                                   docker rm etash-image3
                                               fi
                                                   docker run -d -p 9090:4200 --name etash-image3 etashsingh29/devops-image3
                                               fi'''
            }
        }
    }
    post {
        always {
                 junit 'target/surefire-reports/*.xml'
        }
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