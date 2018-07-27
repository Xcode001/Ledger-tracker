import 'dart:async';
import 'dart:core';

import 'package:vsii_trader/repository/orders/order_entity.dart';

abstract class ReactiveOrdersRepository {
  Future<void> addNewOrder(OrderEntity order);

  Stream<List<OrderEntity>> orders();

  Future<void> updateOrder(OrderEntity order);
}
