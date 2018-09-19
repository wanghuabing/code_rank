import 'package:flutter/material.dart';
import 'package:code_rank/model/rank_data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RankPage extends StatefulWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      body: Center(child: Text('First Page!')),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RankPageState();
  }

}

class _RankPageState  extends State<RankPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Sample App"),
        ),
        body: getBody());
  }

  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }

    return false;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog() {
    return new Center(child: new CircularProgressIndicator());
  }

  ListView getListView() => new ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  Widget getRow(int i) {
    return new Padding(padding: new EdgeInsets.all(10.0), child: new Text("Row ${widgets[i]["title"]}"));
  }

  loadData() async {
    String dataURL = "https://api.github.com/search/repositories?q=language:java&sort=stars";
    http.Response response = await http.get(dataURL);
    final jsonResponse = json.decode(response.body);
    RankData data = new RankData.fromJson(jsonResponse);
//    setState(() {
//      widgets = json.decode(response.body);
//    });
  }


}
