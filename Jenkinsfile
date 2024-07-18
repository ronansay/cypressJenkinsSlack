pipeline {
  agent any
  
  parameters{
    string(name: 'SPEC', defaultValue: 'cypress/e2e/*.js', description:"Enter Script path you want to run")
    choice(name: 'BROWSER', choices:['chrome', 'firefox', 'edge'], description:"Enter Browser you want to run")
  }

  options {ansiColor('xterm')}

  stages {
    stage('Build') {
        steps{
            echo 'Building the Application'
        }
     }
     stage('Testing') {
        steps {
            bat "npm i"
            bat "npx cypress run --browser ${BROWSER} --spec ${SPEC}"
        }
     }
     
     stage('Deploying') {
        steps{
            echo 'Deploy the Application'
        }
        
     }
  }
  post{
    always{
        publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: true, reportDir: 'cypress/reports', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
    }
  }
  
   
}