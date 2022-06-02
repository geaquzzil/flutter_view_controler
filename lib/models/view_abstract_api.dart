import 'dart:collection';
import 'dart:convert' as convert;
import 'package:flutter_view_controller/models/servers/server_response_master.dart';
import 'package:http/http.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:reflectable/reflectable.dart';

import 'servers/server_helpers.dart';

// Annotate with this class to enable reflection.
class Reflector extends Reflectable {
  const Reflector()
      : super(invokingCapability); // Request the capability to invoke methods.
}

const reflector = const Reflector();

@reflector
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
    Map<String, String> map = HashMap<String, String>();

    return map;
  }

  Map<String, String> getBody(ServerActions? action) {
    Map<String, String> mainBody = HashMap<String, String>();
    mainBody.addAll(getBodyExtenstionParams());
    mainBody.addAll(getBodyCurrentAction(action));
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

  Future<T?> add({OnResponseCallback? onResponse}) async {
    var response = await getRespones(
        onResponse: onResponse, serverActions: ServerActions.add);
    if (response == null) return null;
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
    switch (action) {
      case ServerActions.add:
        //TODO multiple add
        mainBody['data'] = convert.jsonEncode(toJson());
        break;
      case ServerActions.view:
      case ServerActions.delete_action:
        mainBody['<iD>'] = iD.toString();
        break;
      case ServerActions.list:
        mainBody.addAll(getBodyCurrentActionASC(action));
        break;
      default:
        break;
    }

    return mainBody;
  }
}
