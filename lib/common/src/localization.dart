import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:vsii_trader/common/src/localizations/messages_all.dart';
import 'package:intl/intl.dart';

class ArchSampleLocalizations {
  ArchSampleLocalizations(this.locale);

  final Locale locale;

  static Future<ArchSampleLocalizations> load(Locale locale) {
    return initializeMessages(locale.toString()).then((_) {
      return ArchSampleLocalizations(locale);
    });
  }

  static ArchSampleLocalizations of(BuildContext context) {
    return Localizations.of<ArchSampleLocalizations>(
        context, ArchSampleLocalizations);
  }

  String get orders => Intl.message(
        'Orders',
        name: 'orders',
        args: [],
        locale: locale.toString(),
      );

  String get stats => Intl.message(
        'Stats',
        name: 'stats',
        args: [],
        locale: locale.toString(),
      );

  String get showAll => Intl.message(
        'Show All',
        name: 'showAll',
        args: [],
        locale: locale.toString(),
      );

  String get showActive => Intl.message(
        'Show Active',
        name: 'showActive',
        args: [],
        locale: locale.toString(),
      );

  String get showCompleted => Intl.message(
        'Show Completed',
        name: 'showCompleted',
        args: [],
        locale: locale.toString(),
      );

  String get showNewRequest => Intl.message(
        'Show New Request',
        name: 'showNewRequest',
        args: [],
        locale: locale.toString(),
      );

  String get newRequest => Intl.message(
        'New Request',
        name: 'newRequest',
        args: [],
        locale: locale.toString(),
      );

  String get invoiceSent => Intl.message(
        'Invoice Sent',
        name: 'invoiceSent',
        args: [],
        locale: locale.toString(),
      );

  String get invoiceRecieved => Intl.message(
        'Invoice Recieved',
        name: 'invoiceRecieved',
        args: [],
        locale: locale.toString(),
      );

  String get paymentSent => Intl.message(
        'Payment Sent',
        name: 'paymentSent',
        args: [],
        locale: locale.toString(),
      );

  String get paymentReceived => Intl.message(
        'Payment Received',
        name: 'paymentReceived',
        args: [],
        locale: locale.toString(),
      );

  String get closed => Intl.message(
        'Closed',
        name: 'closed',
        args: [],
        locale: locale.toString(),
      );

  String get confirm => Intl.message(
        'Confirm',
        name: 'confirm',
        args: [],
        locale: locale.toString(),
      );

  String get inProgress => Intl.message(
        'In Progress',
        name: 'inProgress',
        args: [],
        locale: locale.toString(),
      );

  String get draft => Intl.message(
        'Draft',
        name: 'draft',
        args: [],
        locale: locale.toString(),
      );

  String get showClosed => Intl.message(
        'Show Closed',
        name: 'showClosed',
        args: [],
        locale: locale.toString(),
      );

  String get showInProgress => Intl.message(
        'Show In Progress',
        name: 'showInProgress',
        args: [],
        locale: locale.toString(),
      );

  String get markAllComplete => Intl.message(
        'Mark all complete',
        name: 'markAllComplete',
        args: [],
        locale: locale.toString(),
      );

  String get markAllIncomplete => Intl.message(
        'Mark all incomplete',
        name: 'markAllIncomplete',
        args: [],
        locale: locale.toString(),
      );

  String get clearCompleted => Intl.message(
        'Clear completed',
        name: 'clearCompleted',
        args: [],
        locale: locale.toString(),
      );

  String get addOrder => Intl.message(
        'Add Order',
        name: 'addOrder',
        args: [],
        locale: locale.toString(),
      );

  String get orderId => Intl.message(
        'Order ID',
        name: 'orderId',
        args: [],
        locale: locale.toString(),
      );

  String get supplier => Intl.message(
        'Supplier',
        name: 'supplier',
        args: [],
        locale: locale.toString(),
      );

  String get updated => Intl.message(
        'Updated',
        name: 'updated',
        args: [],
        locale: locale.toString(),
      );

  String get desciption => Intl.message(
        'Desciption',
        name: 'desciption',
        args: [],
        locale: locale.toString(),
      );

  String get status => Intl.message(
        'Status',
        name: 'status',
        args: [],
        locale: locale.toString(),
      );

  String get quanity => Intl.message(
        'Quanity',
        name: 'quanity',
        args: [],
        locale: locale.toString(),
      );

  String get price => Intl.message(
        'Price',
        name: 'price',
        args: [],
        locale: locale.toString(),
      );

  String get packs => Intl.message(
        'Packs',
        name: 'packs',
        args: [],
        locale: locale.toString(),
      );

  String get usd => Intl.message(
        'USD',
        name: 'usd',
        args: [],
        locale: locale.toString(),
      );

  String get saveChanges => Intl.message(
        'Save changes',
        name: 'saveChanges',
        args: [],
        locale: locale.toString(),
      );

  String get filterOrders => Intl.message(
        'Filter Orders',
        name: 'filterOrders',
        args: [],
        locale: locale.toString(),
      );

  String get orderDetails => Intl.message(
        'Order Details',
        name: 'orderDetails',
        args: [],
        locale: locale.toString(),
      );

  String get emptyOrderError => Intl.message(
        'Please enter some text',
        name: 'emptyOrderError',
        args: [],
        locale: locale.toString(),
      );

  String get emptyQuanityError => Intl.message(
        'Please enter quanity',
        name: 'emptyQuanityError',
        args: [],
        locale: locale.toString(),
      );

  String get newOrders => Intl.message(
        'New Orders',
        name: 'newOrders',
        args: [],
        locale: locale.toString(),
      );

  String get inProgressOrders => Intl.message(
        'In Progress Orders',
        name: 'inProgressOrders',
        args: [],
        locale: locale.toString(),
      );

  String get closedOrders => Intl.message(
        'Closed Orders',
        name: 'closedOrders',
        args: [],
        locale: locale.toString(),
      );

  String get undo => Intl.message(
        'Undo',
        name: 'undo',
        args: [],
        locale: locale.toString(),
      );

  String get cancel => Intl.message(
        'Cancel',
        name: 'cancel',
        args: [],
        locale: locale.toString(),
      );
}

class ArchSampleLocalizationsDelegate
    extends LocalizationsDelegate<ArchSampleLocalizations> {
  @override
  Future<ArchSampleLocalizations> load(Locale locale) =>
      ArchSampleLocalizations.load(locale);

  @override
  bool shouldReload(ArchSampleLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode.toLowerCase().contains("en");
}
