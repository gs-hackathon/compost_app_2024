import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:compost_app_2024/models/users_model.dart';

class Person {
  final String name;
  final String image;
  final String title;
  final double points;

  Person(this.name, this.image, this.title, this.points);
}

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  List<Data> users = [];

  @override
  initState() {
    super.initState();
    // getAllUsersFunction();
  }

  // Future<void> getAllUsersFunction() async {
  //   Users response = await UserService.getAllUsers();
  //   setState(() {
  //     if (response.data.isNotEmpty) {
  //       users = response.data;
  //     } else {
  //       users = [];
  //     }
  //   });
  // }

  List<Person> people = [
    Person(
        "Ahmet",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFEMBwOoxcZrk5BBJZDitVllcOHS-FcAo34WHGyEU5Op4NwDidxNfc3_w5wRYty05piUc&usqp=CAU",
        "Geri dönüştürücü",
        860.0),
    Person(
        "Seda",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDjuTJpjtTRfJ-MPxh2qxiPXYZAQkH_GwmjO3AqQXiI1zQnN3kqJ9JjVSU3eBr-2IFumw&usqp=CAU",
        "Geri dönüştürücü",
        468.0),
    Person(
        "Özgür",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlN0CN_hs_6cjq51_DhDgPSI1K9eWzka6r1Q&usqp=CAU",
        "Geri dönüştürücü",
        200.0),
    Person(
        "Serdar",
        "https://www.basogullariotomotiv.com/wp-content/uploads/2020/11/5fb6b497-d3ca-4451-a86e-fb55b36816b1.jpg",
        "Geri dönüştürücü",
        160.0)
  ];
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
        title:
            const Text('Lider Tablosu', style: TextStyle(color: Colors.black)),
      ),
      body: people != null
          ? people.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height / 36,
                      ),
                      SizedBox(
                        height: Get.height,
                        child: ListView.separated(
                          itemCount: people.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 5, right: 20, bottom: 5),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          if (index < 3) ...[
                                            Image.asset(
                                              "assets/images/${index == 0 ? "gold-cup" : index == 1 ? "silver-cup" : "bronze-cup"}.png",
                                              width: 20,
                                            ),
                                          ],
                                          if (index >= 3) ...[
                                            Container(
                                                alignment: Alignment.center,
                                                width: 20,
                                                child: Text(
                                                  "${index + 1}",
                                                  style: TextStyle(
                                                    fontSize: Get.height / 40,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  textAlign: TextAlign.end,
                                                ))
                                          ],
                                          const SizedBox(width: 15),
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                people[index].image,
                                                fit: BoxFit.fill,
                                                height: 50,
                                              )),
                                          SizedBox(width: Get.width / 40),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(people[index].name,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(people[index].title,
                                                  style: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(people[index].points.toString(),
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                          const Text("Puan",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300))
                                        ],
                                      )
                                    ]));
                          },
                          separatorBuilder: (_, __) => const Divider(),
                        ),
                      )
                    ],
                  ),
                )
              : Container(child: const Text("there is not user data"))
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
