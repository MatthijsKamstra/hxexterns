package;

import js.npm.NodeJsonDB;

// import js.Browser.console;
import js.Node.console;

class MainNodeJsonDB {

  public function new() {
    init0();
    init1();
    init2();
  }


  function init0(){
    // var JsonDB = require('node-json-db');
    // The second argument is used to tell the DB to save after each push
    // If you put false, you'll have to call the save() method.
    // The third argument is to ask JsonDB to save the database in an human readable format. (default false)
    var db = new JsonDB("myDataBase", true, false);
    // var db = new NodeJsonDB("myDataBase", true, false);

    // Pushing the data into the database
    // With the wanted DataPath
    // By default the push will override the old value
    db.push("/test1","super test");

    // It also create automatically the hierarchy when pushing new data for a DataPath that doesn't exists
    db.push("/test2/my/test",5);

    // You can also push directly objects
    db.push("/test3", {test:"test", json: {test:["test"]}});

    // If you don't want to override the data but to merge them
    // The merge is recursive and work with Object and Array.
    db.push("/test3", {
      "new":"cool",
      json: {
        important : 5
      }
    }, false);

    /*
    This give you this results :
    {
       "test":"test",
       "json":{
          "test":[
             "test"
          ],
          "important":5
       },
       "new":"cool"
    }
    */

    // You can't merge primitive.
    // If you do this:
    db.push("/test2/my/test/",10,false);

    // The data will be overriden

    // Get the data from the root
    var data = db.getData("/");

    // From a particular DataPath
    var data = db.getData("/test1");

    // If you try to get some data from a DataPath that doesn't exists
    // You'll get an Error
    try {
        var data = db.getData("/test1/test/dont/work");
    } catch(error:Dynamic) {
        // The error will tell you where the DataPath stopped. In this case test1
        // Since /test1/test does't exist.
        console.error(error);
    };

    // Deleting data
    db.delete("/test1");

    // Save the data (useful if you disable the saveOnPush)
    db.save();

    // In case you have a exterior change to the databse file and want to reload it
    // use this method
    db.reload();

  }

  function init1(){
    // The second argument is used to tell the DB to save after each push
    // If you put false, you'll have to call the save() method.
    // The third argument is to ask JsonDB to save the database in an human readable format. (default false)
    var db = new JsonDB("myDataBase", true, false);

    // This will create an array 'myarray' with the object '{obj:'test'}' at index 0
    db.push("/arraytest/myarray[0]", {
        obj:'test'
    }, true);

    // You can retrieve a property of an object included in an array
    // testString = 'test';
    var testString = db.getData("/arraytest/myarray[0]/obj");

    // Doing this will delete the object stored at the index 0 of the array.
    // Keep in mind this won't delete the array even if it's empty.
    db.delete("/arraytest/myarray[0]");
  }

  function init2(){
    var db = new JsonDB("myDataBase", true, false);

    // You can also easily append new item to an existing array
    // This set the next index with {obj: 'test'}
    db.push("/arraytest/myarray[]", {
        obj:'test'
    }, true);


    // The append feature can be used in conjuction with properties
    // This will set the next index as an object {myTest: 'test'}
    db.push("/arraytest/myarray[]/myTest", 'test', true);
  }

  function init3(){
    var db = new JsonDB("myDataBase", true, false);

    db.push("/arraytest/lastItemArray", [1, 2, 3], true);

    // You can easily get the last item of the array with the index -1
    // This will return 3
    db.getData("/arraytest/lastItemArray[-1]");

    // You can delete the last item of an array with -1
    // This will remove the integer "3" from the array
    db.delete("/arraytest/lastItemArray[-1]");

    // This will return 2 since 3 just got removed
    db.getData("/arraytest/lastItemArray[-1]");
  }



  static public function main() {
    var app = new MainNodeJsonDB();
  }
}