import 'package:flutter/material.dart';

class Persona {
  String _id; //isle+name+category makes it unique
  String _name;
  String _category;
  String _island;
  Image _characterImage;
  Image _characterIcon;

  Persona(this._name, this._category, this._island, this._characterImage,
      this._characterIcon) {
    _id = this._island + this._name;
  }

  Image get characterIcon => _characterIcon;

  set characterIcon(Image value) {
    _characterIcon = value;
  }

  Image get characterImage => _characterImage;

  set characterImage(Image value) {
    _characterImage = value;
  }

  String get island => _island;

  set island(String value) {
    _island = value;
  }

  String get category => _category;

  set category(String value) {
    _category = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}
