# Inserting New Documents

## ObjectId
Each mongoDB document has a enique Id that locates the document among the others.

This ObjectId() is an built-in attribute in MongoDB.

## Commands

In this lesson we used the following commands:
```shell
mongoimport --uri="mongodb+srv://<username>:<password>@<cluster>.mongodb.net/sample_supplies" sales.json
```

- Connect to the Atlas cluster
```shell
mongo "mongodb+srv://<username>:<password>@<cluster>.mongodb.net/admin"
```

- Navigate to the database that we need:
```shell
use sample_training
```

- Get a random document from the collection:
```shell
db.inspections.findOne();
```

- Intert into the database:
```shell
db.inspections.insert({
      "_id" : ObjectId("56d61033a378eccde8a8354f"),
      "id" : "10021-2015-ENFO",
      "certificate_number" : 9278806,
      "business_name" : "ATLIXCO DELI GROCERY INC.",
      "date" : "Feb 20 2015",
      "result" : "No Violation Issued",
      "sector" : "Cigarette Retail Dealer - 127",
      "address" : {
              "city" : "RIDGEWOOD",
              "zip" : 11385,
              "street" : "MENAHAN ST",
              "number" : 1712
         }
  })

db.inspections.insert({
      "id" : "10021-2015-ENFO",
      "certificate_number" : 9278806,
      "business_name" : "ATLIXCO DELI GROCERY INC.",
      "date" : "Feb 20 2015",
      "result" : "No Violation Issued",
      "sector" : "Cigarette Retail Dealer - 127",
      "address" : {
              "city" : "RIDGEWOOD",
              "zip" : 11385,
              "street" : "MENAHAN ST",
              "number" : 1712
         }
  })

db.inspections.find({"id" : "10021-2015-ENFO", "certificate_number" : 9278806}).pretty()
```