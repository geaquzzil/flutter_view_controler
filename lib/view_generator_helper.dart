import 'package:flutter/material.dart';

import 'models/view_abstract.dart';

class ViewHelper {
  static Drawer getDrawer<T extends ViewAbstract>(
      BuildContext context, List<T> list) {
    return Drawer(
      child: getDrawableListView(context, list),
    );
  }

  static ListView getDrawableListView<T extends ViewAbstract>(
      BuildContext context, List<T> list) {
    return ListView(
        padding: EdgeInsets.zero,
        children: List<Widget>.from(
            list.map((model) => model.getDrawerListTitle(context))));
  }
}
