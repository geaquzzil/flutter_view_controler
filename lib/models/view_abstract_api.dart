import 'dart:collection';
import 'dart:convert' as convert;
import 'package:flutter_view_controller/models/servers/server_response_master.dart';
import 'package:http/http.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

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

  Map<String, String> getBody(ServerActions? action) {
    Map<String, String> mainBody = HashMap<String, String>();
    mainBody.addAll(getBodyExtenstionParams());
    mainBody.addAll(getBodyCurrentAction(action));
    Map<String, String> defaultBody = {
      "action": action.toString().split('.').last,
      "table": getTableNameApi(),
    };
    mainBody.addAll(defaultBody);
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

  Map<String, dynamic> getBodyCurrentAction(ServerActions? action) {
    Map<String, dynamic> mainBody = HashMap();
    String? customAction = getCustomAction();
    mainBody['action'] = customAction ?? action.toString().split(".").last;
    mainBody['objectTables'] = requireObjects();
    mainBody['detailTables'] = requireObjectsList() == null
        ? convert.jsonEncode([])
        : convert.jsonEncode(requireObjectsList());
    return mainBody;
  }
}

class OnResponseCallback {
  final void Function() onServerNoMoreItems;
  final void Function(dynamic o) onServerFailure;
  final void Function(dynamic o) onServerFailureResponse;
  OnResponseCallback(
      {required this.onServerNoMoreItems,
      required this.onServerFailure,
      required this.onServerFailureResponse});
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
