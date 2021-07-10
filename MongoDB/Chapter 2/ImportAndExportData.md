# Data Import and Exporting

BSON is not human readable. MongoDB stores data in BSON and views it in JSON.

## URI string

Uniform resource identifier.

Srv: establishes a secure connection.

SRV connection string - a specific format used to establish a connection between your application and a MongoDB instance.

## Commands

Exporting and Importing commands:
```shell
mongodump --uri "mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies"

mongoexport --uri="mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies" --collection=sales --out=sales.json

mongorestore --uri "mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies"  --drop dump

mongoimport --uri="mongodb+srv://<your username>:<your password>@<your cluster>.mongodb.net/sample_supplies" --drop sales.json
```