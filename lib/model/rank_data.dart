import 'package:code_rank/model/rank_project.dart';

class RankData{
  BigInt total_count;
  bool incomplete_results;
  List<RankProject> items;

  RankData({
    this.total_count,
    this.incomplete_results,
    this.items
  });


  factory RankData.fromJson(Map<String, dynamic> parsedJson){
    return RankData(
        total_count: parsedJson['total_count'],
        incomplete_results : parsedJson['incomplete_results'],
        items : parsedJson ['items']
    );
  }
}