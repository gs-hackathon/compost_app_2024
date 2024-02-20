import 'dart:convert';

import 'package:compost_app_2024/utils/base_url.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static Future<void> register(String firstName, String lastName, String email,
      String password, String repeatPassword) async {
    try {
      const url = "${baseUrl}auth/register";
      http.Response response;
      response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "first_name": firstName,
            "last_name": lastName,
            "email": email,
            "password": password,
            "repeat_password": repeatPassword
          }));
      final responseData = jsonDecode(response.body);
      // final userRegister = RegisterResponse.fromJson(responseData);
      // SharedPreferences sp = await SharedPreferences.getInstance();
      // await sp.setString("first_name", userRegister.data.firstName);
      // await sp.setString("last_name", userRegister.data.lastName);
      // return userRegister;
    } catch (e) {
      // return RegisterResponse(status: false, message: e);
    }
  }

  static Future<void> login(String userId, String password) async {
    try {
      const url = "${baseUrl}auth/register";
      http.Response response;
      response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "userId": userId,
            "password": password,
          }));
      final responseData = jsonDecode(response.body);
      // final userRegister = RegisterResponse.fromJson(responseData);
      // SharedPreferences sp = await SharedPreferences.getInstance();
      // await sp.setString("first_name", userRegister.data.firstName);
      // await sp.setString("last_name", userRegister.data.lastName);
      // return userRegister;
    } catch (e) {
      // return RegisterResponse(status: false, message: e);
    }
  }
}
