import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter_view_controller/models/servers/server_response.dart';

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
    Product? product = Product();
    product = await product.view(2,
        onResponse: OnResponseCallback(onServerNoMoreItems: () {
          //...
        }, onServerFailure: (message) {
          //...
        }, onServerFailureResponse: (message) {
          expect((message as ServerResponse).isAuthError(), true);
          //...
        }));
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
  
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
