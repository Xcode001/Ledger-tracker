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
                'Iphone Order 1',
                100,
                2000.00,
                'New Request',
                '16/01/2018',
              ),
              OrderEntity(
                '2',
                'VSII',
                'Blockchain software',
                1,
                99000.00,
                'Delivering',
                '15/01/2018',
              ),
              OrderEntity(
                '3',
                'Google',
                'Pixel 5 XL',
                35,
                4528.00,
                'Closed',
                '14/01/2018',
              ),
              OrderEntity(
                '4',
                'TP Bank',
                'Bank transfer',
                1,
                95456.00,
                'Invoicing',
                '13/01/2018',
              ),
              OrderEntity(
                '5',
                'Microsoft',
                'Office volume license',
                452,
                8456.00,
                'Closed',
                '12/01/2018',
              ),
            ]);
  }

  Future<bool> postOrders(List<OrderEntity> orders) async {
    return Future.value(true);
  }
}
