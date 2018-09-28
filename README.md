# Serverless Workshop Part 2 - sam

## Objectives
- Add dynamo db table with REST-like endpoints
- Create few endpoints (Create & List users)
- Add proper IAM permissions to your lambda function
- Pass the table name as environment var, so it's unique for each deployment stage
- Pass the stage name as environment var for the same reasons
- Set path specific routing for different api calls (Dedicated API endpoint)
- Discuss benefits and downsides of each approach

## Step 1 - Check updates we made
- Check `template.yml` file compared to Part 1
- Check `index.js` function compared to Part 1

## Step 2 - Re-deploy your application
Install dependencies
```bash
npm install
npm install --save aws-sdk body-parser
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

## Step 3 - Test the new functionality
```bash
export BASE_DOMAIN=<your-dev-endpoint>
# Create user
curl -H "Content-Type: application/json" -X POST ${BASE_DOMAIN}/users -d '{"userId": "alexdebrie1", "name": "Alex DeBrie"}'
# List user
curl -H "Content-Type: application/json" -X GET ${BASE_DOMAIN}/users/alexdebrie1
```
