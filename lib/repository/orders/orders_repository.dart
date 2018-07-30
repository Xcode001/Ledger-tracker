import 'dart:async';
import 'dart:core';

import 'package:vsii_trader/repository/orders/order_entity.dart';
import 'package:vsii_trader/models/order.dart';
import 'package:vsii_trader/models/user.dart';

abstract class OrdersRepository {
  Future<List<OrderEntity>> loadOrders();

  Future saveOrders(List<OrderEntity> orders);

  Future saveOrder(Order order);

  Future sendInvoice(Order order, User user);

  Future receiveInvoice(Order order, User user);

  Future sendPayment(Order order, User user);

  Future receivePayment(Order order, User user);

  Future closeOrder(Order order, User user);
}
