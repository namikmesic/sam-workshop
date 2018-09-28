# Serverless Workshop Part 1 - sam

## Objectives
- Install and configure sam cli
- Deploy simple application and check your AWS cloudformation stacks to see result
- Test your application

#### Step 1 - Set up Environment
- Install and configure [python and pip](https://docs.docker.com/docker-for-mac/install/)
- Install [docker for mac](https://docs.docker.com/docker-for-mac/)


#### Step 2 - Install and configure sam
Install and setup virtualenv
```bash
pip install virtualenv
virtualenv sam-workshop
source sam-workshop/bin/activate
```
Install aws cli
```bash
pip install awscli
# Now configure your aws with your dev credentials
aws configure
```
Finally Install and configure [sam](https://github.com/awslabs/aws-sam-cli/blob/develop/docs/installation.rst)

```bash
pip install aws-sam-cli
```

#### Step 3 - Deploy your application
Innitialise app and install dependencies
```bash
npm init -f
npm install --save express serverless-http
```
Create an s3 bucket
```bash
aws s3 mb s3://<your-bucket-name> --region <region-name>
export BUCKET_NAME='s3://<your-bucket-name>'

```
Package and upload your app to s3
```bash
sam package \
    --template-file template.yaml \
    --output-template-file my-express-app.yaml \
    --s3-bucket $BUCKET_NAME
```
Finally deploy your application
```bash
export STAGE='<your-name>-sam'
sam deploy \
    --template-file my-express-app.yaml \
    --stack-name $STAGE \
    --capabilities CAPABILITY_IAM
```

## Step 4 - Test your application
```bash
export BASE_DOMAIN=<your-base-domain-endpoint>
curl $BASE_DOMAIN
```
