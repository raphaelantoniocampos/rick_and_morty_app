import 'package:rick_and_morty_app/models/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location origin;
  final Location location;
  final String image;
  final List<dynamic> episode;
  final String url;
  final String created;

  Character(this.id, this.name, this.status, this.species, this.type, this.gender, this.origin, this.location, this.image, this.episode, this.url, this.created);

  static Character fromJson(Map<String, dynamic> json){
    return Character(
      json['id'], 
      json['name'], 
      json['status'],
      json['species'],
      json['type'],
      json['gender'],
      Location.fromJson(json['origin']),
      Location.fromJson(json['location']),
      json['image'],
      json['episode'],
      json['url'],
      json['created']
      );
  }
}

