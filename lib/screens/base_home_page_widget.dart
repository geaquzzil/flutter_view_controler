import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_view_controller/constants.dart';
import 'package:flutter_view_controller/screens/web/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

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
    if (kIsWeb) {
      return MaterialApp(
        title: "Flutter Portfolio",
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: Theme.of(context).copyWith(
          platform: TargetPlatform.android,
          scaffoldBackgroundColor: kBackgroundColor,
          primaryColor: kPrimaryColor,
          canvasColor: kBackgroundColor,
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget),
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.resize(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.resize(2460, name: "4K"),
          ],
          background: Container(
            color: kBackgroundColor,
          ),
        ),
        home: HomeWebPage(),
      );
    }
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
