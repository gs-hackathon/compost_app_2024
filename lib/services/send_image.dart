// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:path/path.dart';
// import 'package:async/async.dart';
// import 'package:compost_app_2024/utils/base_url.dart';
// import 'package:compost_app_2024/utils/request_helper.dart';

// class UploadImageService {
//   static Future<void> uploadImage(String extention, String base64String) async {
//     print("extention $extention base64String $base64String");
//     try {
//       print("base64String: UploadImageService");

//       var request = RequestHelper();
//       final response = await request.post(
//         request.url("id"),
//         body: {
//         "mimetype": "image/$extention",
//         "encoded": base64String,
//         },
//       );

//       print("response.body: ${response.body}");
//       // final responseData = jsonDecode(response.body);
//       // final userRegister = RegisterResponse.fromJson(responseData);
//       // SharedPreferences sp = await SharedPreferences.getInstance();
//       // await sp.setString("first_name", userRegister.data.firstName);
//       // await sp.setString("last_name", userRegister.data.lastName);
//       // return userRegister;
//     } catch (e) {
//       print("error catch $e");
//       // return RegisterResponse(status: false, message: e);
//     }
//   }
// }
