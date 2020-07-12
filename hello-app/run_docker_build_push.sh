#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Create dockerpath
# appversion=<your docker ID/path>

appversion=simbu1290/mlapp:${VERSION}

# Step 2:
# Build image and add a descriptive tag

docker build -t $dockerpath .

# Step 3:
# Push image to a docker repository

docker push $dockerpath