# Terraform Strcuture
The project structure is organized as follows:

![strcuture](./Images/terrafromStrucutre.png)

The `modules` directory contains subfolders for each module. Each module has its terraform configuration files, which define the module's configuration.

The root directory contains the following files:

- `main.tf`: The main configuration file that declares all the modules used in the project.
- `variables.tf`: The file where you can define and customize variables used across the project.
- `output.tf`: The file specifying the outputs to be displayed after provisioning the infrastructure.
- `terraform.tfvars`: The file where you can set the values for the variables defined in `variables.tf`.
## Usage

To use this Terraform project:
   ```
   terraform init
   terraform plan
   terraform apply --auto-approve
  ```

The Terraform configuration creates a VPC, establishes an EKS cluster with one worker node, and deploys the Jenkins image directly onto the cluster in the namespace ***jenkins-ns***, including necessary Service Account and Role.
