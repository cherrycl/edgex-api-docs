node {
    stage ('Checkout') {
        checkout scm
    }
    withCredentials([string(credentialsId: 'swaggerhub-api-key', variable: 'APIKEY')]) {
        echo "APIKEY: ${APIKEY}"
    }

    stage ('Post document to SwaggerHub'){
        script {
            sh "sh toSwaggerHub.sh ${APIKEY} ${env.APIVERSION} ${env.OASVERSION} ${env.ISPRIVATE} ${env.OWNER}"
        }
    }
}
