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
                        aws --version &&
                        kubectl config view && 

                    '''
                    }
                }
            }
        }
    }
}


