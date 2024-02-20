import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:compost_app_2024/views/auth/register_screen.dart';
import 'package:compost_app_2024/views/user_views/user_home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  bool isFinalState = false;
  // ProgressDialog progressDialog;
  TextEditingController emailController = TextEditingController();
  TextEditingController taxNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // SharedPreferences.getInstance().then((prefs) {
    //   bool isOpenedOnBoard = prefs.getBool("onboard");
    //   if (isOpenedOnBoard == null) {
    //     Nav.routeReplacement(context, OnboardingPage());
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    // progressDialog = new ProgressDialog(context, ProgressDialogType.Normal);
    // progressDialog.setMessage('Giriş yapılıyor...');

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  welcomeMethod(),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              textFormFieldToInsertTC(),
                              textFormFieldToInsertPassword()
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        loginButton(),
                        const SizedBox(
                          height: 15,
                        ),
                        registerButton(),
                        // SizedBox(
                        //   height: 70,
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        positionedWidget(24, 84, null, null, "assets/images/2.png", 72, 72),
        positionedWidget(null, -12, -24, null, "assets/images/1.png", 144, 144),
        positionedWidget(-24, null, null, -48, "assets/images/2.png", 130, 130),
        positionedWidget(null, null, -72, 32, "assets/images/1.png", 130, 130),
      ],
    );
  }

  loginButton() {
    return GestureDetector(
      onTap: () async {
        Get.to(() => const UserHomePage());
        // if (!validate(emailController.text, passwordController.text,
        //     taxNoController.text)) {
        //   Get.snackbar(
        //       "Kullanıcı Girişi", "Giriş bilgilerinizi kontrol ediniz.",
        //       backgroundColor: Colors.redAccent,
        //       icon: Icon(
        //         Icons.warning_amber_sharp,
        //         color: whiteColor,
        //       ),
        //       colorText: whiteOpacity(0.8),
        //       margin: EdgeInsets.all(32));
        // } else {
        //   progressDialog.show();
        //   var login = await AuthService.login(emailController.text.trim(),
        //       passwordController.text, taxNoController.text);
        //   progressDialog.hide();
        //   if (login.status &&
        //       login.data.customerType == 0 &&
        //       login.data.role == 6) {
        //     Nav.offAllWithoutContext(HomeNavigator(), "HomeNavigator");
        //   } else if (login.status && login.data.customerType == 1) {
        //     Nav.offAllWithoutContext(
        //         ChooseAccounts(
        //           taxNo: taxNoController.text.trim(),
        //           username: emailController.text.trim(),
        //           password: passwordController.text.trim(),
        //         ),
        //         "ChooseAccounts");
        //   } else if (login.status &&
        //       login.data.customerType == 0 &&
        //       login.data.role != 6) {
        //     Nav.offAllWithoutContext(
        //         BottomNavigatorTab(), "BottomNavigatorTab");
        //   } else {
        //     Get.snackbar("Kullanıcı girişi", login.message,
        //         icon: Icon(
        //           Icons.warning,
        //           // color: whiteOpacity(0.8),
        //         ),
        //         // colorText: whiteOpacity(0.8),
        //         margin: EdgeInsets.all(24),
        //         backgroundColor: Colors.red);
        //   }
        // }
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              const Color(0xFF5A76B5),
              const Color(0xFF5A76B5).withOpacity(0.8),
            ])),
        child: const Center(
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  registerButton() {
    return GestureDetector(
      onTap: () => Get.to(() => const RegisterScreen()),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              const Color(0xFF5A76B5),
              const Color(0xFF5A76B5).withOpacity(0.8),
            ])),
        child: const Center(
          child: Text(
            "Register Page",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Container textFormFieldToInsertPassword() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: true,
        keyboardType: TextInputType.number,
        controller: passwordController,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Password",
            hintStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }

  Container textFormFieldToInsertTC() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[100]!))),
      child: TextField(
        controller: emailController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "TC-ID",
            hintStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }

  Container welcomeMethod() {
    return Container(
      padding: const EdgeInsets.all(48),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Welcome!",
            style: TextStyle(
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }

  bool validate(String email, String password, String taxNo) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (email.isEmpty || password.isEmpty) {
      return false;
    } else if (!emailValid || password.length < 6) {
      return false;
    } else if (taxNo == "" || taxNo.length < 5) {
      return false;
    } else {
      return true;
    }
  }

  Positioned positionedWidget(double? left, double? top, double? right,
      double? bottom, String imageUrl, double? width, double? height) {
    return Positioned(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        child: Image.asset(
          imageUrl,
          width: width,
          height: height,
        ));
  }
}
