import 'package:code_rank/Theme.dart' as Theme;
import 'package:code_rank/model/rank_project.dart';
import 'package:flutter/material.dart';

class ProjectRow extends StatelessWidget {
  final RankProject projectData;

  ProjectRow(this.projectData);

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
        height: 210.0,
        child: new Card(
          child: new Container(
              padding: new EdgeInsets.all(10.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  new CircleAvatar(
                    backgroundImage: new NetworkImage(projectData.owner.avatar_url),
                    radius: 30.0 ,


                  ),
                  new Container(
                    padding: new EdgeInsets.all(10.0),
                    child: new Column(
                      children: [
                      new Text(projectData.name,
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.black87)),
                        new Expanded(
                          child: new Text(projectData.html_url,
                              style: new TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black87)),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
