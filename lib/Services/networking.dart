import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future<dynamic> getData() async {
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      //print("Weather Data: $data");

      var decodeData = jsonDecode(data);
      return decodeData;
    } else {
      var error = response.statusCode;
      print("Error Code : $error");
    }
  }
}
