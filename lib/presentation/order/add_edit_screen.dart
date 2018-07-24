import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vsii_trader/common/flutter_architecture_samples.dart';
import 'package:vsii_trader/models/models.dart';
import 'package:vsii_trader/common/uuid.dart';

typedef OnSaveCallback = Function(
    String id, String supplier, String description, int quanity);

class AddEditScreen extends StatelessWidget {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final GlobalKey<FormFieldState<String>> _idKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> _supplierKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> _descriptionKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> _quanityKey =
      GlobalKey<FormFieldState<String>>();

//  final bool isAddNew;
  final Function(String, String, String, int) onSave;
  final Order order;

  List<String> _suppliers = <String>['Apple', 'VSII', 'Google'].toList();
  String _supplier = 'Apple';

  AddEditScreen({Key key, @required this.onSave, this.order})
      : super(key: key ?? ArchSampleKeys.addOrderScreen);

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final dropdownMenuOptions = _suppliers
        .map((String item) =>
            new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.addOrder,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                enabled: false,
                initialValue: Uuid().generateV4(),
                key: _idKey,
                autofocus: false,
                style: textTheme.headline,
                decoration: InputDecoration(
                  labelText: localizations.orderId,
                ),
                validator: (val) {
                  return val.trim().isEmpty
                      ? localizations.emptyOrderError
                      : null;
                },
              ),
              DropdownButton<String>(
                  value: _supplier,
                  key: _supplierKey,
                  items: dropdownMenuOptions,
                  onChanged: (String newValue) {
                    _supplier = newValue;
                    return newValue;
                  }),
              TextFormField(
                keyboardType: TextInputType.text,
                key: _descriptionKey,
                style: textTheme.subhead,
                decoration: InputDecoration(
                  labelText: localizations.desciption,
                ),
                validator: (val) {
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                key: _quanityKey,
                style: textTheme.subhead,
                decoration: InputDecoration(
                  labelText: localizations.quanity,
                ),
                validator: (val) {
                  return val.trim().isEmpty
                      ? localizations.emptyQuanityError
                      : null;
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: localizations.addOrder,
        child: Icon(Icons.check),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            onSave(
              _idKey.currentState.value,
              _supplier,
              _descriptionKey.currentState.value,
              int.parse(_quanityKey.currentState.value),
            );

            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
