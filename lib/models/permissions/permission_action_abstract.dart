import '../view_abstract.dart';

abstract class PermissionActionAbstract
    extends ViewAbstract<PermissionActionAbstract> {
  String? table_name;
  int? print;
  int? notification;
  int? list;
  int? view;
  int? add;
  int? edit;
  int? delete_action;

  PermissionActionAbstract() : super
}
