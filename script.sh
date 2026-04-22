#!/bin/bash

echo "Checking if pom.xml file is present in the directory"

if [ -f "pom.xml" ]; then
echo "pom.xml found"
echo "Running Maven build..."

if mvn clean install; then
    echo "Build successful. Deploying..."
if mvn tomcat7:deploy; then 
	echo "Deployment successful" 
	else 
		echo "Deployment failed" 
fi
else
    echo "Build failed. Deployment skipped."
fi

else
echo "pom.xml not found in the current directory"
fi
