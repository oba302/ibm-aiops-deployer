#!/bin/bash

export CONT_VERSION=0.5

# Create the Image
docker buildx build --platform linux/amd64 -t niklaushirt/ibmaiops-webhook-python:$CONT_VERSION --load .
docker push niklaushirt/ibmaiops-webhook-python:$CONT_VERSION

# Run the Image

docker build -t niklaushirt/ibmaiops-webhook-python:$CONT_VERSION  .

docker run -p 8080:8000 -e TOKEN=test niklaushirt/ibmaiops-webhook-python:$CONT_VERSION

# Deploy the Image
oc apply -n default -f create-cp4mcm-event-gateway.yaml





exit 1
