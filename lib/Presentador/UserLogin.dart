import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:proyecto/Model/User.dart';

class UserLogin {
  
  Future<dynamic> getJson(String uri) async {
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  /*Future<String> fetchUser() async {
    return getJson("http://192.168.5.168:8000/Empresa/public/json")
        .then(((data) => data.toString()));
  }*/

  Future<String> autenticando(String user, String password) async {
    return getJson("http://192.168.43.123:8000/Empresa/public/loguear?" +
            "email=" +
            user +
            "&" +
            "password=" +
            password)
        .then(((data) => data["data"].toString()));
  }
}
