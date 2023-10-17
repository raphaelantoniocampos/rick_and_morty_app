import 'package:rick_and_morty_app/models/location.dart';

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

  Character(
      this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created);

  Character.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        status = json['status'],
        species = json['species'],
        type = json['type'],
        gender = json['gender'],
        origin = Location.fromJson(json['origin']),
        location = Location.fromJson(json['location']),
        image = json['image'],
        episode = json['episode'],
        url = json['url'],
        created = json['created'];
}
