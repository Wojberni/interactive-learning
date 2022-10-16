openApiGenerator="6.2.0"
fileName="openapi-generator-cli-$openApiGenerator.jar"

openAPIFile="http://localhost:8080/v3/api-docs"
outputDir="api"

if test -f $fileName; then
    echo "Already downloaded"
else
    echo "Downloading OpenApiGenerator ..."
    curl -O "https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/$openApiGenerator/openapi-generator-cli-$openApiGenerator.jar"
fi


java -jar $fileName generate \
    -i $openAPIFile \
    -g dart \
    -o $outputDir \
    --additional-properties=pubName=learning_api

flutter pub get
flutter pub run build_runner build