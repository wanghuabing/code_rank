import 'package:code_rank/model/rank_project.dart';

class RankData {
  int total_count;
  bool incomplete_results;
  List<RankProject> items;

  RankData({this.total_count, this.incomplete_results, this.items});

  factory RankData.fromJson(Map<String, dynamic> json) {
    return RankData(
        total_count: json['total_count'],
        incomplete_results: json['incomplete_results'],
        items: json['items']);
  }
}
