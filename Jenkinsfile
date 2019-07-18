pipeline {
    agent {
        docker { image 'gunas42q/terraform-awscli' }
    }

stages {
        stage ('Clone') {
            steps {
                git branch: 'master', url: "https://github.com/gunasekar89/testme.git"
            }
        }
    	stage('Run AWS CLI') {

        steps {
            withCredentials([[
                $class: 'AmazonWebServicesCredentialsBinding',
                credentialsId: 'aws_prod',
                accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
            ]]) {             
                sh 'terraform init'
                sh 'terraform plan'
                
            } // withCredentials
        } // steps

    } // stage
}
}
