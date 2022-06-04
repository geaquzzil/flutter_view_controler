import 'package:flutter/material.dart';
import 'package:flutter_view_controller/components/large_screens/home_large_tablet.dart';
import 'package:flutter_view_controller/components/small_screens/home_mobile_page.dart';
import 'package:flutter_view_controller/components/small_tablets_screens/home_small_tablet_page.dart';

import '../models/view_abstract.dart';
import 'responsive_layout.dart';

class ResponsivePage extends StatefulWidget {
  List<ViewAbstract> drawerItems;
  ResponsivePage({Key? key, required this.drawerItems}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResponsivePage();
}

class _ResponsivePage extends State<ResponsivePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (Responsive.isMobile(context)) {
          return HomeMobilePage(drawerItems: widget.drawerItems);
        } else if (Responsive.isTablet(context)) {
          return HomeSmallTabletPage(drawerItems: widget.drawerItems);
        } else {
          return HomeLargeTabletPage(drawerItems: widget.drawerItems);
        }
      },
    );
  }
}
