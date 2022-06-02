import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_view_controller/flutter_view_controller.dart';

import 'package:flutter_view_controller/models/view_abstract_api.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });
  test('test list', () async {
    print("TEST Run");
    Product product = new Product();
    await product.view(2);
  });
}

class Product extends ViewAbstractApi<Product> {
  @override
  Product fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  String getTableNameApi() {
    // TODO: implement getTableNameApi
    return "orders";
  }
}
