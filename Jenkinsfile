def apiKey= "${env.apiKey}"
def apiVersion= "${env.apiVersion}"
def oasVersion= "${env.oasVersion}"
def isPrivate= "${env.isPrivate}"
def owner= "${env.owner}"
def changeDetected

node ("${env.SLAVE}") {
    stage ('Checkout') {
        checkout ([
            $class: 'GitSCM',
            branches: [[name: "refs/${env.BUILD}"]],
            extensions: [
                [$class: 'PathRestriction', excludedRegions: '', includedRegions: 'OAS3.0/.*'],
                [$class: 'DisableRemotePoll']
            ],
            submoduleCfg: [],
            userRemoteConfigs: [[url: "${env.REPO}", credentialsId: "${env.GIT_KEY}"]]
        ])
    }

    stage ('Check files changed or not'){
        script {
            changeDetected = edgex.didChange('^OAS3.0/')
        }
    }
    stage ('Post document to SwaggerHub'){
        when { expression { changeDetected }}
        script {
            sh 'sh toSwaggerHub.sh $apiKey $apiVersion $oasVersion $isPrivate $owner'
        }
    }
}

def loadGlobalLibrary(branch = '*/master') {
    library(identifier: 'edgex-global-pipelines@master', 
        retriever: legacySCM([
            $class: 'GitSCM',
            userRemoteConfigs: [[url: 'https://github.com/edgexfoundry/edgex-global-pipelines.git']],
            branches: [[name: branch]],
            doGenerateSubmoduleConfigurations: false,
            extensions: [[
                $class: 'SubmoduleOption',
                recursiveSubmodules: true,
            ]]]
        )
    )
}