pipeline {
agent any

environment {
    GITHUB_TOKEN = credentials('github-token')
}

stages {
    stage('Checkout') {
        steps {
            git url: 'https://github.com/ritvik-budda/Restaurant-Docker', credentialsId: 'github-token'
        }
    }

    stage('Build Docker Image') {
        steps {
            script {
                sh 'docker build -t restaurant-website .'
            }
        }
    }

    stage('Run Docker Image') {
        steps {
            script {
                sh 'docker run -d -p 8085:80 restaurant-website'
            }
        }
    }
}

post {
    success {
        echo 'Restaurant website build and deployment succeeded!'
    }
    failure {
        echo 'Restaurant website build or deployment failed!'
    }
}
}


