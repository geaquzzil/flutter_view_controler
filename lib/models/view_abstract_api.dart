import 'dart:collection';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

abstract class ViewAbstractApi<T> {
  T fromJson(Map<String, dynamic> json);
  String getTableNameApi();
  Map<String, String> getDefaultBody() => {};
  Map<String, String> getBody(String action) {
    Map<String, String> mainBody = HashMap<String, String>();
    mainBody.addAll(getDefaultBody());

    return {
      "action": action,
      "table": getTableNameApi(),
    };
  }

  int iD = -1;

  Future<T> view(int iD) async {
    final response = await http.post(Uri.parse(URLS.BASE_URL),
        headers: URLS.requestHeaders, body: getBody("view"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return fromJson(convert.jsonDecode(response.body));
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
    final response = await http.post(Uri.parse(URLS.BASE_URL),
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
}

class URLS {
  static const String BASE_URL =
      'https://www.saffoury.com/SaffouryPaper2/index.php';

  static const Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': '<Your token>',
    'Accept-Encoding': 'gzip'
  };
}
