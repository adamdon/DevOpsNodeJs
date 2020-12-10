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
		
		stage('Build image') 
		{
			steps
			{
				app = docker.build("adamdon/DevOpsNodeJs")
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
		
		
		
			
	}
}
