class Location {
  final int? id;
  final String? name;
  final String? type;
  final String? dimension;
  final List<dynamic>? residents;
  final String url;
  final String? created;

  Location(this.id, this.name, this.type, this.dimension, this.residents,
      this.url, this.created);

  Location.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        type = json['type'],
        dimension = json['dimension'],
        residents = json['residents'],
        url = json['url'],
        created = json['created'];
}
