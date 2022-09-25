# Array Operators

At 0:18 there is a factual error in this lesson. The correct functionality of the $push operator is that when the field is not an array, the operation will fail. However, if the field is absent in the document to update, $push adds the array field with the value as its element.

This lesson used the following commands:

Connect to the Atlas cluster:
```shell 
mongo "mongodb+srv://<username>:<password>@<cluster>.mongodb.net/admin"
```

Switch to this database:
```shell 
use sample_airbnb
```

Find all documents with exactly 20 amenities which include all the amenities listed in the query array:
```shell
db.listingsAndReviews.find({ "amenities": {
                                  "$size": 20,
                                  "$all": [ "Internet", "Wifi",  "Kitchen",
                                           "Heating", "Family/kid friendly",
                                           "Washer", "Dryer", "Essentials",
                                           "Shampoo", "Hangers",
                                           "Hair dryer", "Iron",
                                           "Laptop friendly workspace" ]
                                         }
                            }).pretty()
```