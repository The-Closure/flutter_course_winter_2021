import 'dart:convert';

import 'package:flutter_course_winter_2021/models/auth_model.dart';
import 'package:flutter_course_winter_2021/models/token_model.dart';
import 'package:flutter_course_winter_2021/services/config_consts.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<TokenModel?> signIn(AuthModel auth) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Uri path = Uri.parse('$base_url/api/authenticate');

    http.Response response =
        await http.post(path, body: jsonEncode(auth), headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      TokenModel token = TokenModel.fromJson(data);
      return token;
    } else
      return null;
  }
}
