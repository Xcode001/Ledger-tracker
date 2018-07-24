import 'package:flutter/material.dart';
import 'package:vsii_trader/common/flutter_architecture_samples.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vsii_trader/actions/order_actions.dart';
import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/presentation/order/add_edit_screen.dart';

class AddOrder extends StatelessWidget {
  AddOrder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnSaveCallback>(
      converter: (Store<AppState> store) {
        return (id, supplier, desciption, quanity) {
          store.dispatch(AddOrderAction(Order(
            id: id,
            supplier: supplier,
            desciption: desciption,
            quanity: quanity,
            totalPrice: 0.00,
            status: 'New Request',
            updatedDate: (new DateTime.now()).toString().split(' ')[0],
          )));
        };
      },
      builder: (BuildContext context, OnSaveCallback onSave) {
        return AddEditScreen(
          key: ArchSampleKeys.addOrderScreen,
          onSave: onSave,
        );
      },
    );
  }
}
