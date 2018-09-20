import 'package:code_rank/Theme.dart' as Theme;
import 'package:code_rank/model/rank_project.dart';
import 'package:flutter/material.dart';

class ProjectRow extends StatelessWidget {
  final RankProject projectData;

  ProjectRow(this.projectData);

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
      alignment: new FractionalOffset(0.0, 0.5),
      margin: const EdgeInsets.only(left: 24.0),
      child: new Hero(
        tag: 'planet-icon-${projectData.id}',
        child: new Image(
          image: new AssetImage(projectData.html_url),
          height: Theme.Dimens.planetHeight,
          width: Theme.Dimens.planetWidth,
        ),
      ),
    );

    final planetCard = new Container(
      margin: const EdgeInsets.only(left: 72.0, right: 24.0),
      decoration: new BoxDecoration(
        color: Theme.Colors.planetCard,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0))
        ],
      ),
      child: new Container(
        margin: const EdgeInsets.only(top: 16.0, left: 72.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(projectData.name, style: Theme.TextStyles.planetTitle),
            new Text(projectData.name, style: Theme.TextStyles.planetLocation),
            new Container(
                color: const Color(0xFF00C6FF),
                width: 24.0,
                height: 1.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0)),
            new Row(
              children: <Widget>[
                new Icon(Icons.location_on,
                    size: 14.0, color: Theme.Colors.planetDistance),
                new Text(projectData.name,
                    style: Theme.TextStyles.planetDistance),
                new Container(width: 24.0),
                new Icon(Icons.flight_land,
                    size: 14.0, color: Theme.Colors.planetDistance),
                new Text(projectData.name,
                    style: Theme.TextStyles.planetDistance),
              ],
            )
          ],
        ),
      ),
    );

    return new Container(
      height: 120.0,
      margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: new FlatButton(
        onPressed: () => _navigateTo(context, projectData.name),
        child: new Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ),
      ),
    );
  }

  _navigateTo(context, String id) {}
}
