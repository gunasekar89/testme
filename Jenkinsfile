pipeline {
    agent {
        docker { image 'gunas42q/terraform-awscli' }
    }

stages {
        stage ('Clone') {
            steps {
                git branch: 'tomcat', url: "https://github.com/gunasekar89/terra.git"
            }
        }
    	stage('Run AWS CLI') {

        environment {
            AWS_DEFAULT_REGION = "ap-south-1"
        }

        steps {
            withCredentials([[
                $class: 'AmazonWebServicesCredentialsBinding',
                credentialsId: 'aws_prod',
                accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
            ]]) {             
                sh 'terraform init'
                
            } // withCredentials
        } // steps

    } // stage
}
}
