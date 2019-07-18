pipeline {
	agent {
		docker {
			image 'gunas42q/terraform-awscli'
		}
	}

	stages {

		stage('init_and_plan') {
			steps {
				withCredentials([
					[
						$class: 'AmazonWebServicesCredentialsBinding',
						credentialsId: 'aws_prod',
						accessKeyVariable: 'AWS_ACCESS_KEY_ID',
						secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
					]
				]) {
					sh 'terraform init'
					sh 'terraform plan'
				}

			}

		}
		stage('approval') {
			options {
				timeout(time: 1, unit: 'HOURS')
			}
			steps {
				input 'approve the plan to proceed and apply'
			}
		}
		stage('apply') {
			steps {
				withCredentials([
					[
						$class: 'AmazonWebServicesCredentialsBinding',
						credentialsId: 'aws_prod',
						accessKeyVariable: 'AWS_ACCESS_KEY_ID',
						secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
					]
				]) {
					sh 'terraform apply -auto-approve'
					sh 'terraform plan -destroy'
				}

			}

		}
		stage('approval') {
			options {
				timeout(time: 1, unit: 'HOURS')
			}
			steps {
				input 'approve the plan to proceed and apply'
			}
		}
		stage('Destroy') {
			steps {
				withCredentials([
					[
						$class: 'AmazonWebServicesCredentialsBinding',
						credentialsId: 'aws_prod',
						accessKeyVariable: 'AWS_ACCESS_KEY_ID',
						secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
					]
				]) {
					sh 'terraform destroy'
				}

			}

		}
	}
}
