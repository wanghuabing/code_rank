import 'dart:async';
import 'dart:convert';

import 'package:code_rank/model/rank_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RankPage extends StatelessWidget {
  List widgets = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: new FutureBuilder<RankData>(
            future: fetchRankProjects(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return getListView();
              } else if (snapshot.hasError) {
                return new Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return new CircularProgressIndicator();
            }));
  }

  ListView getListView() => new ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  Widget getRow(int i) {
    return new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Text("Row ${widgets[i]["title"]}"));
  }

  Future<RankData> fetchRankProjects() async {
    final response = await http.get(
        'https://api.github.com/search/repositories?q=language:java&sort=stars');
    final responseJson = json.decode(response.body);
    return new RankData.fromJson(responseJson);
  }
}
