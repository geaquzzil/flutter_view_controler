import 'package:flutter/material.dart';

import '../../models/view_abstract.dart';
import '../../view_generator_helper.dart';

class HomeMobilePage extends StatelessWidget {
  List<ViewAbstract> drawerItems;
  HomeMobilePage({Key? key, required this.drawerItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: const Center(
          child: Text("test page"),
        ),
        drawer: ViewHelper.getDrawer(context, drawerItems),
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("This is a test"),
        ));
  }
}
