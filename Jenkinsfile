pipeline 
{
    environment
	{
		registry = "adamdon/DevOpsNodeJs"
	}
	agent any

	
    stages
	{
		stage('Checkout SCM')
		{
				
			steps
			{
				checkout([$class: 'GitSCM',
				branches: [[name: '*/main']],
				doGenerateSubmoduleConfigurations: false,
				extensions: [], 
				submoduleCfg: [], 
				userRemoteConfigs: [[url: 'https://github.com/adamdon/DevOpsNodeJs']]])            
			}
		}
		
		stage('Build Docker Image') 
		{
						
			steps
			{
				echo "Building Docker Image..."
				script 
				{
					app = docker.build("adamdon/dev-ops-node-js")
				}
			}
		       			
    		}
		
		
		
		stage('Push Docker Image')
		{
            		steps 
			{
				echo 'Pushing Image to Docker...'
				script 
				{
					docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials')
					{
						app.push("${env.BUILD_NUMBER}")
						app.push("latest")
					}
				}
			}
		}		
		
		
		
		stage('SonarQube Testing') 
		{
			environment 
			{
				scanner = tool 'SonarQube'
			}
			
			steps 
			{
				withSonarQubeEnv('SonarQube') 
				{
					sh "${scanner}/bin/sonar-scanner -D sonar.login=admin -D sonar.password=admin"
				}
			}
		}
		
		
		
		
		
		stage("Deploying new image to Kubernetes") 
		{
				steps
				{
					sh 'ssh ubuntu@ec2-52-21-70-217.compute-1.amazonaws.com kubectl set image deployment/dev-ops-node-js dev-ops-node-js=adamdon/dev-ops-node-js:latest'
				}
		}
		
		
		
		
		
		
		
		

		
		
		
			
	}
}
