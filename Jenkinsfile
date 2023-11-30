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
                container (name:'kubectl' ) {
                    sh 'echo "hi"'
                }
            }
        }
    }
}


//kubectl create secret docker-registry my-registery-key --namespace jenkins-ns --docker-server=https://index.docker.io/v1/ --docker-username=omarsater --docker-password=dckr_pat_NT57swECifLHxNT9yFBH372copU --docker-email=omar.buis22@gmail.com &&
