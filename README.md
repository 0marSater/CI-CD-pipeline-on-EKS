# CI-CD-pipeline-on-EKS
This serves as a demonstration project illustrating the step-by-step development and deployment of a Flask application on AWS EKS through a Jenkins pipeline. The project harnesses the capabilities of Jenkins plugins, specifically those designed for Kubernetes, including the Kubernetes CLI.

---
## Infrastructure 
Utilized AWS resources for deploying and running the application. The infrastructure was set up as follows:

1. Virtual Private Cloud (VPC): A dedicated and isolated VPC was established to ensure secure networking and resource isolation.
2. AWS EKS Deployment: The application was deployed on an AWS EKS Kubernetes cluster to leverage container orchestration capabilities.
> For more details about the infrastructure, you can navigate to [README.md](./terraform/README.md).

## Docker Integration
Implemented containerization and pushed the [Docker image](./Dockerfile) for the application to a private DockerHub repository, ensuring secure and efficient management of the application's containers.


## Jenkins 
Implemented Jenkins for Continuous Integration and Continuous Deployment (CI/CD) to ensure a streamlined and efficient software development and delivery process, harnessing the powerful plugins to enhance its capabilities. [Pipeline Image](https://prnt.sc/2rERqveJyS0o)

> For more details about jenkisn pipeline stages, you can navigate to [README.md](./Jenkins/README.md).

---
## Getting Started
To begin, follow these steps:
- Clone project.
- Initiate the infrastructure provisioning with the command `terraform apply --auto-approve`, resulting in the creation of 35 resources on AWS.
- Configure the /kube/config file to reference the created cluster by executing the command: ` aws eks update-kubeconfig --region eu-west-1 --name my-cluster` #
- Access to Jenkins GUI by Extracting the LoadBalancer URL: `kuebctl get svc -n jenkins-ns` #

## Configure Jenkins GUI 
- Navigate to Manage Jenkins and install the follwoing plugin
  1. Kubernetes.
  2. Kubernetes CLI.
- Naviage to manage Cloud and set up new Cloud as shown below: #
  1. test your connection, it should be successully connect, else check the configuration again.
    > You don't need to specify the Cluster URL, as Jenkins is running as a pod and can connect to it seamlessly.
- Generate credentials with the id ***KUBECONFIGFILE***, selecting the type as ***Secret File***, and upload the file by browsing to ./kube/config file.
- Create a pipeline project
- Start build your project, Jenkisn will use kubectl pod to run kubectl command to deploy app manifest.
  > Refere to pod manifest [here](./kainko-kubectl.yaml)

## Clean up 
- To Clean up resources, execute  ` terraform destroy --auto-approve `. 
