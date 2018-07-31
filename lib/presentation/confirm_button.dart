import 'package:flutter/material.dart';
import 'package:vsii_trader/common/flutter_architecture_samples.dart';
import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/models/models.dart';

final List<String> supplierOrderStatus = [
  'NEW',
  'PAYMENT_SENT',
];
final List<String> retailerOrderStatus = [
  'INVOICE_SENT',
  'INVOICE_RECEIVED',
  'PAYMENT_RECEIVED',
];

class ConfirmButton extends StatelessWidget {
  final Order order;
  final User user;
  final VoidCallback onPressedButton;
  final List<String> userActions;

  ConfirmButton(
      {this.order, this.user, this.userActions, this.onPressedButton, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);

    return AnimatedOpacity(
        opacity: userActions.contains(order.status) ? 1.0 : 0.0,
        duration: Duration(milliseconds: 150),
        child: new RaisedButton(
          onPressed: onPressedButton,
          child: Text(localizations.confirm),
          color: Theme.of(context).accentColor,
          elevation: 4.0,
          splashColor: Colors.blueGrey,
        ));
  }
}
