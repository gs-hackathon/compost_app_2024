import 'package:compost_app_2024/utils/request_helper.dart';

class ChallangeService {
  static Future<void> getChallange(String challangeId) async {
    try {
      var request = RequestHelper();
      final response = await request.get(
        request.url("challenges/$challangeId"),
      );
      // return Orders.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("error catch OrderService > getAllOrders$e");
      return;
    }
  }

  static Future<void> getAllChallanges() async {
    try {
      var request = RequestHelper();
      final response = await request.get(
        request.url("challenges"),
      );
      // return Orders.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("error catch OrderService > getAllOrders$e");
      return;
    }
  }

  static Future<void> insertChallange(
      String id,
      String name,
      String description,
      String shortDescription,
      String image,
      String reward,
      String duration,
      String durationType) async {
    try {
      var request = RequestHelper();
      final response = await request.post(
        request.url("challenges/$id"),
        body: {
          "id": id,
          "name": name,
          "description": description,
          "short_description": shortDescription,
          "image": image,
          "reward": reward,
          "duration": duration,
          "duration_type": durationType
        },
      );
      // return Orders.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("error catch OrderService > getAllOrders$e");
      return;
    }
  }

  static Future<void> getAssignedChallange(String assignedChallangeId) async {
    try {
      var request = RequestHelper();
      final response = await request.get(
        request.url("challenges/assign/$assignedChallangeId"),
      );
      // return Orders.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("error catch OrderService > getAllOrders$e");
      return;
    }
  }

  static Future<void> assignChallange(String id) async {
    try {
      var request = RequestHelper();
      final response = await request.get(
        request.url("challenges/assign/$id"),
      );
      // return Orders.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("error catch OrderService > getAllOrders$e");
      return;
    }
  }

  static Future<void> unAssignChallange(String id) async {
    try {
      var request = RequestHelper();
      final response = await request.get(
        request.url("challenges/unassign/$id"),
      );
      // return Orders.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("error catch OrderService > getAllOrders$e");
      return;
    }
  }
}
