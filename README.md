# Ops
Ops repo
- Application k8s manifest.


# Helm
- Requirements:
    + helmv3
    + kubectl
    + aws-cli installed and configured.

- To connect with eks cluster run: `aws eks --region ap-southeath-1 update-kubeconfig --name eks-cluster`

- Install ingress-nginx for eks: `kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.44.0/deploy/static/provider/aws/deploy.yaml`

- Install application : `helm install webapp ./webapp`

# Terraform 

- Requirements: 
    + aws-cli installed and configured.
    + your IAM account have enough permission with s3api and dynamodb.

- Move to `terraform/env/prodcution` folder and do below steps:

    1. Run `./create-backend.sh` to generate the `backend_config.tf` file.
    2. Run `terraform init`
    3. Run `terraform plan -var-file=production.tfvars` to check what will be create.
    4. Run `terraform plan -var-file=production.tfvars` to create infrastructure.


# CI/CD

- Ideal: Jenkins declarative pipeline with `Jenkinsfile` in root of each app repo.

- Stages: Buid/Push docker image to ECR, Jenkins trigger Deploy stage to k8s cluster by helm.

- Reason: Simple syntax, scalable, easy to modify and develop with Shared Library.