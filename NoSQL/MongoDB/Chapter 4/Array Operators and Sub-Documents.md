# Array Operators and Sub-Documents

Commands used in this lesson:

Connect to the Atlas cluster:
```shell
mongo "mongodb+srv://<username>:<password>@<cluster>.mongodb.net/admin"
```

```shell
use sample_training

db.trips.findOne({ "start station location.type": "Point" })

db.companies.find({ "relationships.0.person.last_name": "Zuckerberg" },
                  { "name": 1 }).pretty()

db.companies.find({ "relationships.0.person.first_name": "Mark",
                    "relationships.0.title": { "$regex": "CEO" } },
                  { "name": 1 }).count()


db.companies.find({ "relationships.0.person.first_name": "Mark",
                    "relationships.0.title": {"$regex": "CEO" } },
                  { "name": 1 }).pretty()

db.companies.find({ "relationships":
                      { "$elemMatch": { "is_past": true,
                                        "person.first_name": "Mark" } } },
                  { "name": 1 }).pretty()

db.companies.find({ "relationships":
                      { "$elemMatch": { "is_past": true,
                                        "person.first_name": "Mark" } } },
                  { "name": 1 }).count()
```