#!/usr/bin/env bash
TABLE_NAME='users'

echo "Creating table: ${TABLE_NAME}"
aws dynamodb create-table \
--table-name ${TABLE_NAME} \
--attribute-definitions AttributeName=userId,AttributeType=S \
--key-schema AttributeName=userId,KeyType=HASH \
--provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
--endpoint-url http://localhost:8000

aws dynamodb list-tables --endpoint-url http://localhost:8000
echo "Content of table ${TABLE_NAME}"
aws dynamodb scan --table-name ${TABLE_NAME} --endpoint-url http://localhost:8000
