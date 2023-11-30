pipeline {
    agent {
        kubernetes {
            yamlFile 'kaniko-kubectl.yaml'
        }
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        // stage('Build & Push Docker Image') {
        //     steps {
        //         container(name: 'kaniko', shell: '/busybox/sh'){
        //             sh '''
        //                 /kaniko/executor --dockerfile `pwd`/Dockerfile --context `pwd` --destination=omarsater/private-repo:python-v1.1
        //             '''
        //         }
        //     }
        // }

       
        stage('Deploy on EKS') {
            steps {
                container (name:'kubectl', shell: '/bin/sh' ) {
                    withCredentials([file(credentialsId: 'KUBECONFIGFILE', variable: 'KUBECONFIG')]) {
                    sh '''
                        echo $KUBECONFIG > /.kube/config
                    '''
                    }
                }
            }
        }
    }
}


