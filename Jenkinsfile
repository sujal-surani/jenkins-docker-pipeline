pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                echo 'Building the docker image...'
                sh 'docker build -t simple-web-app:latest .'
            }
        }

        stage('test') {
            steps {
                echo "Testing the image ..."
                sh 'docker run --rm simple-web-app:latest echo "Image built and runs successfully!"'
            }
        }

        stage('deploy') {
            steps {
                echo "Deploying to port 80 ..."
                sh 'docker stop running-web-app || true'
                sh 'docker rm running-web-app || true'
                sh 'docker run -d -p 80:80 --name running-web-app simple-web-app:latest'
            }
        }
    }
}