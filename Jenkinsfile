pipeline {
    agent any

    tools {
        maven 'Maven3'
    }

    environment {
        IMAGE_NAME = "banking-app"
        DOCKER_HUB = "your-dockerhub-username"
    }

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/your-username/banking-app.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t banking-app .'
            }
        }

        stage('Docker Tag') {
            steps {
                sh 'docker tag banking-app $DOCKER_HUB/banking-app:latest'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerHubCred',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {

                    sh 'echo $PASS | docker login -u $USER --password-stdin'

                    sh 'docker push $DOCKER_HUB/banking-app:latest'
                }
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker stop banking-app || true
                docker rm banking-app || true

                docker run -d \
                -p 8080:8080 \
                --name banking-app \
                $DOCKER_HUB/banking-app:latest
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Banking App Deployment Successful'
        }

        failure {
            echo '❌ Pipeline Failed'
        }
    }
}
