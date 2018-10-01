# Serverless Workshop Part 3 - sam

## Objectives
- Split App into multiple functions
- Understand how to protect your api with API key - [OpenIssue](https://github.com/awslabs/serverless-application-model/issues/49)
- Add simple cicd pipeline for gitlab

## Step 1 - Check updates we made
- Check `template.yaml` file and check changes we made


## Step 2 - Re-deploy your application with updated config
Package app
```bash
sam package \
    --template-file template.yaml \
    --output-template-file my-express-app.yaml \
    --s3-bucket $BUCKET_NAME
```

Deploy your application

```bash
export STAGE='<your-name>-sam'
sam deploy \
    --template-file my-express-app.yaml \
    --stack-name $STAGE \
    --capabilities CAPABILITY_IAM
```
### Step 3 - Test the new functionality
```bash
export BASE_DOMAIN=<your-dev-endpoint>
# Create user
curl -H "Content-Type: application/json" -X POST ${BASE_DOMAIN}/users -d '{"userId": "alexdebrie1", "name": "Alex DeBrie"}'
# List user
curl -H "Content-Type: application/json" -X GET ${BASE_DOMAIN}/users/alexdebrie1
```
