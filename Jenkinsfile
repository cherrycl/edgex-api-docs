node {
    stage ('Checkout') {
        checkout scm
    }
    

    stage ('Post document to SwaggerHub'){
        script {
            withCredentials([string(credentialsId: 'swaggerhub-api-key', variable: 'APIKEY')]) {
                echo "APIKEY: ${APIKEY}"
                sh "sh toSwaggerHub.sh ${APIKEY} ${env.APIVERSION} ${env.OASVERSION} ${env.ISPRIVATE} ${env.OWNER}"
            }
        }
    }
}
