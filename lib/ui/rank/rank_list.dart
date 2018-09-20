import 'dart:async';
import 'dart:convert';

import 'package:code_rank/model/rank_data.dart';
import 'package:code_rank/model/rank_project.dart';
import 'package:code_rank/ui/rank/project_row.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: new FutureBuilder<RankData>(
            future: fetchRankProjects(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return getListView(snapshot.data.items);
              } else if (snapshot.hasError) {
                return new Center(child: new Text("${snapshot.error}"));
              }

              // By default, show a loading spinner
              return new CircularProgressIndicator();
            }));
  }

  ListView getListView(List<RankProject> items) => new ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int position) {
        return new ProjectRow(items[position]);
      });

  Future<RankData> fetchRankProjects() async {
    final response = await http.get(
        'https://api.github.com/search/repositories?q=language:java&sort=stars');
    final responseJson = json.decode(response.body);
    return new RankData.fromJson(responseJson);
  }
}
