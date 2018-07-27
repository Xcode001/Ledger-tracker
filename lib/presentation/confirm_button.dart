import 'package:flutter/material.dart';
import 'package:vsii_trader/common/flutter_architecture_samples.dart';
import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/models/models.dart';

class ConfirmButton extends StatelessWidget {
  final Order order;
  final VoidCallback onPressedButton;

  ConfirmButton({this.order, this.onPressedButton, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);

    return AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(milliseconds: 150),
        child: new RaisedButton(
          onPressed: () {},
          child: Text(localizations.confirm),
          color: Theme.of(context).accentColor,
          elevation: 4.0,
          splashColor: Colors.blueGrey,
        ));
  }
}
