import 'package:vsii_trader/models/models.dart';

class LoadOrdersAction {}

class OrdersNotLoadedAction {}

class OrdersLoadedAction {
  final List<Order> orders;

  OrdersLoadedAction(this.orders);

  @override
  String toString() {
    return 'OrdersLoadedAction{orders: $orders}';
  }
}

class UpdateOrderAction {
  final String id;
  final Order updatedOrder;

  UpdateOrderAction(this.id, this.updatedOrder);

  @override
  String toString() {
    return 'UpdateOrderAction{id: $id, updatedOrder: $updatedOrder}';
  }
}

class AddOrderAction {
  final Order order;

  AddOrderAction(this.order);

  @override
  String toString() {
    return 'AddOrderAction{order: $order}';
  }
}

class SendInvoiceAction {
  final Order order;
  final User user;
  final int amount;

  SendInvoiceAction(this.order, this.user, this.amount);

  @override
  String toString() {
    return 'SendInvoiceAction{order: $order, user: $user, amount: $amount}';
  }
}

class ReceiveInvoiceAction {
  final Order order;
  final User user;

  ReceiveInvoiceAction(this.order, this.user);

  @override
  String toString() {
    return 'ReceiveInvoiceAction{order: $order, user: $user}';
  }
}

class SendPaymentAction {
  final Order order;
  final User user;

  SendPaymentAction(this.order, this.user);

  @override
  String toString() {
    return 'SendPaymentAction{order: $order, user: $user}';
  }
}

class ReceivePaymentAction {
  final Order order;
  final User user;

  ReceivePaymentAction(this.order, this.user);

  @override
  String toString() {
    return 'SendPaymentAction{order: $order, user: $user}';
  }
}

class CloseOrderAction {
  final Order order;
  final User user;

  CloseOrderAction(this.order, this.user);

  @override
  String toString() {
    return 'CloseOrderAction{order: $order, user: $user}';
  }
}

class UpdateFilterAction {
  final VisibilityFilter newFilter;

  UpdateFilterAction(this.newFilter);

  @override
  String toString() {
    return 'UpdateFilterAction{newFilter: $newFilter}';
  }
}

class UpdateTabAction {
  final AppTab newTab;

  UpdateTabAction(this.newTab);

  @override
  String toString() {
    return 'UpdateTabAction{newTab: $newTab}';
  }
}
