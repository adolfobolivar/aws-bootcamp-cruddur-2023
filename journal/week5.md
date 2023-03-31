# Week 5 — DynamoDB and Serverless Caching

Local ddb schema:
```json
$ ./bin/ddb/schema-load
{'TableDescription': {'AttributeDefinitions': [{'AttributeName': 'pk', 'AttributeType': 'S'}, {'AttributeName': 'sk', 'AttributeType': 'S'}], 'TableName': 'cruddur-message', 'KeySchema': [{'AttributeName': 'pk', 'KeyType': 'HASH'}, {'AttributeName': 'sk', 'KeyType': 'RANGE'}], 'TableStatus': 'ACTIVE', 'CreationDateTime': datetime.datetime(2023, 3, 31, 17, 54, 6, 756000, tzinfo=tzlocal()), 'ProvisionedThroughput': {'LastIncreaseDateTime': datetime.datetime(1970, 1, 1, 0, 0, tzinfo=tzlocal()), 'LastDecreaseDateTime': datetime.datetime(1970, 1, 1, 0, 0, tzinfo=tzlocal()), 'NumberOfDecreasesToday': 0, 'ReadCapacityUnits': 5, 'WriteCapacityUnits': 5}, 'TableSizeBytes': 0, 'ItemCount': 0, 'TableArn': 'arn:aws:dynamodb:ddblocal:000000000000:table/cruddur-message'}, 'ResponseMetadata': {'RequestId': '85752bc5-4a6d-4a66-b4aa-f96d43892d73', 'HTTPStatusCode': 200, 'HTTPHeaders': {'date': 'Fri, 31 Mar 2023 17:54:06 GMT', 'x-amzn-requestid': '85752bc5-4a6d-4a66-b4aa-f96d43892d73', 'content-type': 'application/x-amz-json-1.0', 'x-amz-crc32': '3227219317', 'content-length': '578', 'server': 'Jetty(9.4.48.v20220622)'}, 'RetryAttempts': 0}}
````
Drop ddb table:
```
$ ./bin/ddb/drop cruddur-message
deleting table: cruddur-message
{
    "TableDescription": {
        "AttributeDefinitions": [
            {
                "AttributeName": "pk",
                "AttributeType": "S"
                ....
````
Seed data in ddb table:
````
$ ./bin/ddb/seed
 SQL STATEMENT-[array]------

    SELECT 
      users.uuid,
      users.display_name,
      users.handle
    FROM users
    WHERE
      users.handle IN(
        %(my_handle)s,
        %(other_handle)s
        )
  
get_user_uuids
{'my_user': {'uuid': '3b59797a-ea0e-444a-a675-0d62a1805775', 'display_name': 'Andrew Brown', 'handle': 'andrewbrown'}, 'other_user': {'uuid': 'f7be996b-b6a7-453f-892a-9cc9c353299f', 'display_name': 'Andrew Bayko', 'handle': 'bayko'}}
{'ResponseMetadata': {'RequestId': 'deb9dddc-6f91-4af8-8b1c-94c1f5e02dc3', 'HTTPStatusCode': 200, 'HTTPHeaders': {'date': 'Fri, 31 Mar 2023 18:50:55 GMT', 'x-amzn-requestid': 'deb9dddc-6f91-4af8-8b1c-94c1f5e02dc3', 'content-type': 'application/x-amz-json-1.0', 'x-amz-crc32': '2745614147', 'content-length': '2', 'server': 'Jetty(9.4.48.v20220622)'}, 'RetryAttempts': 0}}
...
````

