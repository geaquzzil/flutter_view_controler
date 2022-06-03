import 'package:flutter/material.dart';
import 'package:flutter_view_controller/widgets/responsive_size_layout/home_large_tablet.dart';
import 'package:flutter_view_controller/widgets/responsive_size_layout/home_mobile_page.dart';
import 'package:flutter_view_controller/widgets/responsive_size_layout/home_small_tablet_page.dart';

import '../models/view_abstract.dart';
import '../view_generator_helper.dart';

const mobileWidth = 599;
const foldableSmallTablet = 839;
const largeTablet = 840;

class DrawerPage extends StatefulWidget {
  List<ViewAbstract> drawerItems;
  DrawerPage({Key? key, required this.drawerItems}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DrawerPage();
}

class _DrawerPage extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return HomeMobilePage(drawerItems: widget.drawerItems);
        } else if (constraints.maxWidth > mobileWidth &&
            constraints.maxWidth < foldableSmallTablet) {
          return HomeSmallTabletPage(drawerItems: widget.drawerItems);
        } else {
          return HomeLargeTabletPage(drawerItems: widget.drawerItems);
        }
      },
    );
  }
}
