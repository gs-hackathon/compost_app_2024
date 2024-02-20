import 'package:compost_app_2024/utils/request_helper.dart';

class CategoryService {
  static Future<void> getCategory(String categoryId) async {
    try {
      var request = RequestHelper();
      final response = await request.get(
        request.url("item/$categoryId"),
      );
      // return Orders.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("error catch OrderService > getAllOrders$e");
      return;
    }
  }

  static Future<void> getAllCategory() async {
    try {
      var request = RequestHelper();
      final response = await request.get(
        request.url("item"),
      );
      // return Orders.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("error catch OrderService > getAllOrders$e");
      return;
    }
  }

  static Future<void> insertCategory(String name, int value) async {
    try {
      var request = RequestHelper();
      final response = await request.post(
        request.url("item"),
        body: {
          "name": name,
          "value": value.toString(),
        },
      );
      // return Orders.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("error catch OrderService > getAllOrders$e");
      return;
    }
  }
}
