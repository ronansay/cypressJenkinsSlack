import groovy.json.JsonOutput

def COLOR_MAP = [
    'SUCCESS': 'good', 
    'FAILURE': 'danger',
]

def getBuildUser() {
    return currentBuild.rawBuild.getCause(Cause.UserIdCause).getUserId()
}

pipeline {
  agent any

  environment {
        BUILD_USER = ''
    }
  
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

        script {
                BUILD_USER = getBuildUser()
            }

            slackSend channel: '#random',
                color: COLOR_MAP[currentBuild.currentResult],
                message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} by ${BUILD_USER}\n Tests:${SPEC} executed at ${BROWSER} \n More info at: ${env.BUILD_URL}HTML_20Report/"


        publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: true, reportDir: 'cypress/reports', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
    }
  }
  
   
}