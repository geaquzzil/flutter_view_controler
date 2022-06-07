import 'package:flutter/material.dart';
import 'package:flutter_view_controller/constants.dart';

abstract class ViewAbstractBase<T> {
  String iD = "-1";

  Color getColor(BuildContext context) => Colors.red;

  Widget getCardLeading(BuildContext context) {
    return CircleAvatar(
      radius: 28,
      backgroundImage: getCardLeadingImageProvider(context),
    );
  }

  Widget getCardLeadingImage(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.green,
            image: DecorationImage(
                image: getCardLeadingImageProvider(
                    context)! // convert Image object to ImageProvider
                )));
  }

  ImageProvider? getCardLeadingImageProvider(BuildContext context) {
    return null;
  }

  Icon? getIcon(BuildContext context) {
    return null;
  }

  Text? getSubtitleHeaderText(BuildContext context) {
    return Text(getSubtitleHeaderTextOnly(context),
        style: const TextStyle(color: kTextLightColor));
  }

  String getSubtitleHeaderTextOnly(BuildContext context) {
    return "null";
  }

  Text? getHeaderText(BuildContext context) {
    return Text(getHeaderTextOnly(context),
        style: const TextStyle(color: kTextLightColor));
  }

  String getHeaderTextOnly(BuildContext context) {
    return "null";
  }

  Text? getLabelText(BuildContext context) {
    return null;
  }

  String? getLabelTextOnly(BuildContext context) {
    return "null";
  }
}
