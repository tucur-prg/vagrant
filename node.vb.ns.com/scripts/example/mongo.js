//
// Monog
//   npm install mongodb
//

/**
 * Stop: Ctrl + C
 */
var MongoClient = require('mongodb').MongoClient,
    settings = require('./configs/settings');

MongoClient.connect(settings.dsn, function (err, db) {
    if (err) {
        return console.dir(err);
    }

    console.log("connected to db");

    db.collection('users', function (err, collection) {
        if (err) {
            return console.dir(err);
        }
/*
        var docs = [
            {name: "foo", score: 40},
            {name: "bar", score: 80},
            {name: "foge", score: 60},
        ];

        collection.insert(docs, function (err, result) {
            console.log(result);
        });
*/
/*
        collection.find({name: "foo"}).toArray(function (err, items) {
            console.log(items);
        });
*/
        var stream = collection.find().stream();
        stream.on('data', function (item) {
            console.log(item);
        });

        stream.on('end', function () {
            console.log("finished.");
        });
    });
});
