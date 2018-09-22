import 'package:code_rank/model/project_ower.dart';

class RankProject {
  int id;
  String name;
  String html_url;
  int stargazers_count;
  ProjectOwer owner;

  RankProject(
      {this.id, this.name, this.html_url, this.stargazers_count, this.owner});

  factory RankProject.fromJson(Map<String, dynamic> json) {
//    var dyOwer = json['owner'] as ProjectOwer;
    ProjectOwer owerData = ProjectOwer.fromJson(json['owner']);

    return RankProject(
        id: json['id'],
        name: json['name'],
        html_url: json['html_url'],
        stargazers_count: json['stargazers_count'],
        owner:  owerData
    );
  }
}
