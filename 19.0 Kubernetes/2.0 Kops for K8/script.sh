#!/bin/bash
CLUSTER_NAME="project.devopstest.live"
STATE_BUCKET="s3://bucket-shanana"
AVAILABILITY_ZONES="us-west-1a,us-west-1c"
NODE_COUNT=2
NODE_SIZE="t3.small"
MASTER_SIZE="t3.medium"
DNS_ZONE="project.devopstest.live"
NODE_VOLUME_SIZE=8
MASTER_VOLUME_SIZE=8

ssh-keygen

# Update package lists
sudo apt update

# Install AWS CLI
sudo apt install awscli -y

# Configure AWS CLI with provided values
aws configure set aws_access_key_id AKIA2TMJFJSUPP4RVS67
aws configure set aws_secret_access_key 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
aws configure set default.region us-west-1
aws configure set default.output_format json


sudo apt-get update
sudo apt-get install -y ca-certificates curl

curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubectl

curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops
sudo mv kops /usr/local/bin/kops

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
kops update cluster --name project.devopstest.live --state="${STATE_BUCKET}" --yes --admin

sleep 300

kops validate cluster --state="${STATE_BUCKET}"