#!/bin/bash

# Define your Docker Hub username
DOCKER_HUB_USER="dattm24"
IMAGE_NAME="postgresql-client"

# Loop through versions 9 to 17
for VERSION in {9..17}; do
    echo "Building PostgreSQL client $VERSION..."
    
    # Build the image with the specified PostgreSQL version
    docker build --build-arg PG_MAJOR=$VERSION -t $DOCKER_HUB_USER/$IMAGE_NAME:$VERSION .

    if [ $? -ne 0 ]; then
        echo "Failed to build PostgreSQL client $VERSION. Skipping..."
        continue
    fi

    echo "Pushing PostgreSQL client $VERSION to Docker Hub..."
    
    # Push the built image to Docker Hub
    docker push $DOCKER_HUB_USER/$IMAGE_NAME:$VERSION

    if [ $? -ne 0 ]; then
        echo "Failed to push PostgreSQL client $VERSION. Skipping..."
        continue
    fi

    echo "Successfully pushed $DOCKER_HUB_USER/$IMAGE_NAME:$VERSION"
done

echo "All builds completed."

