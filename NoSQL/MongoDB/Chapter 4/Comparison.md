# Using Comparison in MongoDB Query

This lesson used the following commands:

Connect to the Atlas cluster:
```shell
mongo "mongodb+srv://<username>:<password>@<cluster>.mongodb.net/admin"

```

Switch to this database:
```shell
use sample_training
```

Find all documents where the tripduration was less than or equal to 70 seconds and the usertype was not Subscriber:
```shell 
db.trips.find({ "tripduration": { "$lte" : 70 },
                "usertype": { "$ne": "Subscriber" } }).pretty()
```

Find all documents where the tripduration was less than or equal to 70 seconds and the usertype was Customer using a redundant equality operator:
```shell
db.trips.find({ "tripduration": { "$lte" : 70 },
                "usertype": { "$eq": "Customer" }}).pretty()
```

Find all documents where the tripduration was less than or equal to 70 seconds and the usertype was Customer using the implicit equality operator:
```shell
db.trips.find({ "tripduration": { "$lte" : 70 },
                "usertype": "Customer" }).pretty()
```
