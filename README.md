# Prerequisites
#### AWS Account:
- Ensure you have an AWS account with the necessary permissions to create resources. 

#### Terraform:

- Install Terraform on your local machine and your Jenkins nodes.
- Create Terraform configuration files (main.tf, variables.tf, outputs.tf, backend.tf, etc.).

#### Jenkins:

- Set up Jenkins on a server.
- Install necessary plugins: Git, Pipeline, AWS Credentials.
AWS Credentials:

- Store your AWS credentials securely in Jenkins (as described in the previous answer).

## Step-by-Step Guide
1. **Write Terraform Code**
   - Create your Terraform configuration files.
    - Define your variables and provide values.
    - Configure backend for state storage.

2. **Jenkins Configuration**
  Install required plugins
        - AWS Credential
        - Terraform
  Setup AWS Credentials in Jenkins:
       - Go to Jenkins dashboard -> Manage Jenkins -> Manage Credentials -> Add Credentials.
        - Choose AWS credentials and add your AWS Access Key ID and Secret Access Key.
  
3. **Create Jenkins Pipeline**
    
    ```pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/kundan344/Ci-CD_Pipeline_for_Terraform_Deployment-.git'
            }
        }
        
        stage('Terraform Version Check') {
            steps {
                sh "terraform --version"
            }
        }
        
        stage('Terraform Init') {
            steps {
                sh "terraform init"
            }
        }
        
        stage('Terraform Validate') {
            steps {
                sh "terraform validate"
            }
        }
        
        stage('Terraform Format') {
            steps {
                sh "terraform fmt"
            }
        }
        
        stage('Terraform Plan') {
            steps {
                sh "terraform plan"
            }
        }
        
        stage('Terraform Apply/Destroy') {
            steps {
                sh "terraform ${action} --auto-approve"
            }
        }
    }
   
    }   


4. **Jenkins Job Configuration**
        - Create a new pipeline job in Jenkins.
        - Link the job to your GitHub repository.
        - Ensure the pipeline uses the Jenkinsfile from the repository.
        - Configure the job to trigger on changes (e.g., using GitHub webhooks).

5. **Triggering the Job**
         - Go to the job page.
         - Click on "Build with Parameters".
         - Select the desired action (apply or destroy) and click "Build".

![terraform cicd 1](https://i.imgur.com/1CaFtYA.png)

![terraform cicd](https://i.imgur.com/9B8VfDp.png)

