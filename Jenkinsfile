pipeline {
    agent {
        label 'devopstest'
    }

    tools {
        git 'LinuxGit'
    }

    environment {
        DOCKER_IMAGE = "shivareddy214/java-k8s-app"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:$BUILD_NUMBER .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-credentials',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login \
                        -u "$DOCKER_USER" \
                        --password-stdin

                        docker push $DOCKER_IMAGE:$BUILD_NUMBER
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                    kubectl set image deployment/java-k8s-app \
                    java-k8s-app=$DOCKER_IMAGE:$BUILD_NUMBER

                    kubectl rollout status deployment/java-k8s-app \
                    --timeout=120s
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                    kubectl get deployment java-k8s-app
                    kubectl get pods -l app=java-k8s-app
                '''
            }
        }
    }
}
