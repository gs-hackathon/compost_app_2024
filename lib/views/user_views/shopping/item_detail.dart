import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:compost_app_2024/utils/color.dart';

import 'items.dart';

class ItemDetailPage extends StatefulWidget {
  final Product? product;

  const ItemDetailPage({
    Key? key,
    this.product,
  }) : super(key: key);

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottomOpacity: 0,
          backgroundColor: mainColor,
          centerTitle: true,
          title: const Text('Ürün Detayı'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(widget.product!.imageUrl, height: Get.height / 3),
              Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.product!.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text("${widget.product!.points} Puan",
                            style: TextStyle(
                                fontSize: 20, color: Colors.yellow[800])),
                        const SizedBox(height: 10),
                        const Text("Ürün Açıklaması",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Text(widget.product!.description),
                        const SizedBox(height: 10),
                        const Text("Adet",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {},
                            ),
                            const Text("1"),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        Container(
                          width: Get.width,
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(top: 16, bottom: 16),
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextButton(
                              onPressed: () {
                                print("bastıı");
                                Get.snackbar("İlan oluşturma",
                                    "İlanınız Başarıyla oluşturulmuştur.");
                              },
                              child: const Text("Sipariş Ver",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16))),
                        )
                      ]))
            ],
          ),
        ));
  }
}
