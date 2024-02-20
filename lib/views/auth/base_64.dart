// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:compost_app_2024/services/send_image.dart';
// import 'package:compost_app_2024/views/auth/login_2.dart';

// class TakePictureScreen extends StatefulWidget {
//   const TakePictureScreen({Key key}) : super(key: key);

//   @override
//   State<TakePictureScreen> createState() => _TakePictureScreenState();
// }

// class _TakePictureScreenState extends State<TakePictureScreen> {
//   bool isImageLoading;
//   File _pickedImage;
//   bool isImagePicked = false;
//   var response;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         title: Container(
//             alignment: Alignment.center,
//             child: const Text('Kimlik İle Kayıt',
//                 style: TextStyle(color: Colors.black))),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                   padding: EdgeInsets.all(20),
//                   child: Text("Kimlik Fotoğrafınızı Çekerek Kayıt Yapınız",
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                       textAlign: TextAlign.center)),
//               isImageLoading != null
//                   ? isImageLoading
//                       ? const CircularProgressIndicator()
//                       : Column(
//                           children: [
//                             SizedBox(
//                               width: 200,
//                               height: 200,
//                               child: Image.file(
//                                 File(_pickedImage.path),
//                               ),
//                             )
//                           ],
//                         )
//                   : Container(
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(8.0),
//                           child: Image.network(
//                             "https://cdn-icons-png.flaticon.com/512/55/55999.png",
//                             fit: BoxFit.fill,
//                             height: 180,
//                           )),
//                     ),
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 child: ElevatedButton(
//                     onPressed: () async => {
//                           if (isImagePicked)
//                             {Get.to(() => LoginPage2())}
//                           else
//                             {pickImage()}
//                         },
//                     child: isImagePicked ? Text("Devam") : Text("Fotoğraf Çek"),
//                     style: ElevatedButton.styleFrom(
//                         primary: Colors.blue[800],
//                         padding: EdgeInsets.all(16),
//                         fixedSize: Size(Get.width / 1.1, 50))),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> pickImage() async {
//     try {
//       setState(() {
//         isImageLoading = true;
//       });
//       XFile pickedFile =
//           await ImagePicker().pickImage(source: ImageSource.camera);

//       if (pickedFile != null) {
//         setState(() {
//           _pickedImage = File(pickedFile.path);
//           isImageLoading = false;
//           isImagePicked = true;
//         });
//         print("picked image" + pickedFile.path);
//       } else {
//         print("picked image null");
//       }
//     } on PlatformException catch (e) {
//       print("user denied image access: $e");
//       setState(() {
//         isImageLoading = false;
//       });
//     }
//   }
// }
