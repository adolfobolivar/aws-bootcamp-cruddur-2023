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
```

Tables were created by bash script:
```
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
```