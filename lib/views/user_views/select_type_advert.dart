
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/item.dart';
import '../../utils/color.dart';
import 'insert_detail_advert.dart';

class SelectTypeAdvert extends StatefulWidget {
  const SelectTypeAdvert({Key? key}) : super(key: key);

  @override
  State<SelectTypeAdvert> createState() => _SelectTypeAdvertState();
}

class _SelectTypeAdvertState extends State<SelectTypeAdvert> {
  final List<Item> _companies = [
    Item(
        itemNumber: 1,
        name: 'Kağıt',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/1074/1074055.png',
        star: 3.0),
    Item(
        itemNumber: 2,
        name: 'Not Kitapları',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHtLqURUXcIUw0JN8yoG9JcSY-yuARcF04YA&usqp=CAU',
        star: 2.0),
    Item(
        itemNumber: 3,
        name: 'Karton',
        imageUrl:
            'https://st2.depositphotos.com/3907761/7996/v/950/depositphotos_79967044-stock-illustration-box-icon.jpg',
        star: 4.0),
    Item(
        itemNumber: 4,
        name: 'Demir',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkZBUzaox-fWeSFxh8D5Zcbp2uq0T9tdjgMA&usqp=CAU',
        star: 4.5),
    Item(
        itemNumber: 5,
        name: 'Teneke',
        imageUrl:
            'https://media.istockphoto.com/vectors/tin-can-waste-vector-id866163458?s=612x612',
        star: 3.5),
    Item(
        itemNumber: 6,
        name: 'Aluminyum',
        imageUrl:
            'https://alsanaluminyum.com/wp-content/uploads/2020/02/ikon-3-aluminyum-profil.png',
        star: 2.5),
    Item(
        itemNumber: 7,
        name: 'Plastik şişe',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzKbXkgmaASH5GUOPtzMKSKF3ja-gZFk3vlg&usqp=CAU',
        star: 2.0),
    Item(
        itemNumber: 8,
        name: 'Süt Kapakları',
        imageUrl:
            'https://media.istockphoto.com/vectors/pack-of-milk-isolated-in-doodle-style-illustration-of-a-black-line-vector-id1254945363',
        star: 4.0),
    Item(
        itemNumber: 9,
        name: 'Karıştılımış plastik',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/2666/2666681.png',
        star: 3.5),
  ];

  final List<Item> _filters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            recycleTextMethod(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 0.0,
                runSpacing: 0.0,
                children: companyPosition.toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            continueButtonMethod(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Container continueButtonMethod() {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
          onPressed: () {
            print("bastıı");
            Get.to(() => InsertAdvertDetails(selectedItems: _filters));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_forward_rounded,
                color: mainColor,
              ),
              const Text("Devam",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              const Icon(Icons.arrow_forward_rounded, color: Colors.white)
            ],
          )
          // style: ElevatedButton.styleFrom(
          //     primary: Colors.blue,
          //     padding: EdgeInsets.all(16),
          //     fixedSize: Size(Get.width / 1.1, 50))

          ),
    );
  }

  Container recycleTextMethod() {
    return Container(
        width: Get.width,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: const Text("Ne gibi ürünleri geri dönüştürmek istiyorsunuz?",
            textAlign: TextAlign.center));
  }

  AppBar appBarMethod() {
    return AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text("${_filters.length} tip ürün seçildi",
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black)));
  }

  Iterable<Widget> get companyPosition sync* {
    for (Item company in _companies) {
      yield GestureDetector(
        onTap: () {
          if (_filters.contains(company)) {
            _filters.remove(company);
          } else {
            _filters.add(company);
          }
          setState(() {});
        },
        child: Card(
          elevation: 5,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: _filters.contains(company)
                    ? Border.all(color: Colors.blue, width: 0)
                    : null,
                color: Colors.white,
                // boxShadow: const [
                //   BoxShadow(
                //     // color: Colors.black,
                //     blurRadius: 1,
                //     spreadRadius: 1,
                //     offset: Offset(0.5, 0.5), // shadow direction: bottom right
                //   )
                // ],
              ),
              // margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              width: Get.width / 3.5,
              height: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    company.name!,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  // SizedBox(height: 10),
                  Image.network(company.imageUrl!,
                      fit: BoxFit.fill, height: 40, width: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.star_border_outlined,
                          color: Colors.yellow,
                        ),
                        Text(
                          "${company.star}/kg",
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      );
    }
  }
}
