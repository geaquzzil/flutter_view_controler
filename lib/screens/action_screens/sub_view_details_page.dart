import 'package:flutter/material.dart';
import 'package:flutter_view_controller/models/view_abstract.dart';

class SubDetailsView extends StatefulWidget {
  String label
  dynamic object;
  SubDetailsView({Key? key, required this.object}) : super(key: key);

  @override
  State<SubDetailsView> createState() => _SubDetailsViewState();
}

class _SubDetailsViewState extends State<SubDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }







}
