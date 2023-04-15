# Week 6 — Deploying Containers
ecr repository created:
```
$ aws ecr create-repository   --repository-name cruddur-python   --image-tag-mutability MUTABLE
{
    "repository": {
        "repositoryArn": "arn:aws:ecr:us-east-1:41091XXXXX:repository/cruddur-python",
        "registryId": "41091XXXXX",
        "repositoryName": "cruddur-python",
        "repositoryUri": "41091XXXXX.dkr.ecr.us-east-1.amazonaws.com/cruddur-python",
        "createdAt": "2023-04-15T14:53:07+00:00",
        "imageTagMutability": "MUTABLE",
        "imageScanningConfiguration": {
            "scanOnPush": false
        },
        "encryptionConfiguration": {
            "encryptionType": "AES256"
        }
    }
}
```
Login to docker succeded:
````
$ aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com"
WARNING! Your password will be stored unencrypted in /home/gitpod/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
````
Python 3.10 image pushed
````
$ docker push $ECR_PYTHON_URL:3.10-slim-buster
3.10-slim-buster: digest: sha256:7857e9a198fc4b06818b0e064c13b21485b72c7fdb1f51d3b13c985XXXXX size: 1370
```
Role created:
```
$ aws iam create-role --role-name CruddurServiceExecutionPolicy --assume-role-policy-document file://aws/policies/service-assume-role-execution-policy.json
{
    "Role": {
        "Path": "/",
        "RoleName": "CruddurServiceExecutionPolicy",
        "RoleId": "AROAV7LEQWEECEJAZJ4FK",
        "Arn": "arn:aws:iam::41091XXXXX:role/CruddurServiceExecutionPolicy",
        "CreateDate": "2023-04-15T16:21:25+00:00",
        "AssumeRolePolicyDocument": {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Action": [
                        "sts:AssumeRole"
                    ],
                    "Effect": "Allow",
                    "Principal": {
                        "Service": [
                            "ecs-tasks.amazonaws.com"
                        ]
                    }
````
