import 'package:flutter/material.dart';
import 'package:flutter_view_controller/models/view_abstract.dart';
import 'package:json_annotation/json_annotation.dart';

import 'sizes.dart';

// @reflector
part 'products.g.dart';

@JsonSerializable(explicitToJson: true)
class Product extends ViewAbstract<Product> {
  String? thisIsATest;

  Size? sizes;

  String? comments;
  String? barcode;
  String? products_count;

  double? pending_reservation_invoice;
  double? cut_request_quantity;

  Product() : super();

  @override
  Icon? getIcon(BuildContext context) {
    return Icon(Icons.add_card_rounded);
  }

  @override
  Text getSubtitleHeaderText(BuildContext context) {
    return Text(
        "pending_reservation_invoice    ${pending_reservation_invoice}");
  }

  @override
  Text? getHeaderText(BuildContext context) {
    return Text("${sizes?.width?.toString()}");
  }

  @override
  Text? getLabelText(BuildContext context) {
    return Text(iD.toString());
  }

  @override
  ImageProvider? getCardLeadingImage(BuildContext context) {
    return null;
  }

  @override
  Product fromJsonViewAbstract(Map<String, dynamic> json) {
    // TODO: implement fromJsonViewAbstract
    return Product.fromJson(json);
  }

  @override
  String? getTableNameApi() {
    // TODO: implement getTableNameApi
    return "products";
  }

  @override
  Map<String, dynamic> toJsonViewAbstract() {
    // TODO: implement toJsonViewAbstract
    return toJson();
  }

  factory Product.fromJson(Map<String, dynamic> data) =>
      _$ProductFromJson(data);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
