pipeline {
    agent {
        kubernetes {
            yamlFile 'kaniko-kubectl.yaml'
        }
    }
    environment {
        def commitHash = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build & Push Docker Image') {
            steps {
                container(name: 'kaniko', shell: '/busybox/sh'){
                    sh '''
                        /kaniko/executor --dockerfile `pwd`/Dockerfile --context `pwd` --destination=omarsater/private-repo:python-${commitHash}
                    '''
                }
            }
        }

       
        stage('Deploy on EKS') {
            steps {
                container (name:'kubectl', shell: '/bin/sh' ) {
                    withKubeConfig([credentialsId: 'KUBECONFIGFILE']) {
                    sh '''
                        # Install curl and unzip packages
                        apt update && apt install curl -y && apt install unzip -y &&
                    
                        # Install aws-cli v2 using curl
                        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&
                        unzip awscliv2.zip &&
                         ./aws/install &&
                        
                        # Modify app-deployment.yaml file with the image tag.
                        sed -i 's/python-v1.1/python-${commitHash}/' /k8s/app/app-deployment.yaml &&

                        # Deploy app
                        kubectl apply -f ${WORKSPACE}/k8s/app/app-ns.yaml &&  
                        kubectl apply -f ${WORKSPACE}/k8s/app/app-secret.yaml &&  
                        kubectl apply -f ${WORKSPACE}/k8s/app/app-sc.yaml &&  
                        kubectl apply -f ${WORKSPACE}/k8s/app/app-pvc.yaml &&  
                        kubectl apply -f ${WORKSPACE}/k8s/app/app-deployment.yaml &&  
                        kubectl apply -f ${WORKSPACE}/k8s/app/app-svc.yaml   
                    '''
                    }
                }
            }
        }
    }
}


