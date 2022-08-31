import 'dart:convert';

import 'package:flutter_app2/models/book_model.dart';
import 'package:flutter_app2/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<bool> login({required String username, required String password}) async {
    try {
      final _prefs = await SharedPreferences.getInstance();

      final _url = Uri.parse('http://poseintelligence.dyndns.biz:8888/cssd_v3_api/api/authen/');

      Map<String, dynamic> _body = {
        "type": "login",
        "data": {
          "username": "$username",
          "password": "$password",
        }
      };

      print(jsonEncode(_body));

      var response = await http.post(
        _url,
        body: jsonEncode(_body),
      );

      if (response.statusCode == 401) {
        throw AuthenticationException();
      }

      if (response.statusCode == 200) {
        final _jsonResponse = json.decode(response.body);

        var user = UserModel.fromJson(_jsonResponse);
        //
        // print(user.toJson());
        //
        await _prefs.setBool("isLogin", true);
        await _prefs.setString("token", user.token ?? "");
        await _prefs.setString("fName", user.data!.firstName ?? "");
        await _prefs.setString("lName", user.data!.lastName ?? "");
        await _prefs.setString("depName", user.data!.depName ?? "");

        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

class AuthenticationException implements Exception {
  final String message;

  AuthenticationException({this.message = 'Unknown error occurred. '});
}
