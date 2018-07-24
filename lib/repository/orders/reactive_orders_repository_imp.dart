import 'dart:async';
import 'dart:core';

import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';
import 'package:vsii_trader/repository/orders/order_entity.dart';
import 'package:vsii_trader/repository/orders/reactive_orders_repository.dart';
import 'package:vsii_trader/repository/orders/orders_repository.dart';

/// A class that glues together our local file storage and web client. It has a
/// clear responsibility: Load Orders and Persist orders.
class ReactiveOrdersRepositoryFlutter implements ReactiveOrdersRepository {
  final OrdersRepository _repository;
  final BehaviorSubject<List<OrderEntity>> _subject;
  bool _loaded = false;

  ReactiveOrdersRepositoryFlutter({
    @required OrdersRepository repository,
    List<OrderEntity> seedValue,
  })  : this._repository = repository,
        this._subject =
            BehaviorSubject<List<OrderEntity>>(seedValue: seedValue);

  @override
  Future<void> addNewOrder(OrderEntity order) async {
    _subject.add(List.unmodifiable([]
      ..addAll(_subject.value ?? [])
      ..add(order)));

    await _repository.saveOrders(_subject.value);
  }

  @override
  Stream<List<OrderEntity>> orders() {
    if (!_loaded) _loadOrders();

    return _subject.stream;
  }

  void _loadOrders() {
    _loaded = true;

    _repository.loadOrders().then((entities) {
      _subject.add(List<OrderEntity>.unmodifiable(
        []..addAll(_subject.value ?? [])..addAll(entities),
      ));
    });
  }

  @override
  Future<void> updateOrder(OrderEntity update) async {
    _subject.add(
      List<OrderEntity>.unmodifiable(_subject.value.fold<List<OrderEntity>>(
        <OrderEntity>[],
        (prev, entity) => prev..add(entity.id == update.id ? update : entity),
      )),
    );

    await _repository.saveOrders(_subject.value);
  }
}
