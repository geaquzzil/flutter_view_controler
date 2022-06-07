import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter_view_controller/models/servers/server_helpers.dart';
import 'package:flutter_view_controller/models/servers/server_response.dart';
import 'package:flutter_view_controller/models/view_abstract.dart';

import 'package:flutter_view_controller/models/view_abstract_api.dart';
import 'package:flutter_view_controller/screens/action_screens/list_page.dart';

void main() {
  testWidgets(
    "test list page",
    (WidgetTester tester) async {
      await tester
          .pumpWidget(MaterialApp(home: ListPage(view_abstract: Product())));
      //  tester.pump();

      await Future.delayed(const Duration(seconds: 5), () {});
    },
  );
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });
  test('test list', () async {
    // initializeReflectable();
    Product? product = Product();
    await product.listCall(2, 0);
  });
  test('test view', () async {
    print("TEST Run");
    // initializeReflectable();
    Product? product = Product();
    //   ClassMirror aMirror = reflector.reflectType(product);
    // final declarations = aMirror.declarations;
    // print(abMirror.type.typeArguments[0].reflectedType); // Prints 'B'.
    // print(abMirror.type.reflectedTypeArguments[0] == B); // Prints 'true'.
    product = await product.viewCall(2,
        onResponse: OnResponseCallback(onServerNoMoreItems: () {
          //...
        }, onServerFailure: (message) {
          //...
        }, onServerFailureResponse: (message) {
          expect((message as ServerResponse).isAccountLoggedIn(), false);
          //...
        }));
    print(product?.toString());
  });
  // test('encryption', () async {
  //   expect(
  //       AesHelper.encrypt(
  //           "qusasafo12345&!#", "HIIAMANANDROIDUSERFROMSAFFOURYCOMPANY"),
  //       "+mXm4rs0AuZvxFi8Di1Ryj/pqu2yZjK3Gx4wIYEi0QCfDoJn1hB3Wl4onJvvCh1RIcfJP5IbMVdnJW1mpnzW7A==");
  // });
}

@reflector
class Product extends ViewAbstract<Product> {
  @override
  String getTableNameApi() {
    // TODO: implement getTableNameApi
    return "products";
  }

  @override
  Product fromJsonViewAbstract(Map<String, dynamic> json) {
    // TODO: implement fromJsonViewAbstract
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJsonViewAbstract() {
    // TODO: implement toJsonViewAbstract
    throw UnimplementedError();
  }

  // // Reflect upon [x] using the const instance of the reflector:
  // InstanceMirror instanceMirror = reflector.reflect(x);
  // int weekday = new DateTime.now().weekday;
  // // On Fridays we test if 3 is greater than 10, on other days if it is less
  // // than or equal.
  // String methodName = weekday == DateTime.FRIDAY ? "greater" : "lessEqual";
  // // Reflectable invocation:
  // print(instanceMirror.invoke(methodName, [3]));

  // ClassMirror aMirror = reflector.reflectType(A);
  // final declarations = aMirror.declarations;
  // VariableMirror abMirror = declarations['ab'];
  // VariableMirror axMirror = declarations['ax'];
  // print(abMirror.type.typeArguments[0].reflectedType); // Prints 'B'.
  // print(abMirror.type.reflectedTypeArguments[0] == B); // Prints 'true'.
  // try {
  //   print(axMirror.type.typeArguments[0]); // Throws 'UnimplementedError'.
  //   print("Not reached");
  // } on UnimplementedError catch (_) {
  //   print("As expected: Could not get type mirror for type argument.");
  // }
  // try {
  //   axMirror.type.reflectedTypeArguments[0]; // Throws 'UnimplementedError'.
  //   print("Not reached");
  // } on UnimplementedError catch (_) {
  //   print("As expected: Could not get reflected type argument.");
  // }
}
