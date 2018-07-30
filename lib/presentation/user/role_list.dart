import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vsii_trader/common/flutter_architecture_samples.dart';
import 'package:vsii_trader/containers/app_loading.dart';
import 'package:vsii_trader/containers/order_details.dart';
import 'package:vsii_trader/containers/filtered_orders.dart';
import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/presentation/loading_indicator.dart';
import 'package:vsii_trader/presentation/order/order_item.dart';
import 'package:vsii_trader/presentation/home_screen.dart';

typedef OnChooseCallback = Function(String role);

class UserList extends StatelessWidget {
  final User user;
  final Function(String) onSave;

  UserList({Key key, @required this.onSave, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLoading(builder: (context, loading) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: new GestureDetector(
                onTap: () => _onRoleTap(context, 'Retailer'),
                child: Card(child: Image.asset('assets/images/shop.png')),
              ),
            ),
            Expanded(
              child: new GestureDetector(
                onTap: () => _onRoleTap(context, 'Supplier'),
                child: Card(child: Image.asset('assets/images/delivery.png')),
              ),
            ),
          ],
        ),
      );
    });
  }

//  ListView _buildListView() {
//    return ListView.builder(
//      key: ArchSampleKeys.orderList,
//      itemCount: orders.length,
//      itemBuilder: (BuildContext context, int index) {
//        final order = orders[index];
//
//        return OrderItem(
//          order: order,
//          onTap: () => _onOrderTap(context, order),
//        );
//      },
//    );
//  }

  void _onRoleTap(BuildContext context, String role) {
    onSave(role);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => new HomeScreen(),
//        new MaterialPageRoute(builder: (_) => new HomeScreen())));
        ));
  }
}
