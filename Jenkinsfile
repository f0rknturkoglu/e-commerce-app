pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'python3 -m venv venv'
                sh '. venv/bin/activate && pip install -r requirements.txt'
                sh '. venv/bin/activate && pip install pytest'
            }
        }
        stage('Test') {
            steps {
                sh '. venv/bin/activate && pytest tests/'
            }
        }
    }
}
