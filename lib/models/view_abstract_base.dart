import 'package:flutter/material.dart';

abstract class ViewAbstractBase<T> {
  ImageProvider? getCardLeadingImage(BuildContext context) {
    return null;
  }

  Icon? getIcon(BuildContext context) {
    return null;
  }

  Text? getSubtitleHeaderText(BuildContext context) {
    return null;
  }

  Text? getHeaderText(BuildContext context) {
    return null;
  }

  Text? getLabelText(BuildContext context) {
    return null;
  }
}
