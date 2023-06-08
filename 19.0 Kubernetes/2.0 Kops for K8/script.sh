#!/bin/bash
CLUSTER_NAME="kubepro.devopstest.live"
STATE_BUCKET="s3://shanana-vprofile-kops-state"
AVAILABILITY_ZONES="us-east-2a,us-east-2b"
NODE_COUNT=2
NODE_SIZE="t3.small"
MASTER_SIZE="t3.medium"
DNS_ZONE="kubepro.devopstest.live"
NODE_VOLUME_SIZE=8
MASTER_VOLUME_SIZE=8

ssh-keygen

# Update package lists
sudo apt update

# Install AWS CLI
sudo apt install awscli -y

# Configure AWS CLI with provided values
aws configure set aws_access_key_id YOUR_ACCESS_KEY
aws configure set aws_secret_access_key YOUR_SECRET_KEY
aws configure set default.region YOUR_REGION
aws configure set default.output_format json


sudo apt-get update
sudo apt-get install -y ca-certificates curl

curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubectl



kops create cluster \
  --name="${CLUSTER_NAME}" \
  --state="${STATE_BUCKET}" \
  --zones="${AVAILABILITY_ZONES}" \
  --node-count="${NODE_COUNT}" \
  --node-size="${NODE_SIZE}" \
  --master-size="${MASTER_SIZE}" \
  --dns-zone="${DNS_ZONE}" \
  --node-volume-size="${NODE_VOLUME_SIZE}" \
  --master-volume-size="${MASTER_VOLUME_SIZE}"

# this will create the cluster
kops update cluster --name kubepro.devopstest.live --state="${STATE_BUCKET}" --yes --admin

sleep 600

kops validate cluster --state="${STATE_BUCKET}"