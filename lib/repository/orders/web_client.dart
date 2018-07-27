import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vsii_trader/repository/orders/order_entity.dart';
import 'package:vsii_trader/common/router.dart';

class WebClient {
  const WebClient();

  Future<List<OrderEntity>> fetchOrders() async {
    final response = await http.get(Router.ORDER_ENDPOINT);
    List<OrderEntity> rs = new List<OrderEntity>();
    if (response.statusCode == 200) {
      for (Object aa in json.decode(response.body)) {
        rs.add(OrderEntity.fromJson(aa));
      }
      // If server returns an OK response, parse the JSON
      return rs;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load order');
    }
  }

  Future<bool> postOrders(List<OrderEntity> orders) async {
    return Future.value(true);
  }

  Future<bool> postOrder(OrderEntity order) async {
    final Response =
        await http.post(Router.ORDER_ENDPOINT, body: order.toJson());
    if (Response.statusCode == 200) {
      return Future.value(true);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to save order');
    }
  }
}
