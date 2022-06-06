import 'package:flutter_view_controller/models/view_abstract.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sizes.g.dart';

@JsonSerializable()
class Size extends ViewAbstract<Size> {
  String? width;
  String? length;

  Size() : super();

  @override
  Size fromJsonViewAbstract(Map<String, dynamic> json) {
    // TODO: implement fromJsonViewAbstract
    return Size.fromJson(json);
  }

  @override
  String? getTableNameApi() {
    // TODO: implement getTableNameApi
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJsonViewAbstract() {
    // TODO: implement toJsonViewAbstract
    return toJson();
  }

  factory Size.fromJson(Map<String, dynamic> data) => _$SizeFromJson(data);

  Map<String, dynamic> toJson() => _$SizeToJson(this);
}
