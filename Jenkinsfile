def apiKey= "${env.apiKey}"
def apiVersion= "${env.apiVersion}"
def oasVersion= "${env.oasVersion}"
def isPrivate= "${env.isPrivate}"
def owner= "${env.owner}"

node ("${env.SLAVE}") {
    stage ('Checkout') {
        checkout scm
    }
    stage ('Post document to SwaggerHub'){
        script {
            sh 'sh toSwaggerHub.sh $apiKey $apiVersion $oasVersion $isPrivate $owner'
        }
    }
}
