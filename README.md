# Serverless Workshop Part 3 - sam

## Objectives
- Invoke your function locally with provided event
- Start local api gateway with sam
- Start local instance of dynamodb with docker
- Understand how networking works
- Understand how environmental variables work
- - Understand how to read and check changes made to local db and some additional features.



## Step 1 - Check updates we made
- Check changes we made to `index.js` to support local dynamodb


## Step 2 - Start testing your application locally
First create a docker network
```bash
docker network create sam-demo
```
Now set up and start dynamodb locally
```bash
docker run -d -v "$PWD":/dynamodb_local_db -p 8000:8000 --network sam-demo --name dynamodb cnadiminti/dynamodb-local
```
Now bootstrap your dynamodb with test table `users`
```bash
sh bootstrap_dynamodb.sh
```

Lets try starting the api offline
```bash
sam local start-api --docker-network sam-demo
```

## Step 3 - Test your application locally

Try and invoke one of your functions locally
```bash
sam local invoke "App" --env-vars environment.json -e test_events/create_user.json  --docker-network sam-demo

```
Check if hello world works
```bash
curl http://localhost:3000
```

Check if you can create user locally
```bash
curl -H "Content-Type: application/json" -X POST http://localhost:3000/users -d '{"userId": "alexdebrie1", "name": "Alex DeBrie"}'
```

Now see if there are records in Database
```bash
aws dynamodb scan --table-name users --endpoint-url http://localhost:8000

```
