openapiGeneratorVersion="6.2.0"
generatorFilename="openapi-generator-cli-$openapiGeneratorVersion.jar"
defaultSpecificationFile="http://localhost:8080/v3/api-docs"
outputDir="api"

specificationFile=${1:-$defaultSpecificationFile}

echo "Using specification file: $specificationFile"

if test -f $generatorFilename; then
    echo "Generator downloaded"
else
    echo "Downloading openApi generator ..."
    curl -O "https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/$openapiGeneratorVersion/openapi-generator-cli-$openapiGeneratorVersion.jar"
fi


java -jar $generatorFilename generate \
    -i $specificationFile \
    -g dart \
    -o $outputDir \
    --additional-properties=pubName=learning_api

flutter pub get
flutter pub run build_runner build