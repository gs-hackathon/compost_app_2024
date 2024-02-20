import 'dart:convert';
import 'package:compost_app_2024/models/orders_model.dart';
import 'package:compost_app_2024/utils/request_helper.dart';

class OrderService {
  static Future<Orders> getAllOrders() async {
    try {
      var request = RequestHelper();
      final response = await request.get(
        request.url("order"),
      );
      return Orders.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("error catch OrderService > getAllOrders$e");
      return Orders(data: []);
    }
  }

  static Future<void> insertOrder(
    String image,
    List<int?> items,
    String address,
    String pickUpDate,
  ) async {
    try {
      var request = RequestHelper();
      final response = await request.post(
        request.url("order?status=new"),
        body: {
          "n_id": "434549894545",
          "image": image,
          "items": items,
          "address": address,
          "pick_up_date": pickUpDate
        },
      );
      //return Orders.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("error catch OrderService > getAllOrders$e");
      return;
    }
  }

  static Future<void> closeOrder(
    int orderId,
  ) async {
    try {
      var request = RequestHelper();
      final response = await request.post(
        request.url("order?status=closed"),
        body: {
          "id": orderId.toString(),
        },
      );
      // return Orders.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("error catch OrderService > getAllOrders$e");
      // return null;
    }
  }
}
