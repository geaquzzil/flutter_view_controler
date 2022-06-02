// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.
// @dart = 2.12

import 'dart:core';
import 'flutter_view_controller_test.dart' as prefix1;
import 'package:flutter_view_controller/models/view_abstract_api.dart'
    as prefix0;

// ignore_for_file: prefer_adjacent_string_concatenation
// ignore_for_file: prefer_collection_literals
// ignore_for_file: unnecessary_const
// ignore_for_file: implementation_imports

// ignore:unused_import
import 'package:reflectable/mirrors.dart' as m;
// ignore:unused_import
import 'package:reflectable/src/reflectable_builder_based.dart' as r;
// ignore:unused_import
import 'package:reflectable/reflectable.dart' as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{
  const prefix0.Reflector(): r.ReflectorData(
      <m.TypeMirror>[
        r.NonGenericClassMirrorImpl(
            r'Product',
            r'.Product',
            7,
            0,
            const prefix0.Reflector(),
            const <int>[-1],
            null,
            null,
            -1,
            {},
            {},
            {r'': (bool b) => () => b ? prefix1.Product() : null},
            -1,
            -1,
            const <int>[-1],
            null,
            {
              r'==': 0,
              r'toString': 1,
              r'noSuchMethod': 0,
              r'hashCode': 1,
              r'runtimeType': 1,
              r'getCustomAction': 1,
              r'requireObjects': 1,
              r'requireObjectsList': 1,
              r'getBodyExtenstionParams': 1,
              r'getBodyCurrentActionASC': 0,
              r'getBody': 0,
              r'getRespones': 2,
              r'view': 3,
              r'add': 2,
              r'list': 4,
              r'getHttp': 1,
              r'getBodyCurrentAction': 0,
              r'iD': 1,
              r'iD=': 0,
              r'fromJson': 0,
              r'getTableNameApi': 1,
              r'toJson': 1
            }),
        r.GenericClassMirrorImpl(
            r'ViewAbstractApi',
            r'.ViewAbstractApi',
            519,
            1,
            const prefix0.Reflector(),
            const <int>[-1],
            null,
            null,
            -1,
            {},
            {},
            {},
            -1,
            -1,
            const <int>[-1],
            null,
            {
              r'==': 0,
              r'toString': 1,
              r'noSuchMethod': 0,
              r'hashCode': 1,
              r'runtimeType': 1,
              r'getCustomAction': 1,
              r'requireObjects': 1,
              r'requireObjectsList': 1,
              r'getBodyExtenstionParams': 1,
              r'getBodyCurrentActionASC': 0,
              r'getBody': 0,
              r'getRespones': 2,
              r'view': 3,
              r'add': 2,
              r'list': 4,
              r'getHttp': 1,
              r'getBodyCurrentAction': 0,
              r'iD': 1,
              r'iD=': 0
            },
            (o) => false,
            null,
            1),
        r.TypeVariableMirrorImpl(
            r'T', r'.ViewAbstractApi.T', const prefix0.Reflector(), -1, 1, null)
      ],
      null,
      null,
      <Type>[prefix1.Product, prefix0.ViewAbstractApi],
      2,
      {
        r'==': (dynamic instance) => (x) => instance == x,
        r'toString': (dynamic instance) => instance.toString,
        r'noSuchMethod': (dynamic instance) => instance.noSuchMethod,
        r'hashCode': (dynamic instance) => instance.hashCode,
        r'runtimeType': (dynamic instance) => instance.runtimeType,
        r'getCustomAction': (dynamic instance) => instance.getCustomAction,
        r'requireObjects': (dynamic instance) => instance.requireObjects,
        r'requireObjectsList': (dynamic instance) =>
            instance.requireObjectsList,
        r'getBodyExtenstionParams': (dynamic instance) =>
            instance.getBodyExtenstionParams,
        r'getBodyCurrentActionASC': (dynamic instance) =>
            instance.getBodyCurrentActionASC,
        r'getBody': (dynamic instance) => instance.getBody,
        r'getRespones': (dynamic instance) => instance.getRespones,
        r'view': (dynamic instance) => instance.view,
        r'add': (dynamic instance) => instance.add,
        r'list': (dynamic instance) => instance.list,
        r'getHttp': (dynamic instance) => instance.getHttp,
        r'getBodyCurrentAction': (dynamic instance) =>
            instance.getBodyCurrentAction,
        r'iD': (dynamic instance) => instance.iD,
        r'fromJson': (dynamic instance) => instance.fromJson,
        r'getTableNameApi': (dynamic instance) => instance.getTableNameApi,
        r'toJson': (dynamic instance) => instance.toJson
      },
      {r'iD=': (dynamic instance, value) => instance.iD = value},
      null,
      [
        const [1, 0, null],
        const [0, 0, null],
        const [
          0,
          0,
          const [#serverActions, #onResponse]
        ],
        const [
          1,
          0,
          const [#onResponse]
        ],
        const [2, 0, null]
      ])
};

final _memberSymbolMap = null;

void initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}
