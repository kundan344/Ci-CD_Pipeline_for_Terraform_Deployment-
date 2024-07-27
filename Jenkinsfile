pipeline {
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
