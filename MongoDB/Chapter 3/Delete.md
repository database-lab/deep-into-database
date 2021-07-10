# Deleting data

Commands used in this lesson:

```shell
mongo "mongodb+srv://<username>:<password>@<cluster>.mongodb.net/admin"
```

```shell
use sample_training
```

- Delete all the documents that have test field equal to 1.
```shell
db.inspections.deleteMany({ "test": 1 })
```

- Delete one document that has test field equal to 3.
```shell
db.inspections.deleteOne({ "test": 3 })
```

- Drop the inspection collection.
```shell
db.inspection.drop()
```


Note:<br />
Removing all collections in a database, drops the database too.