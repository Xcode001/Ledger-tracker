import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vsii_trader/common/flutter_architecture_samples.dart';
import 'package:vsii_trader/models/models.dart';

class DetailsScreen extends StatelessWidget {
  final Order order;

  DetailsScreen({
    Key key,
    @required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.orderDetails),
        actions: [],
//        actions: [
//          IconButton(
//            tooltip: localizations.deleteOrder,
//            key: ArchSampleKeys.deleteOrderButton,
//            icon: Icon(Icons.delete),
//            onPressed: () {
//              onDelete();
//              Navigator.pop(context, order);
//            },
//          )
//        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Order Description
                      Hero(
                        tag: '${order.desciption}__heroTag',
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                            top: 8.0,
                            bottom: 16.0,
                          ),
                          child: Text(
                            localizations.desciption,
                            key: ArchSampleKeys.detailsOrderItemDescription,
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ),
                      ),
                      Text(
                        order.desciption,
                        key: ArchSampleKeys.detailsOrderItemDescription,
                        style: Theme.of(context).textTheme.display1,
                      ),

                      //Status
                      Hero(
                        tag: '${order.status}__heroTag',
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                            top: 8.0,
                            bottom: 16.0,
                          ),
                          child: Text(
                            localizations.status,
                            key: ArchSampleKeys.detailsOrderItemStatus,
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ),
                      ),
                      Text(
                        order.status,
                        key: ArchSampleKeys.detailsOrderItemStatus,
                        style: Theme.of(context).textTheme.display1.apply(
                            color: order.status == "Closed"
                                ? Colors.red
                                : Colors.green),
                      ),

                      //Id
                      Hero(
                        tag: '${order.id}__heroTag',
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                            top: 8.0,
                            bottom: 16.0,
                          ),
                          child: Text(
                            localizations.orderId,
                            key: ArchSampleKeys.detailsOrderItemId,
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ),
                      ),
                      Text(
                        order.id,
                        key: ArchSampleKeys.detailsOrderItemId,
                        style: Theme.of(context).textTheme.display1,
                      ),

                      // Supplier
                      Hero(
                        tag: '${order.supplier}__heroTag',
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                            top: 8.0,
                            bottom: 16.0,
                          ),
                          child: Text(
                            localizations.supplier,
                            key: ArchSampleKeys.detailsOrderItemSupplier,
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ),
                      ),
                      Text(
                        order.supplier,
                        key: ArchSampleKeys.detailsOrderItemSupplier,
                        style: Theme.of(context).textTheme.display1,
                      ),

                      // Quantity
                      Hero(
                        tag: '${order.quantity}__heroTag',
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                            top: 8.0,
                            bottom: 16.0,
                          ),
                          child: Text(
                            localizations.quanity,
                            key: ArchSampleKeys.detailsOrderItemQuantity,
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ),
                      ),
                      Row(
                        key: ArchSampleKeys.detailsOrderQuantityRow,
                        children: [
                          Text(
                            order.quantity.toString(),
                            key: ArchSampleKeys.detailsOrderItemQuantity,
                            style: Theme.of(context).textTheme.display1,
                          ),
                          Text(
                            ' ' + localizations.packs,
                            key: ArchSampleKeys.detailsOrderItemUnit,
                            style: Theme.of(context).textTheme.display1,
                          ),
                        ],
                      ),

                      // Total Price
                      Hero(
                        tag: '${order.totalPrice}__heroTag',
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                            top: 8.0,
                            bottom: 16.0,
                          ),
                          child: Text(
                            localizations.price,
                            key: ArchSampleKeys.detailsOrderItemTotalPrice,
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ),
                      ),
                      Row(
                        key: ArchSampleKeys.detailsOrderItemTotalPrice,
                        children: [
                          Text(
                            order.totalPrice.round().toString(),
                            key: ArchSampleKeys.detailsOrderItemTotalPrice,
                            style: Theme.of(context).textTheme.display1,
                          ),
                          Text(
                            ' ' + localizations.usd,
                            key: ArchSampleKeys.detailsOrderCurrency,
                            style: Theme.of(context).textTheme.display1,
                          ),
                        ],
                      ),

                      //Updated Date
                      Hero(
                        tag: '${order.updatedDate}__heroTag',
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                            top: 8.0,
                            bottom: 16.0,
                          ),
                          child: Text(
                            localizations.updated,
                            key: ArchSampleKeys.detailsOrderUpdatedDate,
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ),
                      ),
                      Text(
                        order.updatedDate,
                        key: ArchSampleKeys.detailsOrderUpdatedDate,
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ],
                  ),
                )),
//                Expanded(
//
//                ),
              ],
            ),
          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        key: ArchSampleKeys.editOrderFab,
//        tooltip: localizations.editOrder,
//        child: Icon(Icons.edit),
//        onPressed: () {
//          Navigator.of(context).push(
//            MaterialPageRoute(
//              builder: (context) {
//                return EditOrder(
//                  order: order,
//                );
//              },
//            ),
//          );
//        },
//      ),
    );
  }
}
