import 'dart:async';

import 'package:vsii_trader/repository/orders/order_entity.dart';

class WebClient {
  final Duration delay;

  const WebClient([this.delay = const Duration(milliseconds: 3000)]);

  Future<List<OrderEntity>> fetchOrders() async {
    return Future.delayed(
        delay,
        () => [
              OrderEntity(
                '1',
                'Apple',
                'VSII',
                'Iphone Order 1',
                100,
                2000.00,
                'New Request',
                '16/01/2018',
              ),
            ]);
  }

  Future<bool> postOrders(List<OrderEntity> orders) async {
    return Future.value(true);
  }
}
