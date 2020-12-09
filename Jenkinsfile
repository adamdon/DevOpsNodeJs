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
		
		
		
		
		stage('SonarQube Testing') 
		{
			environment 
			{
				scanner = tool 'SonarQube'
			}
			
			steps 
			{
				withSonarQubeEnv('sonarqube') 
				{
					sh "/sonar-scanner-3.3.0.1492-linux/bin/sonar-scanner -D sonar.login=admin -D sonar.password=admin"
				}
				 
			}
		}
		
		
		
			
	}
}
