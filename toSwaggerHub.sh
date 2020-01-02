#!/bin/bash

apiKey=$1
apiVersion=$2
oasVersion=$3
isPrivate=$4
owner=$5
apiPath="OAS3.0"


for file in ${apiPath}/*.yaml; do
    apiName="$(echo $file | cut -d "/" -f 2 | cut -d "." -f 1)"
    #echo "FileName:"$apiName
    apiContent="$(cat ${apiPath}/${apiName}.yaml)"
    #echo "apiContent : "$apiContent
    swaggerUrl="https://api.swaggerhub.com/apis/${owner}/${apiName}?isPrivate=${isPrivate}&version=${apiVersion}&oas=${oasVersion}&force=true"
    
    curl -X POST "https://api.swaggerhub.com/apis/${owner}/${apiName}?isPrivate=${isPrivate}&version=${apiVersion}&oas=${oasVersion}&force=true" -H "accept:application/json" -H "Authorization:${apiKey}" -H "Content-Type:application/yaml" -d "${apiContent}"
done