class Location{
  final int? id;
  final String name;
  final String? type;
  final String? dimension;
  final List<String>? residents;
  final String url;
  final String? created;

  Location(this.id, this.name, this.type, this.dimension, this.residents, this.url, this.created);

  static Location fromJson(Map<String, dynamic> json) {
    return Location(
      json['id'], 
      json['name'],
      json['type'],
      json['dimension'],
      json['residents'],
      json['url'],
      json['created']);
  }
}