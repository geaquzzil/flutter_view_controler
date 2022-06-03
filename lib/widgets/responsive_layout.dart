import 'package:flutter/material.dart';

class Responsive {
  static const mobileWidth = 599;
  static const foldableSmallTablet = 839;
  static const largeTablet = 840;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < foldableSmallTablet &&
      MediaQuery.of(context).size.width > mobileWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > largeTablet;
}
