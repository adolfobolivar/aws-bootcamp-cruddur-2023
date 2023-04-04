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
users uuid
````
cruddur=# SELECT uuid, handle from users;
                 uuid                 |   handle    
--------------------------------------+-------------
 3b59797a-ea0e-444a-a675-0d62a1805775 | andrewbrown
 f7be996b-b6a7-453f-892a-9cc9c353299f | bayko
(2 rows)
````
list and get conversations scripts are working ok
````
 SQL STATEMENT-[value]------

    SELECT 
      users.uuid
    FROM users
    WHERE
      users.handle =%(handle)s
   {'handle': 'andrewbrown'}
my-uuid: 3b59797a-ea0e-444a-a675-0d62a1805775
{
  "ConsumedCapacity": {
    "CapacityUnits": 0.5,
    "TableName": "cruddur-messages"
  },
  "Count": 1,
  "Items": [
    {
      "message": {
        "S": "this is a filler message
...
````
db setup updated, it adds the User ID from Cognito
````
./bin/db/setup
==== db-setup
db-drop
DROP DATABASE
db-create
CREATE DATABASE
== db-schema-load
db-schema-load
/workspace/aws-bootcamp-cruddur-2023/backend-flask/db/schema.sql
CREATE EXTENSION
NOTICE:  table "users" does not exist, skipping
DROP TABLE
NOTICE:  table "activities" does not exist, skipping
DROP TABLE
CREATE TABLE
CREATE TABLE
== db-seed-path
db-schema-load
/workspace/aws-bootcamp-cruddur-2023/backend-flask/db/seed.sql
INSERT 0 2
INSERT 0 1
== db-update-cognito-user-ids
---- isoxx83 ea84081e-fffa-4712-xxxyyyyzzz
 SQL STATEMENT-[commit with returning]------

    UPDATE public.users
    SET cognito_user_id = %(sub)s
    WHERE
      users.handle = %(handle)s;
   {'handle': 'isxx83', 'sub': 'ea84081e-fffa-4712-xxxyyyyzzz'}
`````
cognito user id entry in db table after update the seed file:
````
cruddur=# SELECT * from users;
-[ RECORD 1 ]---+-------------------------------------
uuid            | 25832edf-cb1d-4d60-aca3-6b568d826130
display_name    | adolfo bolivar
handle          | isoXXXXX
email           | isoXXXXX@hotmail.com
cognito_user_id | ea84081e-fffa-4712-9ac0-437bd344da56
created_at      | 2023-04-03 23:50:12.243699
-[ RECORD 2 ]---+-------------------------------------
uuid            | 16668478-d0e5-4b2c-b857-ad0f1f62d816
display_name    | mariuYYYYY
handle          | mariuYYYY
email           | mariuYYYY@gmail.com
cognito_user_id | fa27355d-1184-4b2a-b6e6-ae0ba10b5e6d
created_at      | 2023-04-03 23:50:12.243699
````
Messages tab reading the data from ddb:

![messages](https://user-images.githubusercontent.com/17748375/229661727-658c2e6f-75c9-47de-92f4-c6c68a3d84d0.png)

Messages Group is working:

![Message](https://user-images.githubusercontent.com/17748375/229661746-8b5ca3ed-01e0-4e1c-a7f9-d38d80a28a9e.png)

Dynamo DB working in prod
````
RESP ===> [{'user_handle': 'mariuYYYY', 'user_uuid': 'f6e859b9-7ea1-464c-8ef7-e3500381fcaf', 'user_display_name': 'mariu bolivar', 'sk': '2023-04-04T17:00:33.344369+00:00', 'message': 'test message', 'pk': 'GRP#e5a0b381-dfe2-4850-9b7b-6dde5859cc28', 'message_group_uuid': 'fd15d3ff-ccc7-4f0c-8baf-24a7841e32ea'}, {'user_handle': 'isos83', 'user_uuid': 'e5a0b381-dfe2-4850-9b7b-6dde5859cc28', 'user_display_name': 'adolfo bolivar', 'sk': '2023-04-04T17:00:33.344369+00:00', 'message': 'test message', 'pk': 'GRP#f6e859b9-7ea1-464c-8ef7-e3500381fcaf', 'message_group_uuid': 'fd15d3ff-ccc7-4f0c-8baf-24a7841e32ea'}]
```
![dynamo](https://user-images.githubusercontent.com/17748375/229869811-1523e67e-8b47-4191-9a82-8d6d4a084430.png)
