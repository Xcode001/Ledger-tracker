import 'dart:async';
import 'dart:core';

import 'package:vsii_trader/repository/orders/order_entity.dart';

abstract class OrdersRepository {
  Future<List<OrderEntity>> loadOrders();

  Future saveOrders(List<OrderEntity> orders);
}
