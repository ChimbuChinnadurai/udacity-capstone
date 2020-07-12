# Project Details

This repo contains all the source code i have used for my final project in the udacity Cloud DevOps Engineer Nanodegree Program

#

The actual app is a simple app which returns response to the api calls with the version details and the app is containerised and can be run in a kubernetes cluster.

The application code is resides in the hello-app folder and it also contains the dockerfile 

I have used helm charts to install the application in the kubernetes cluster instead of the kubectl. Helm is the best way to find, share, and use software built for Kubernetes

#

The cloudformation folder contains the templates i used to launch an EKS cluster in AWS

#

I have used jenkins for CI/CD and the pipeline code avaiable in the Jenkinsfile

The docker container is stored my public docker container repo simbu1290/capstone

As part of the deployment the image is deployed to the kubernetes cluster

#

The tests folder contains the screenshots of the tests i have manually done for this project. 

I have used rolling deployment strategy in this project and it can be verified in the screenshots .
