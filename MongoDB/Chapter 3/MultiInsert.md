# Inserting multiply documents

In this lesson we used the following commands:

- Insert three test documents:
```shell
db.inspections.insert([ { "test": 1 }, { "test": 2 }, { "test": 3 } ])
```

- Insert three test documents but specify the _id values:
```shell
db.inspections.insert([{ "_id": 1, "test": 1 },{ "_id": 1, "test": 2 },
                       { "_id": 3, "test": 3 }])
```

- Find the documents with _id: 1
```shell
db.inspections.find({ "_id": 1 })
```

- Insert multiple documents specifying the _id values, and using the "ordered": false option.
```shell
db.inspections.insert([{ "_id": 1, "test": 1 },{ "_id": 1, "test": 2 },
                       { "_id": 3, "test": 3 }],{ "ordered": false })
```

- Insert multiple documents with _id: 1 with the default "ordered": true setting
```shell
db.inspection.insert([{ "_id": 1, "test": 1 },{ "_id": 3, "test": 3 }])
```

