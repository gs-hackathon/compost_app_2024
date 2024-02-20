import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChallangePage extends StatefulWidget {
  final String? imageUrl;
  final String? taskName;
  final String? taskDescription;
  final String? taskStar;
  final String? taskDay;
  final List<String?>? taskRules;
  const ChallangePage(
      {Key? key,
      this.imageUrl,
      this.taskName,
      this.taskDescription,
      this.taskStar,
      this.taskDay,
      this.taskRules})
      : super(key: key);

  @override
  State<ChallangePage> createState() => _ChallangePageState();
}

class _ChallangePageState extends State<ChallangePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(widget.imageUrl!,
                width: Get.width, height: Get.height / 3.5, fit: BoxFit.cover),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.taskName!,
                          style: TextStyle(color: Colors.tealAccent[700])),
                      Text(widget.taskDescription!)
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("Reward"),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.stars,
                                color: Colors.yellow, size: 18),
                            const SizedBox(width: 5),
                            Column(children: [
                              Text(
                                widget.taskStar!,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 2)
                            ]),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 0,
            ),
            Container(
                padding:
                    const EdgeInsets.only(left: 24.0, right: 24.0, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Campaign Rules",
                        style: TextStyle(color: Colors.tealAccent[700])),
                    const SizedBox(height: 15),
                    Text(widget.taskRules![0]!),
                    const SizedBox(height: 10),
                    Text(widget.taskRules![1]!),
                    const SizedBox(height: 10),
                    Text(widget.taskRules![2]!),
                    const SizedBox(height: 10),
                    Text(widget.taskRules![3]!)
                  ],
                )),
            const SizedBox(height: 30),
            Container(
                width: Get.width,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.tealAccent[700],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                    onPressed: () {
                      print("bastıı");
                      // Get.to(() => InsertAdvertDetails(selectedItems: _filters));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent[700],
                    ),
                    child: const Text("Apply Now",
                        style: TextStyle(color: Colors.white, fontSize: 16))))
          ],
        ),
      ),
    );
  }

  PreferredSize appBarMethod() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.tealAccent[700],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Get.back(),
          ),
          title: Text(widget.taskName!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white))),
    );
  }
}
