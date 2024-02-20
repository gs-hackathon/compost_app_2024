// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:compost_app_2024/views/auth/login_screen.dart';
import 'package:compost_app_2024/views/user_views/user_home_page.dart';

//flutter build apk --target-platform android-arm,android-arm64,android-x64 --split-per-abi

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: buildNavigator(),
    );
  }
}

Widget buildNavigator() {
  var tokenData = /* Prefs.getString("access_token") ??  */ "";
  if (tokenData != "") {
    return const UserHomePage();
  } else {
    return const LoginScreen();
  }
}
