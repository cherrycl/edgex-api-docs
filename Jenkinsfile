def apiKey= "${env.apiKey}"
def apiVersion= "${env.apiVersion}"
def oasVersion= "${env.oasVersion}"
def isPrivate= "${env.isPrivate}"
def owner= "${env.owner}"

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
    stage ('Post document to SwaggerHub'){
        script {
            sh 'sh toSwaggerHub.sh $apiKey $apiVersion $oasVersion $isPrivate $owner'
        }
    }
}
