import 'package:flutter/material.dart';

abstract class ViewAbstractBase<T> {
  
  Icon? getIcon(BuildContext context) {
    return null;
  }

  Text? getHeaderText(BuildContext context) {
    return null;
  }

  Text? getLabelText(BuildContext context) {
    return null;
  }
}
