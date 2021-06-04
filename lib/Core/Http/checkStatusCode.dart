import 'package:http/http.dart' as http;

class CoreHttp {
  static http.Response checkStatusCode(http.Response response) {
    if (response.statusCode == 200) {
      return response;
    } else {
      throw 'status Code not 200';
    }
  }
}
