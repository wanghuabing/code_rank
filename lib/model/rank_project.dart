class RankProject {
  int id;
  String name;
  String html_url;

  RankProject({this.id, this.name, this.html_url});

  factory RankProject.fromJson(Map<String, dynamic> parsedJson) {
    return RankProject(
        id: parsedJson['id'],
        name: parsedJson['name'],
        html_url: parsedJson['html_url']);
  }
}
