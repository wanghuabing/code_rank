import 'package:code_rank/ui/mine/my_home.dart';
import 'package:code_rank/ui/rank/rank_list.dart';
import 'package:code_rank/ui/setting/setting.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("热门排行", Icons.rss_feed),
    new DrawerItem("我的", Icons.near_me),
    new DrawerItem("设置", Icons.settings)
  ];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new RankPage();
      case 1:
        return new MyHomePage();
      case 2:
        return new SettingPage();
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Canv'),
              accountEmail: new Text('wang.huabing@163.com'),
              currentAccountPicture:
                  new CircleAvatar(backgroundImage: new AssetImage("images/head.jpeg")),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(backgroundImage: new AssetImage("images/ic_share_qq.png")),
                new CircleAvatar(backgroundImage: new AssetImage("images/ic_share_weixin.png")),
              ],
              onDetailsPressed: () {},
            ),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}
