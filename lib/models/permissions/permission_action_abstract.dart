import 'package:json_annotation/json_annotation.dart';

import '../view_abstract.dart';

part 'permission_action_abstract.g.dart';

@JsonSerializable()
class PermissionActionAbstract extends ViewAbstract<PermissionActionAbstract> {
  String? table_name;
  int? print;
  int? notification;
  int? list;
  int? view;
  int? add;
  int? edit;
  int? delete_action;

  PermissionActionAbstract() : super();

  factory PermissionActionAbstract.fromJson(Map<String, dynamic> data) =>
      _$PermissionActionAbstractFromJson(data);

  Map<String, dynamic> toJson() => _$PermissionActionAbstractToJson(this);

  @override
  PermissionActionAbstract fromJsonViewAbstract(Map<String, dynamic> data) {
    return PermissionActionAbstract.fromJson(data);
  }

  @override
  String? getTableNameApi() {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJsonViewAbstract() {
    return toJson();
  }
}
