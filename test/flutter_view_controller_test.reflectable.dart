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
              r'==': 1,
              r'toString': 0,
              r'noSuchMethod': 1,
              r'hashCode': 0,
              r'runtimeType': 0,
              r'getCardLeadingImage': 1,
              r'getIcon': 1,
              r'getSubtitleHeaderText': 1,
              r'getHeaderText': 1,
              r'getLabelText': 1,
              r'iD': 0,
              r'iD=': 1,
              r'getCustomAction': 0,
              r'requireObjects': 0,
              r'requireObjectsList': 0,
              r'getBodyExtenstionParams': 0,
              r'getBodyCurrentActionASC': 1,
              r'getBody': 1,
              r'getHeadersExtenstion': 0,
              r'getHeaders': 0,
              r'getRespones': 2,
              r'viewCall': 3,
              r'addCall': 2,
              r'listCall': 4,
              r'getHttp': 0,
              r'getBodyCurrentAction': 1,
              r'onCardClicked': 1,
              r'getCardListView': 1,
              r'onDrawerItemClicked': 1,
              r'getDrawerListTitle': 1,
              r'getTableNameApi': 0,
              r'fromJsonViewAbstract': 1,
              r'toJsonViewAbstract': 0
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
              r'==': 1,
              r'toString': 0,
              r'noSuchMethod': 1,
              r'hashCode': 0,
              r'runtimeType': 0,
              r'getCardLeadingImage': 1,
              r'getIcon': 1,
              r'getSubtitleHeaderText': 1,
              r'getHeaderText': 1,
              r'getLabelText': 1,
              r'iD': 0,
              r'iD=': 1,
              r'getCustomAction': 0,
              r'requireObjects': 0,
              r'requireObjectsList': 0,
              r'getBodyExtenstionParams': 0,
              r'getBodyCurrentActionASC': 1,
              r'getBody': 1,
              r'getHeadersExtenstion': 0,
              r'getHeaders': 0,
              r'getRespones': 2,
              r'viewCall': 3,
              r'addCall': 2,
              r'listCall': 4,
              r'getHttp': 0,
              r'getBodyCurrentAction': 1
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
        r'getCardLeadingImage': (dynamic instance) =>
            instance.getCardLeadingImageProvider,
        r'getIcon': (dynamic instance) => instance.getIcon,
        r'getSubtitleHeaderText': (dynamic instance) =>
            instance.getSubtitleHeaderText,
        r'getHeaderText': (dynamic instance) => instance.getHeaderText,
        r'getLabelText': (dynamic instance) => instance.getLabelText,
        r'iD': (dynamic instance) => instance.iD,
        r'getCustomAction': (dynamic instance) => instance.getCustomAction,
        r'requireObjects': (dynamic instance) => instance.requireObjects,
        r'requireObjectsList': (dynamic instance) =>
            instance.requireObjectsList,
        r'getBodyExtenstionParams': (dynamic instance) =>
            instance.getBodyExtenstionParams,
        r'getBodyCurrentActionASC': (dynamic instance) =>
            instance.getBodyCurrentActionASC,
        r'getBody': (dynamic instance) => instance.getBody,
        r'getHeadersExtenstion': (dynamic instance) =>
            instance.getHeadersExtenstion,
        r'getHeaders': (dynamic instance) => instance.getHeaders,
        r'getRespones': (dynamic instance) => instance.getRespones,
        r'viewCall': (dynamic instance) => instance.viewCall,
        r'addCall': (dynamic instance) => instance.addCall,
        r'listCall': (dynamic instance) => instance.listCall,
        r'getHttp': (dynamic instance) => instance.getHttp,
        r'getBodyCurrentAction': (dynamic instance) =>
            instance.getBodyCurrentAction,
        r'onCardClicked': (dynamic instance) => instance.onCardClicked,
        r'getCardListView': (dynamic instance) => instance.getCardListView,
        r'onDrawerItemClicked': (dynamic instance) =>
            instance.onDrawerItemClicked,
        r'getDrawerListTitle': (dynamic instance) =>
            instance.getDrawerListTitle,
        r'getTableNameApi': (dynamic instance) => instance.getTableNameApi,
        r'fromJsonViewAbstract': (dynamic instance) =>
            instance.fromJsonViewAbstract,
        r'toJsonViewAbstract': (dynamic instance) => instance.toJsonViewAbstract
      },
      {r'iD=': (dynamic instance, value) => instance.iD = value},
      null,
      [
        const [0, 0, null],
        const [1, 0, null],
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
        const [
          2,
          0,
          const [#onResponse]
        ]
      ])
};

final _memberSymbolMap = null;

void initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}
