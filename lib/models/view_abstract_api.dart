import 'dart:collection';
import 'dart:convert' as convert;
import 'package:json_annotation/json_annotation.dart';
import 'package:build_runner/build_runner.dart';
import 'package:json_serializable/json_serializable.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

abstract class ViewAbstractApi<T> implements OnResponse<T> {
  T fromJson(Map<String, dynamic> json);

  void fromJ() {
    InstanceMirror instance_mirror = reflect(T);
    var type = instanceMirror.type;
    for (var v in type.declarations.values) {
      var name = MirrorSystem.getName(v.simpleName);

      if (v is VariableMirror) {
        print(
            "Variable: $name => S: ${v.isStatic}, P: ${v.isPrivate}, F: ${v.isFinal}, C: ${v.isConst}");
      } else if (v is MethodMirror) {
        print(
            "Method: $name => S: ${v.isStatic}, P: ${v.isPrivate}, A: ${v.isAbstract}");
      }
    }
  }

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
  void onServerFailureResponse(
      ServerResponse sr, ServerActions serverActions) {}
  int iD = -1;

  Future<T> view(int iD) async {
    var response = await getHttp().post(Uri.parse(URLS.BASE_URL),
        headers: URLS.requestHeaders, body: getBody("view"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return fromJson(convert.jsonDecode(response.body));
    } else if (response.statusCode == 401) {
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

@JsonSerializable()
class ServerResponseMaster {
  ServerResponse? serverResponse;
  ServerResponseMaster();

  factory ServerResponseMaster.fromJson(Map<String, dynamic> data) =>
      _$ServerResponseMasterFromJson(data);

  Map<String, dynamic> toJson() => _$ServerResponseMasterToJson(this);
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

@JsonSerializable()
class ServerResponse {
  int? activated;
  bool? permission;
  bool? login;
  bool? error;
  String? message;
  int? code;
  factory ServerResponse.fromJson(Map<String, dynamic> data) =>
      _$ServerResponseFromJson(data);

  Map<String, dynamic> toJson() => _$ServerResponseToJson(this);
  ServerResponse();
  bool isAccountActivated() {
    return activated == 1;
  }

  bool? isAccountLoggedIn() {
    return login;
  }

  bool? isAccountHasPermission() {
    return permission;
  }
}

class URLS {
  static const String BASE_URL = 'http://saffoury.com/SaffouryPaper2/index.php';

  static const Map<String, String> requestHeaders = {
    'Accept': 'application/json',
    'Authorization': '<Your token>',
    'Accept-Encoding': 'gzip',
  };
}
