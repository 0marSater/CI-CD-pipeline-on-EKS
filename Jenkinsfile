pipeline {
    agent any

    environment {
        def commitHash = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim() 
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }


        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image with the commit hash as the tag
                    sh "docker build . --file Dockerfile --tag nodejs:${commitHash}"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_ID', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        echo "Log in to dockerhub repo ..."
                        sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"

                        echo "Tagging the image"
                        sh "docker tag nodejs:${commitHash} omarsater/private-repo:v-${commitHash}"

                        echo "Pushing to dockerhub ..."
                        sh "docker push omarsater/private-repo:v-${commitHash}"
                    }
                }
            }
        }

        stage('Deploy on EKS') {
            steps {
                script {
                    ssh """
                        cd /k8s/app &&
                        kubectl apply -f app-ns.yaml &&
                        kubectl create secret docker-registry my-registery-key --namespace app-ns --docker-server=https://index.docker.io/v1/ --docker-username=omarsater --docker-password=dckr_pat_NT57swECifLHxNT9yFBH372copU --docker-email=omar.buis22@gmail.com &&
                        kubectl apply -f app-sc.yaml &&
                        kubectl apply -f app-pvc.yaml &&
                        kubectl apply -f app-deployment.yaml &&
                        kubectl apply -f app-svc.yaml 
                    """     
                }
            }
        }
    }

}
