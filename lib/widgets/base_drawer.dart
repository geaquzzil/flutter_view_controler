import 'package:flutter/material.dart';

import '../models/view_abstract.dart';
import '../view_generator_helper.dart';

class DrawerPage extends StatefulWidget {
  List<ViewAbstract> drawerItems;
  DrawerPage({Key? key, required this.drawerItems}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DrawerPage();
}

class _DrawerPage extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: ViewHelper.getDrawer(context, widget.drawerItems),
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("This is a test"),
        ));
  }
}
