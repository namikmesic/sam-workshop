# Serverless Workshop Part 3 - sam

## Objectives
- Invoke your function locally


```bash
aws dynamodb create-table \
--table-name LocalUsers \
--attribute-definitions AttributeName=userId,AttributeType=S \
--key-schema AttributeName=userId,KeyType=HASH \
--provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
--endpoint-url http://localhost:8000

```


```bash
docker network create lambda
docker run --name dynamodb --network lambda -p 8000:8000 amazon/dynamodb-local
docker network inspect lambda

AWS_REGION=eu-west-2 sam local start-api --docker-network lambda


```

docker network create sam-demo
docker run -d -v "$PWD":/dynamodb_local_db -p 8000:8000 --network sam-demo --name dynamodb cnadiminti/dynamodb-local
sam local start-api --docker-network sam-demo
curl -H "Content-Type: application/json" -X POST http://localhost:3000/users -d '{"userId": "alexdebrie1", "name": "Alex DeBrie"}'
