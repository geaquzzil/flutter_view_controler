
import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../models/view_abstract.dart';
import 'base_home_responsive_page.dart';

class BaseHomePage<T extends ViewAbstract> extends StatelessWidget {
  List<T> drawerItems;

  BaseHomePage({Key? key, required this.drawerItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.dark,
    //   statusBarBrightness:
    //       !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
    //   systemNavigationBarColor: Colors.white,
    //   systemNavigationBarDividerColor: Colors.transparent,
    //   systemNavigationBarIconBrightness: Brightness.dark,
    // ));
    return MaterialApp(
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      home: ResponsivePage(drawerItems: (drawerItems)),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
