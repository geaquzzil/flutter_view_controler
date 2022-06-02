import 'dart:collection';
import 'dart:convert' as convert;
import 'package:flutter_view_controller/models/servers/server_response_master.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

import 'servers/server_response.dart';

abstract class ViewAbstractApi<T> implements OnResponse<T> {
  @override
  void onServerFailure(Object o) {
    // TODO: implement onServerFailure
  }
  @override
  void onServerNoMoreItems() {
    // TODO: implement onServerNoMoreItems
  }
  @override
  void onServerResponseAddEditDelete(
      List<T> list, ServerActions serverActions) {
    // TODO: implement onServerResponseAddEditDelete
  }
  @override
  void onServerResponseList(List<T> list) {
    // TODO: implement onServerResponseList
  }
  @override
  void onServerResponseSingleObject(T object, ServerActions serverAction) {
    // TODO: implement onServerResponseSingleObject
  }
  T fromJson(Map<String, dynamic> json);

  String getTableNameApi();
  Map<String, String> getBodyExtenstionParams() => {};

  Map<String, String> getBody(String action) {
    Map<String, String> mainBody = HashMap<String, String>();
    mainBody.addAll(getBodyExtenstionParams());
    mainBody.addAll(getBodyCurrentAction(action));
    Map<String, String> defaultBody = {
      "action": action,
      "table": getTableNameApi(),
    };
    mainBody.addAll(defaultBody);
    return mainBody;
  }

  @override
  void onServerFailureResponse(ServerResponse sr, ServerActions serverActions) {
    print(sr.toJson());
  }

  int iD = -1;

  Future<T> view(int iD) async {
    var response = await getHttp().post(Uri.parse(URLS.BASE_URL),
        headers: URLS.requestHeaders, body: getBody("view"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return fromJson(convert.jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      ServerResponseMaster serverResponse =
          ServerResponseMaster.fromJson(convert.jsonDecode(response.body));
      onServerFailureResponse(
          serverResponse.serverResponse, ServerActions.view);
      throw Exception('Failed to load album');
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<T> add() async {
    throw Exception('TODO');
  }

  Future<List<T>> list(int count, int page) async {
    var response = await getHttp().post(Uri.parse(URLS.BASE_URL),
        headers: URLS.requestHeaders, body: getBody("list"));

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

  Map<String, String> getBodyCurrentAction(String action) {
    if (action == "view") return {"<iD>": "621"};
    return {};
  }
}

abstract class OnResponse<T> {
  void onServerNoMoreItems();
  void onServerResponseList(List<T> list);
  void onServerResponseAddEditDelete(List<T> list, ServerActions serverActions);
  void onServerResponseSingleObject(T object, ServerActions serverAction);
  void onServerFailure(Object o);
  void onServerFailureResponse(ServerResponse sr, ServerActions serverActions);
}

enum ServerActions {
  print,
  notification,
  list,
  view,
  add,
  edit,
  delete_action,
  file
}

class URLS {
  static const String BASE_URL = 'http://saffoury.com/SaffouryPaper2/index.php';

  static const Map<String, String> requestHeaders = {
    'Accept': 'application/json',
    'Authorization': '<Your token>',
    'Accept-Encoding': 'gzip',
  };
}
