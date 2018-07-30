import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vsii_trader/common/flutter_architecture_samples.dart';
import 'package:vsii_trader/containers/app_loading.dart';
import 'package:vsii_trader/containers/order_details.dart';
import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/presentation/loading_indicator.dart';
import 'package:vsii_trader/presentation/order/order_item.dart';

class OrderList extends StatelessWidget {
  final List<Order> orders;
//  final Function(Order, bool) onCheckboxChanged;
//  final Function(Order) onRemove;
//  final Function(Order) onUndoRemove;
//  final Future<void> onRefresh;

  OrderList({
    Key key,
    @required this.orders,
//    this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLoading(builder: (context, loading) {
//      return _buildListView();
      return loading
          ? LoadingIndicator(key: ArchSampleKeys.ordersLoading)
          : _buildListView();
//          : new RefreshIndicator(
//              child: _buildListView(), onRefresh: () => onRefresh);
    });
  }

  ListView _buildListView() {
    return ListView.builder(
      key: ArchSampleKeys.orderList,
      itemCount: orders.length,
      itemBuilder: (BuildContext context, int index) {
        final order = orders[index];

        return OrderItem(
          order: order,
//          onDismissed: (direction) {
//            _removeOrder(context, order);
//          },
          onTap: () => _onOrderTap(context, order),
        );
      },
    );
  }

//  void _removeOrder(BuildContext context, Order order) {
//    onRemove(order);
//
//    Scaffold.of(context).showSnackBar(SnackBar(
//        duration: Duration(seconds: 2),
//        backgroundColor: Theme.of(context).backgroundColor,
//        content: Text(
//          ArchSampleLocalizations.of(context).orderDeleted(order.task),
//          maxLines: 1,
//          overflow: TextOverflow.ellipsis,
//        ),
//        action: SnackBarAction(
//          label: ArchSampleLocalizations.of(context).undo,
//          onPressed: () => onUndoRemove(order),
//        )));
//  }

  void _onOrderTap(BuildContext context, Order order) {
    Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => OrderDetails(id: order.id),
        ));
//        .then((removedOrder) {
//      if (removedOrder != null) {
//        Scaffold.of(context).showSnackBar(SnackBar(
//            key: ArchSampleKeys.snackbar,
//            duration: Duration(seconds: 2),
//            backgroundColor: Theme.of(context).backgroundColor,
//            content: Text(
//              ArchSampleLocalizations.of(context).orderDeleted(order.task),
//              maxLines: 1,
//              overflow: TextOverflow.ellipsis,
//            ),
//            action: SnackBarAction(
//              label: ArchSampleLocalizations.of(context).undo,
//              onPressed: () {
//                onUndoRemove(order);
//              },
//            )));
//      }
//    });
  }
}
