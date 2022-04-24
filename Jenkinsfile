pipeline {
    agent {label"doc"} 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('venket-docker-hub')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/yvenkets/docker_bio.git'
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t 589589/docker_bio:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push 589589/docker_bio:$BUILD_NUMBER'
            }
        }
        stage('remove docker container') {
            steps{
                sh 'docker stop shivam'
                sh 'docker rm shivam'
            }
        }
        stage('run docker') {
            steps{
                sh 'docker run -d --name shivam -p 80:80 589589/docker_bio:$BUILD_NUMBER '
            }
        }
        
}
post {
        always {
            sh 'docker logout'
        }
    }
}
