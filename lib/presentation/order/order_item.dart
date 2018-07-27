import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vsii_trader/common/flutter_architecture_samples.dart';
import 'package:vsii_trader/models/models.dart';

class OrderItem extends StatelessWidget {
//  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final Order order;

  OrderItem({
//    @required this.onDismissed,
    @required this.onTap,
    @required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        ListTile(
          onTap: onTap,
//        leading: Checkbox(
//          key: ArchSampleKeys.orderItemCheckbox(order.id),
//          value: order.complete,
//          onChanged: onCheckboxChanged,
//        ),
          title: Hero(
            tag: '${order.id}__heroTag',
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                order.supplier,
                key: ArchSampleKeys.orderItemSupplier(order.id),
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.desciption,
                key: ArchSampleKeys.orderItemDescription(order.id),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subhead,
              ),
              Row(
                key: ArchSampleKeys.orderItemRow(order.id),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    order.quanity.toString() + ' packs',
                    key: ArchSampleKeys.orderItemQuantity(order.id),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Text(
                    order.totalPrice.floor().toString() + ' USD',
                    key: ArchSampleKeys.orderItemTotalPrice(order.id),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Text(
                    '',
                    key: ArchSampleKeys.orderItemSpacer(order.id),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ],
              ),
              Text(
                order.status,
                key: ArchSampleKeys.orderItemStatus(order.id),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(
                    color:
                        order.status == 'Closed' ? Colors.red : Colors.green),
              ),
            ],
          ),
          trailing: Text(order.updatedDate),
        ),
      ]),
    );
//    return Dismissible(
//        key: ArchSampleKeys.orderItem(order.id),
////      onDismissed: onDismissed,
//        child: );
  }
}
