import 'package:flutter/material.dart';

class HeaderItem {
  final String title;
  Function(BuildContext context)? onClickAction;
  VoidCallback? onTap;
  final bool isButton;

  HeaderItem({
    required this.title,
    this.onTap,
    this.onClickAction,
    this.isButton = false,
  });
}
