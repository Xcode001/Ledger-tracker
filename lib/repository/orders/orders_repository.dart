import 'dart:async';
import 'dart:core';

import 'package:vsii_trader/repository/orders/order_entity.dart';
import 'package:vsii_trader/models/order.dart';

abstract class OrdersRepository {
  Future<List<OrderEntity>> loadOrders();

  Future saveOrders(List<OrderEntity> orders);

  Future saveOrder(Order order);
}
