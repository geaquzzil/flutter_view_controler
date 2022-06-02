import 'dart:collection';
import 'dart:convert' as convert;
import 'package:flutter_view_controller/models/servers/server_response_master.dart';
import 'package:http/http.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

import 'servers/server_helpers.dart';

abstract class ViewAbstractApi<T> {
  int iD = -1;
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();

  String? getTableNameApi();
  String? getCustomAction() {
    return null;
  }

  bool requireObjects() {
    return true;
  }

  List<String>? requireObjectsList() {
    return null;
  }

  Map<String, String> getBodyExtenstionParams() => {};
  Map<String, String> getBodyCurrentActionASC(ServerActions? action) {
    switch (action) {
      case ServerActions.list:
        Map<String, String> map = HashMap<String, String>();
        //  map['']
        return map;
      default:
        return {};
    }
  }

  Map<String, String> getBody(ServerActions? action) {
    Map<String, String> mainBody = HashMap<String, String>();
    mainBody.addAll(getBodyExtenstionParams());
    mainBody.addAll(getBodyCurrentAction(action));
    mainBody.addAll(getBodyCurrentActionASC(action));
    return mainBody;
  }

  Future<Response?> getRespones(
      {ServerActions? serverActions, OnResponseCallback? onResponse}) async {
    try {
      return await getHttp().post(Uri.parse(URLS.BASE_URL),
          headers: URLS.requestHeaders, body: getBody(serverActions));
    } on Exception catch (e) {
      // Display an alert, no internet
      onResponse?.onServerFailure(e);
      return null;
    } catch (err) {
      return null;
    }
  }

  Future<T?> view(int iD, {OnResponseCallback? onResponse}) async {
    var response = await getRespones(
        onResponse: onResponse, serverActions: ServerActions.view);
    if (response == null) return null;
    if (response.statusCode == 200) {
      return fromJson(convert.jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      ServerResponseMaster serverResponse =
          ServerResponseMaster.fromJson(convert.jsonDecode(response.body));
      onResponse?.onServerFailureResponse(serverResponse.serverResponse);
      //throw Exception('Failed to load album');
      return null;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      return null;
    }
  }

  Future<T> add() async {
    throw Exception('TODO');
  }

  Future<List<T>> list(int count, int page) async {
    var response = await getHttp().post(Uri.parse(URLS.BASE_URL),
        headers: URLS.requestHeaders, body: getBody(ServerActions.list));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      Iterable l = convert.jsonDecode(response.body);
      return List<T>.from(l.map((model) => fromJson(model)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  HttpWithMiddleware getHttp() => HttpWithMiddleware.build(middlewares: [
        HttpLogger(logLevel: LogLevel.BODY),
      ]);

  Map<String, String> getBodyCurrentAction(ServerActions? action) {
    Map<String, String> mainBody = HashMap();
    String? customAction = getCustomAction();
    mainBody['action'] = customAction ?? action.toString().split(".").last;
    mainBody['objectTables'] = convert.jsonEncode(requireObjects());
    mainBody['detailTables'] = requireObjectsList() == null
        ? convert.jsonEncode([])
        : convert.jsonEncode(requireObjectsList());

    String? table = getTableNameApi();
    if (table != null) {
      mainBody['table'] = table;
    }

    return mainBody;
  }
}
