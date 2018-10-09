import 'dart:async';
import 'dart:convert';

import 'package:code_rank/model/rank_data.dart';
import 'package:code_rank/model/rank_project.dart';
import 'package:code_rank/ui/rank/project_row.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RankPage extends StatefulWidget {
  RankPageState createState() => new RankPageState();
}

class RankPageState extends State<RankPage> {
  ScrollController _controller;
  List<RankProject> items;
  int pageIndex = 1;
  bool isLoadingMore = false;
  Future<RankData> _listFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = List();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    _listFuture = fetchRankProjects();
  }

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      print("Load More~~~~");
      pageIndex++;
      isLoadingMore = true;
      refreshList();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: new RefreshIndicator(
      onRefresh: () async {
        pageIndex = 1;
        isLoadingMore = false;
        items.clear();
        refreshList();
      },
      child: new FutureBuilder<RankData>(
          future: _listFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              items.addAll(snapshot.data.items);
              return createListView();
            } else if (snapshot.hasError) {
              return new Center(child: new Text("${snapshot.error}"));
            } else {
              return new Center(child: new Text("Loading..."));
            }
          }),
    ));
  }

  Widget createListView() {
    return new ListView.builder(
        controller: _controller,
        padding: const EdgeInsets.all(16.0),
        itemCount: items == null ? 0 : items.length,
        itemBuilder: (context, index) {
          if (index == items.length) {
            return _buildProgressIndicator();
          } else {
            return ProjectRow(items[index] as RankProject);
          }
        });
  }

  Widget _buildLoadText() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Text("加载中……"),
        ),
      ),
      color: Colors.white70,
    );
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoadingMore ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  Future<RankData> fetchRankProjects() async {
    String url =
        'https://api.github.com/search/repositories?q=language:java&sort=stars&page=' +
            pageIndex.toString();
    print(url);
    final response = await http.get(url);
    final responseJson = json.decode(response.body);
    return new RankData.fromJson(responseJson);
  }

  void refreshList() async {
    // reload
    setState(() {
      _listFuture = fetchRankProjects();
    });
  }
}
