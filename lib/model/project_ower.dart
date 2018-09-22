class ProjectOwer {
  String login;
  String avatar_url;
  String html_url;

  ProjectOwer({this.login, this.avatar_url, this.html_url});

  factory ProjectOwer.fromJson(Map<String, dynamic> json) {
    return ProjectOwer(
        login: json['login'],
        avatar_url: json['avatar_url'],
        html_url: json['html_url']);
  }
}
