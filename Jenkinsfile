pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/f0rknturkoglu/e-commerce-app.git', branch: 'main'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Test') {
            steps {
                sh 'pytest --cov=./ --cov-report=xml tests/'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'sonar-scanner'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t e-commerce-app .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([ credentialsId: "docker-hub-credentials", url: "" ]) {
                    sh 'docker tag e-commerce-app f0rknn/e-commerce-app:latest'
                    sh 'docker push f0rknn/e-commerce-app:latest'
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker stop e-commerce-app || true'
                sh 'docker rm e-commerce-app || true'
                sh 'docker run -d -p 5000:5000 --name e-commerce-app f0rknn/e-commerce-app:latest'
            }
        }
    }
}
