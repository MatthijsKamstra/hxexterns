package js.npm;

import haxe.extern.Rest;
import haxe.extern.EitherType;


@:enum abstract Locale(String) {
    var NL = 'nl';
    var DE = 'de';
    var EN = 'en';
    var FR = 'fr';

/*
az
cz
de
de_AT
de_CH
en
en_AU
en_BORK
en_CA
en_GB
en_IE
en_IND
en_US
en_au_ocker
es
es_MX
fa
fr
fr_CA
ge
id_ID
it
ja
ko
nb_NO
nep
nl
pl
pt_BR
ru
sk
sv
tr
uk
vi
zh_CN
zh_TW
 */
}


/**
 * not complete, jus the stuff I needed
 * Source: https://github.com/marak/Faker.js/
 * MyExtern.js v1.12
 */
@:native('faker')
@:jsRequire("faker")
extern class Faker {
  function new ();

  static var name : FakerName;
  static var company : FakerCompany;
  static var internet : FakerInternet;
  static var helpers : FakerHelper;
  static var address : FakerAddress;
  static var random : FakerRandom;

  static function seed (value:Int):Void;

  /**
   * 	// sets locale to de
		faker.setLocale("de");
		// or
		faker.locale = "de";
   */
  static var locale : EitherType<String,Locale>;
  static function setLocale(locale:EitherType<String,Locale>):Void;

}

extern class FakerName{
  public function findName():String;
}

extern class FakerInternet{
  public function email():String;
}
extern class FakerHelper{
  public function createCard():String;
}
extern class FakerCompany{
  public function suffixes():String;
  public function companyName():String;
  public function companySuffix():String;
  public function catchPhrase():String;
  public function bs():String;
  public function catchPhraseAdjective():String;
  public function catchPhraseDescriptor():String;
  public function catchPhraseNoun():String;
  public function bsAdjective():String;
  public function bsBuzz():String;
  public function bsNoun():String;
}

extern class FakerRandom{
  public function number():String;
  public function arrayElement():String;
  public function objectElement():String;
  public function uuid():String;
  public function boolean():String;
  public function word():String;
  public function words():String;
  public function image():String;
  public function locale():String;
  public function alphaNumeric():String;
  public function hexaDecimal():String;
}

extern class FakerAddress{
  public function createCard():String;
  public function zipCode():String;
  public function city():String;
  public function cityPrefix():String;
  public function citySuffix():String;
  public function streetName():String;
  public function streetAddress():String;
  public function streetSuffix():String;
  public function streetPrefix():String;
  public function secondaryAddress():String;
  public function county():String;
  public function country():String;
  public function countryCode():String;
  public function state():String;
  public function stateAbbr():String;
  public function latitude():String;
  public function longitude():String;
}

