import 'package:isle_x_flutter/persona.dart';
import 'package:flutter/material.dart';

enum currentStatus { draft, public }

enum Category {
  food,
  sea

  //TODO:add rest
}

enum weatherConditions { rain, cold, warm, extremely_hot }

enum seasons { spring, summer, fall, winter }

enum Cost {
  zero, //0€
  little, //1-5€
  average, //6-10€
  much, //11-25€
//  very_much  //26-70€
//  extravagant //70+
}

enum Duration {
  quick,
  up_to_10mins,
  up_to_30mins,
  up_to_an_hour,
  more_than_an_hour
}

enum Personas {
  Mitsos,
  Katerina,
  Apostolos,
  Marilena,
  Nasos
}

class Activity {
  String _id;

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String _title;
  String _description;
//  Persona _persona;
  Personas _persona;
  currentStatus _status;
  List<weatherConditions> _weatherCompatibility;
  List<seasons> _seasonsAvailable;
  List<LatLong> _locations;
  Category _category;
  String _websiteLink;
  String _instagramLink;
  String _facebookLink;
  bool _includesBusinesses;
  String _heroImage; //from assets image shows in the card e.g. coffe mug with transparent background
  List<String> _imageFiles; //from assets/images/activities in order of importance 0=most important 5=less important
  List<String> _videoFiles; //from assets/videos/activities in order of importance 0=most important 5=less important
  Cost _cost;
  DateTime _dateTime;
  Duration _duration;

  Activity(
      this._id,
      this._status,
      this._title,
      this._description,
      this._persona,
      this._cost,
      this._dateTime,
      this._duration,
      this._category,
//      this._locations,
      this._includesBusinesses,
      this._weatherCompatibility,
      this._seasonsAvailable,
      this._websiteLink,
      this._instagramLink,
      this._facebookLink,
      this._heroImage,
      this._imageFiles, //with local files only saved in assets
      this._videoFiles, //with local files only saved in assets

  ) {

  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  Personas get persona => _persona;

  set persona(Personas value) {
    _persona = value;
  }

  currentStatus get status => _status;

  set status(currentStatus value) {
    _status = value;
  }

  List<weatherConditions> get weatherCompatibility => _weatherCompatibility;

  set weatherCompatibility(List<weatherConditions> value) {
    _weatherCompatibility = value;
  }

  List<seasons> get seasonsAvailable => _seasonsAvailable;

  set seasonsAvailable(List<seasons> value) {
    _seasonsAvailable = value;
  }

  List<LatLong> get locations => _locations;

  set locations(List<LatLong> value) {
    _locations = value;
  }

  Category get category => _category;

  set category(Category value) {
    _category = value;
  }

  String get websiteLink => _websiteLink;

  set websiteLink(String value) {
    _websiteLink = value;
  }

  String get instagramLink => _instagramLink;

  set instagramLink(String value) {
    _instagramLink = value;
  }

  String get facebookLink => _facebookLink;

  set facebookLink(String value) {
    _facebookLink = value;
  }

  bool get includesBusinesses => _includesBusinesses;

  set includesBusinesses(bool value) {
    _includesBusinesses = value;
  }

  String get heroImage => _heroImage;

  set heroImage(String value) {
    _heroImage = value;
  }

  List<String> get imageFiles => _imageFiles;

  set imageFiles(List<String> value) {
    _imageFiles = value;
  }

  List<String> get videoFiles => _videoFiles;

  set videoFiles(List<String> value) {
    _videoFiles = value;
  }

  Cost get cost => _cost;

  set cost(Cost value) {
    _cost = value;
  }

  DateTime get dateTime => _dateTime;

  set dateTime(DateTime value) {
    _dateTime = value;
  }

  Duration get duration => _duration;

  set duration(Duration value) {
    _duration = value;
  }
}

class LatLong {
  double _latitude;
  double _longitude;

  double get longitude => _longitude;

  set longitude(double value) {
    _longitude = value;
  }

  double get latitude => _latitude;

  set latitude(double value) {
    _latitude = value;
  }

  LatLong(this._latitude, this._longitude);
}
