
# AWS SAM Workshop
This repository aims to help you comprehend the usage of the [AWS Serverless Application Model](https://aws.amazon.com/serverless/sam/) and determine its suitability for your particular use case.

## Steps to Follow for Participating in the Workshop
To understand the code changes that introduce new features and functionalities, it is recommended that you start by checking out the first branch and completing the objective on your own. Afterward, you can proceed to the next branch. The git diff feature can be utilized to identify the specific changes made to the codebase, thereby facilitating an easier understanding of the process.

### Branches
1. [Serverless Workshop Part 1 - sam](https://github.com/namikmesic/sam-workshop/tree/part_1_sam)
- Install and configure sam cli
- Deploy simple application and check your AWS cloudformation stacks to see result
- Test your application

1. [Serverless Workshop Part 2 - sam](https://github.com/namikmesic/sam-workshop/tree/part_2_sam)
- Add dynamo db table with REST-like endpoints
- Create few endpoints (Create & List users)
- Add proper IAM permissions to your lambda function
- Pass the table name as environment var, so it's unique for each deployment stage
- Pass the stage name as environment var for the same reasons
- Set path specific routing for different api calls (Dedicated API endpoint)
- Discuss benefits and downsides of each approach
1. [Serverless Workshop Part 3 - sam](https://github.com/namikmesic/sam-workshop/tree/part_3_sam)
- Invoke your function locally with provided event
- Start local api gateway with sam
- Start local instance of dynamodb with docker
- Understand how networking works
- Understand how environmental variables work
- Understand how to read and check changes made to local db and some additional features.
1. [Serverless Workshop Part 4 - sam](https://github.com/namikmesic/sam-workshop/tree/part_4_sam)
- Split App into multiple functions
- Understand how to protect your api with API key - OpenIssue
- Add simple api key auth against your gateway - OpenIssue
- Add simple cicd pipeline for gitlab

