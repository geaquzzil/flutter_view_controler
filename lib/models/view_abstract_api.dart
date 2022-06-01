import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

abstract class ViewAbstractApi<T> {
  T fromJson(Map<String, dynamic> json);

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': '<Your token>',
    'Accept-Encoding': 'gzip'
  };
  int iD = -1;
  Future<T> view(int iD) async {
    final response =
        await http.get(Uri.parse(URLS.BASE_URL), headers: requestHeaders);

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

  Future<T> list(int count, int page) async {
    throw Exception('TODO');
  }


}

class URLS {
  static const String BASE_URL =
      'https://www.saffoury.com/SaffouryPaper2/index.php';
}
