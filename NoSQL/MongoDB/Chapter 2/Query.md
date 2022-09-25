# Queries

## Data Explorer
Data Explorer is an Build-in feature in mongoDB Atlas.

Namespace - The concatenation of the database name and collection name is called a namespace.

### Query

We looked at the sample_training.zips collection and issued the following queries:

{"state": "NY"}
{"state": "NY", "city": "ALBANY"}


## Shell
In this lesson we used the following commands:

Connect to the Atlas cluster:
```shell
mongo "mongodb+srv://<username>:<password>@<cluster>.mongodb.net/admin"
```

- How to get the list of databases in MongoDB:
```shell
show dbs
```

- How to get inside a database:
```shell
use sample_training
```

- How to get the list of collections in database:
```shell
show collections
```

- How to do a simple query:
```shell
db.zips.find({"state": "NY"})
```
Point:<br />
it iterates through the cursor.


### Some query examples:

- db.zips.find({"state": "NY"}).count()

- db.zips.find({"state": "NY", "city": "ALBANY"})

- db.zips.find({"state": "NY", "city": "ALBANY"}).pretty()

