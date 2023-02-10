import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
class NetworkRequester {
  Future getRequest(String url) async {
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        /*
       * jodi request ta sucess hoy tahole er body ta k amra return kore dibo
       * body ta request korle sob kiso niye ase
       * */
       // Logger().i(jsonDecode(response.body));
        return jsonDecode(response.body);
      }

      else {
        Logger().e('Request failed');
      }
    } catch (e) {
      Logger().e(e);
    }
  }
}