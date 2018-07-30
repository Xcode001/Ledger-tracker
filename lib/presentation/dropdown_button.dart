import 'package:flutter/material.dart';
import 'package:vsii_trader/common/flutter_architecture_samples.dart';

final List<String> retailerOrderStatus = [
  'VSII',
  'IBM',
  'Amazon',
];

class DropDownButton extends StatelessWidget {
  final Function(String value) onSelected;
  final String value;

  DropDownButton({this.onSelected, this.value, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    final localizations = ArchSampleLocalizations.of(context);

    return DropdownButton<String>(
        value: value,
        key: key,
        items: retailerOrderStatus
            .map((String item) => new DropdownMenuItem<String>(
                value: item, child: new Text(item)))
            .toList(),
        onChanged: (String newValue) => onSelected);
  }
}
