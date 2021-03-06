#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag

docker build -t simbu1290/capstone:$VERSION .

# Step 2:
# Push image to a docker repository

docker push simbu1290/capstone:$VERSION