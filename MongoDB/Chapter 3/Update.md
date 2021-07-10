# Updating Documents

Commands used in this lesson:

- Connect to your Atlas Cluster.
```shell
mongo "mongodb+srv://<username>:<password>@<cluster>.mongodb.net/admin"
```

- Use the sample_training database as your database in the following commands.
```shell
use sample_training
```

- Find all documents in the zips collection where the zip field is equal to "12434".
```shell
db.zips.find({ "zip": "12534" }).pretty()
```

- Find all documents in the zips collection where the city field is equal to "HUDSON".
```shell
db.zips.find({ "city": "HUDSON" }).pretty()
```

- Find how many documents in the zips collection have the city field equal to "HUDSON".
```shell
db.zips.find({ "city": "HUDSON" }).count()
```

- Update all documents in the zips collection where the city field is equal to "HUDSON" by adding 10 to the current value of the "pop" field.
```shell
db.zips.updateMany({ "city": "HUDSON" }, { "$inc": { "pop": 10 } })
```

- Update a single document in the zips collection where the zip field is equal to "12534" by setting the value of the "pop" field to 17630.
```shell
db.zips.updateOne({ "zip": "12534" }, { "$set": { "pop": 17630 } })
```

- Update a single document in the zips collection where the zip field is equal to "12534" by setting the value of the "population" field to 17630.
```shell
db.zips.updateOne({ "zip": "12534" }, { "$set": { "population": 17630 } })
```

- Update one document in the grades collection where the student_id is ``250`` *, and the class_id field is 339 , by adding a document element to the "scores" array.
```shell
db.grades.updateOne({ "student_id": 250, "class_id": 339 },
                    { "$push": { "scores": { "type": "extra credit",
                                             "score": 100 }
                                }
                     })
```