import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:compost_app_2024/utils/color.dart';
import 'package:compost_app_2024/views/user_views/shopping/item_detail.dart';

import '../../../widgets/scroll_navigation/navigation_helpers.dart';
import '../../../widgets/scroll_navigation/title_scroll_navigation.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  List<Product> products = [
    Product(
        "Picnic Table",
        "https://img.vivense.com/1920x1280/images/5aa5cac4d2ce4e2c8b4f9f0728de19ad.jpg",
        2000,
        "You can earn a picnic table with your valuable waste.",
        1,
        true),
    Product(
        "Sapling",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrqPoIhECBLoBTCCPDx2g9tzDTtpIohG7WWUPEkGRQUVlE0NKuS7Am-gJ7XcH513g4KaY&usqp=CAU",
        70,
        "You can be a hope for the future by planting a sapling. Image is an example, may vary. 5 saplings.",
        1,
        false),
    Product(
        "Covid-19 Mask",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEgCcvOsIFqgRlw63EooI0FQzTIa8zw_8Qp7TckM5eIP0_dbT3ZJ3zoj6E_4iaRjaDY0c&usqp=CAU",
        200,
        "200 pieces of surgical mask.",
        1,
        false),
    Product(
        "Garden Flower",
        "https://www.bahcecicekavcilar.com/bca/ambar/urunler/B_ufot_5191b07cb061711bb560e1b57a2c8d88.jpg",
        100,
        "100 Seeds Image is an example, may vary.",
        1,
        true),
    Product(
        "Laundry Bleach",
        "https://cdn03.ciceksepeti.com/cicek/kc7820192-1/XL/domestos-camasir-suyu-dag-esintisi-750-ml.-kc7820192-1-f1580b874af24191a433674e44dd5997.jpg",
        100,
        "Laundry Bleach 5000 ml. Image is an example, may vary.",
        1,
        false),
    Product(
        "Floor Cleaner",
        "https://images.migrosone.com/sanalmarket/product/30711898/30711898-2b7bdf-1650x1650.jpg",
        100,
        "Floor Cleaner 1000 ml. Image is an example, may vary.",
        1,
        false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                "https://static.vecteezy.com/system/resources/previews/024/555/719/non_2x/coins-stack-illustration-coins-icon-flat-free-png.png",
                width: 20),
            const SizedBox(width: 10),
            Text("Point: 0.0", style: TextStyle(color: mainColor)),
          ],
        )
      ],
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0,
        backgroundColor: mainColor,
        centerTitle: true,
        title: const Text('Shopping Page'),
      ),
      body: TitleScrollNavigation(
        barStyle: TitleNavigationBarStyle(
          spaceBetween: 100.0,
          background: Colors.grey[50]!,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: mainColor),
          // padding: const EdgeInsets.only(left: 65, right: 65, top: 15, bottom: 15),
          // spaceBetween: Get.width / 3,
        ),
        identiferStyle: NavigationIdentiferStyle(
          color: mainColor,
        ),
        titles: const ["Items", "Orders"],
        pages: [
          planScreen(products),
          planScreen(
              products.where((element) => element.isMyOrder == true).toList()),
        ],
      ),
    );
  }

  Widget planScreen(List<Product> products) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        // physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              Get.to(ItemDetailPage(product: products[i]));
            },
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Image.network(products[i].imageUrl,
                          fit: BoxFit.cover, height: Get.height / 8),
                      const SizedBox(height: 4),
                      Text(products[i].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  )),
                  Container(
                    height: 20,
                    color: Colors.amber,
                    alignment: Alignment.center,
                    child: Text("${products[i].points} Point",
                        style: const TextStyle(color: Colors.white)),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;
  final int points;
  final String description;
  final int amount;
  final bool isMyOrder;

  Product(this.name, this.imageUrl, this.points, this.description, this.amount,
      this.isMyOrder);
}
