import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:compost_app_2024/utils/color.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        title: const Text('My Profile', style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 18,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  "assets/images/person_icon.png",
                  fit: BoxFit.fill,
                  height: 120,
                )),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Username",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                  SizedBox(
                    width: Get.width / 20,
                  ),
                  const Text("Furkan",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const Divider(
              height: 0,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Adress",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                  SizedBox(
                    width: Get.width / 20,
                  ),
                  Text(
                      "${"Orhan Gazi Avenue. 1672. Street no: 42/44".substring(0, 20)}...",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const Divider(
              height: 0,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Password",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                  SizedBox(
                    width: Get.width / 20,
                  ),
                  const Text("********",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const Divider(
              height: 0,
            ),
            SizedBox(
              height: Get.height / 18,
            ),
            ElevatedButton(
                onPressed: () {
                  // Get.snackbar(
                  //     "İlan oluşturma", "İlanınız Başarıyla oluşturulmuştur.");
                  // Get.to(() => const UserHomePage());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    padding: const EdgeInsets.all(16),
                    fixedSize: Size(Get.width / 1.1, 50)),
                child: const Text("Update Profile",
                    style: TextStyle(fontSize: 16))),
          ],
        ),
      ),
    );
  }
}
