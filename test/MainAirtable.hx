package;

import js.npm.Airtable;

import js.Browser.console;

class MainAirtable {

  var AIRTABLE_API_KEY = 'YOUR_API_KEY';
  var AIRTABLE_KEY = 'foobar';
  var AIRTABLE_NAME = 'Table1';

  public function new() {
    init0();
    init1();
    init2();
  }

  // AUTHENTICATION
  function init0(){
    // var Airtable = require('airtable');
    Airtable.configure({
      endpointUrl: 'https://api.airtable.com',
      apiKey: AIRTABLE_API_KEY
    });
    var base = Airtable.base(AIRTABLE_KEY);

  }

  // Retrieve a slack links record
  function init1(){
    // var Airtable = require('airtable');
    var base = new Airtable({apiKey: AIRTABLE_API_KEY}).base(AIRTABLE_KEY);
    base.construct(AIRTABLE_NAME).select({
      // Selecting the first 3 records in Grid view:
      maxRecords: 3,
      view: "Grid view"
    }).eachPage(function page(records, fetchNextPage) {
      // This function (`page`) will get called for each page of records.

        console.log(records);
        // console.log(fetchNextPage);

        // records.forEach(function(record) {
        //  console.log('Retrieved', record.get('Name'));
        // });
        // [mck] js forEach loop is in Haxe a for in loop,
        for (record in records){
          console.log('Retrieved', record.get('Name'));
        }

      // To fetch the next page of records, call `fetchNextPage`.
      // If there are more records, `page` will get called again.
      // If there are no more records, `done` will get called.
      fetchNextPage();

    }, function done(err) {
      if (err != null) { console.error(err); return; }
    });
  }

  // Create a slack links record
  function init2() {
    // var Airtable = require('airtable');
    var base = new Airtable({apiKey: AIRTABLE_API_KEY}).base(AIRTABLE_KEY);
    base.construct(AIRTABLE_NAME).create({
      "Name": "Matthijs",
      "Notes": "test"
    }, function(err, record) {
        if (err != null) {
          console.error(err);
          return;
        }
        console.log(record.getId());
    });
  }

  static public function main() {
    var app = new MainAirtable();
  }
}