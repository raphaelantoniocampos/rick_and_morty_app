class Location{
  final String name;
  final String url;

  Location(this.name, this.url);

  static Location fromJson(Map<String, dynamic> json) {
    return Location(json['name'], json['url']);
  }
}