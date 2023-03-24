# Week 4 — Postgres and RDS
Bash scripts working as expected:
````
gitpod /workspace/aws-bootcamp-cruddur-2023/backend-flask (main) $ ./bin/db-create
db-create
CREATE DATABASE
gitpod /workspace/aws-bootcamp-cruddur-2023/backend-flask (main) $ ./bin/db-connect
psql (13.10 (Ubuntu 13.10-1.pgdg20.04+1))
Type "help" for help.

cruddur=# /q
cruddur-# \q
gitpod /workspace/aws-bootcamp-cruddur-2023/backend-flask (main) $ ./bin/db-schema-load
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
````

Tables were created by bash script:
````
cruddur=# \dt
           List of relations
 Schema |    Name    | Type  |  Owner   
--------+------------+-------+----------
 public | activities | table | postgres
 public | users      | table | postgres
 ````

Added seed data to database:
````
gitpod /workspace/aws-bootcamp-cruddur-2023/backend-flask (main) $ ./bin/db-seed
== db-seed-path
db-schema-load
/workspace/aws-bootcamp-cruddur-2023/backend-flask/db/seed.sql
INSERT 0 2
INSERT 0 1
`````

Query to db successful:

![query](https://user-images.githubusercontent.com/17748375/226485441-facb6108-0a38-4321-add7-e8b8adb20ff8.png)


Connection to AWS RDS Ok:
````
cruddur=> \l
                                  List of databases
   Name    |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges   
-----------+----------+----------+-------------+-------------+-----------------------
 cruddur   | root     | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 postgres  | root     | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 ````

Schema created on AWS RDS
````
$ ./bin/db-schema-load prod
== db-schema-load
db-schema-load
/workspace/aws-bootcamp-cruddur-2023/backend-flask/db/schema.sql
using production
CREATE EXTENSION
NOTICE:  table "users" does not exist, skipping
DROP TABLE
NOTICE:  table "activities" does not exist, skipping
DROP TABLE
CREATE TABLE
CREATE TABLE
````

Information from Cognito saved in our database
````
cruddur=> SELECT * FROM USERS
;
-[ RECORD 1 ]---+-------------------------------------
uuid            | 55a1843b-53e0-42f3-97ce-5f370aa676c0
display_name    | adolfo
handle          | is
email           | is@hotmail.com
cognito_user_id | ea84081e-fffa-4712-9ac0-437bd344da56
created_at      | 2023-03-24 15:45:27.7742
````
activities option working as expected:
````
[2023-03-24 19:18:32,255] DEBUG in app: ea84081e-fffa-4712-9ac0-437bd344da56
192.168.121.139 - - [24/Mar/2023 19:18:32] "GET /api/activities/home HTTP/1.1" 200 -
192.168.121.139 - - [24/Mar/2023 19:18:50] "OPTIONS /api/activities HTTP/1.1" 200 -
192.168.121.139 - - [24/Mar/2023 19:18:50] "POST /api/activities HTTP/1.1" 200 -
````
activities entries in RDS:
````
-[ RECORD 5 ]----------+-------------------------------------
uuid                   | a2517027-a8be-43f6-86c6-86625bfa9a1b
user_uuid              | 7f7f60ca-01f1-4482-9ee1-a1b35520f829
message                | logs
replies_count          | 0
reposts_count          | 0
likes_count            | 0
reply_to_activity_uuid | 
expires_at             | 2023-03-31 19:17:22.337249
created_at             | 2023-03-24 19:17:22.371708
-[ RECORD 6 ]----------+-------------------------------------
uuid                   | 2e743b93-c2bc-40b8-a39e-f514d419c8af
user_uuid              | 7f7f60ca-01f1-4482-9ee1-a1b35520f829
message                | test again
replies_count          | 0
reposts_count          | 0
likes_count            | 0
reply_to_activity_uuid | 
expires_at             | 2023-03-31 19:18:50.585764
created_at             | 2023-03-24 19:18:50.620283
````

<img width="1150" alt="activities" src="https://user-images.githubusercontent.com/17748375/227621501-90e3e60b-f981-4a13-94c9-9cfc1cab5170.png">

