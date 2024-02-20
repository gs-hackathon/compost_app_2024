import 'dart:convert';
import 'package:compost_app_2024/models/users_model.dart';
import 'package:compost_app_2024/utils/request_helper.dart';

class UserService {
  static Future<Users> getAllUsers() async {
    try {
      var request = RequestHelper();
      final response = await request.get(
        request.url("user"),
      );
      return Users.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("error catch UserService > getAllUsers$e");
      return Users(data: []);
    }
  }

  static Future<void> getUserById(String userId) async {
    try {
      var request = RequestHelper();
      final response = await request.get(
        request.url("user/$userId"),
      );
      // return Users.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("error catch UserService > getAllUsers$e");
      // return null;
    }
  }
}
