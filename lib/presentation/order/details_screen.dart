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
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: '${order.id}__heroTag',
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                            top: 8.0,
                            bottom: 16.0,
                          ),
                          child: Text(
                            order.supplier,
                            key: ArchSampleKeys.detailsOrderItemSupplier,
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ),
                      ),
                      Text(
                        order.desciption,
                        key: ArchSampleKeys.detailsOrderItemDescription,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                    ],
                  ),
                ),
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
