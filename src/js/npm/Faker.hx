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
 * Haxe externs for faker.js v4.1.0
 * Project: https://github.com/marak/Faker.js/
 * Definitions by:	Matthijs Kamstra aka [mck] <https://github.com/MatthijsKamstra>
 * Definitions: <https://github.com/matthijskamstra/hxexterns>
 *              <https://github.com/matthijskamstra/hx-mean>
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
  static var image : FakerImage;

  static function seed (value:Int):Void;

  /**
   * // sets locale to de
   * faker.setLocale("de");
   * // or
   * faker.locale = "de";
   */
  static var locale : EitherType<String,Locale>;
  static function setLocale(locale:EitherType<String,Locale>):Void;

}

extern class FakerName{
  public function firstName():String;
  public function lastName():String;
  public function findName():String;
  public function jobTitle():String;
  public function prefix():String;
  public function suffix():String;
  public function title():String;
  public function jobDescriptor():String;
  public function jobArea():String;
  public function jobType():String;
}

extern class FakerInternet{
  public function avatar():String;
  public function email():String;
  public function exampleEmail():String;
  public function userName():String;
  public function protocol():String;
  public function url():String;
  public function domainName():String;
  public function domainSuffix():String;
  public function domainWord():String;
  public function ip():String;
  public function ipv6():String;
  public function userAgent():String;
  public function color():String;
  public function mac():String;
  public function password():String;
}
extern class FakerHelper{
  public function randomize():String;
  public function slugify():String;
  public function replaceSymbolWithNumber():String;
  public function replaceSymbols():String;
  public function shuffle():String;
  public function mustache():String;
  public function createCard():String; // really complex data
  public function contextualCard():String;
  public function userCard():String;
  public function createTransaction():String;
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
  public function number():EitherType<String, Int>;
  public function arrayElement():String;
  public function objectElement():String;
  public function uuid():String;
  public function boolean():Bool;
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
extern class FakerImage{
  public function avatar():String;
  public function imageUrl():String;
  public function abstractImage():String;
  public function animals():String;
  public function business():String;
  public function cats():String;
  public function city():String;
  public function food():String;
  public function nightlife():String;
  public function fashion():String;
  public function people():String;
  public function nature():String;
  public function sports():String;
  public function technics():String;
  public function transport():String;

}
