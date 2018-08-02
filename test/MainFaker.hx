package;

import js.npm.Faker;

import js.Browser.console;

class MainFaker {

  public function new() {
    init0();
    init1();
    init2();
  }


  public function init0(){
	var randomName = Faker.name.findName(); // Rowan Nikolaus
	var randomEmail = Faker.internet.email(); // Kassandra.Haley@erich.biz
	var randomCard = Faker.helpers.createCard(); // random contact card containing many properties
  }
  public function init1(){
  	Faker.seed(123);

	var firstRandom = Faker.random.number();

	// Setting the seed again resets the sequence.
	Faker.seed(123);

	var secondRandom = Faker.random.number();

	console.log(firstRandom == secondRandom);
  }
  public function init2(){
	// sets locale to de
	Faker.setLocale("de");
	Faker.setLocale(Locale.DE);
	// or
	Faker.locale = "nl";
	Faker.locale = Locale.NL;
  }

  static public function main() {
    var app = new MainFaker();
  }
}