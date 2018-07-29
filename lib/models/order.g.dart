// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => new Order(
    id: json['orderId'] as String,
    supplier: json['supplier'] as String,
    retailer: json['retailer'] as String,
    desciption: json['product'] as String,
    unitType: json['unitType'] as String,
    quantity: json['quantity'] as int,
    totalPrice: (json['amount'] as num)?.toDouble(),
    currency: json['currency'] as String,
    paymentMethod: json['paymentMethod'] as String,
    startedDate: json['startedDate'] as String,
    status: json['status'] as String,
    updatedDate: json['lastUpdatedDate'] as String,
    orderClass: json[r'$class'] as String);

abstract class _$OrderSerializerMixin {
  String get id;
  String get supplier;
  String get retailer;
  String get desciption;
  String get unitType;
  int get quantity;
  double get totalPrice;
  String get currency;
  String get paymentMethod;
  String get startedDate;
  String get status;
  String get updatedDate;
  String get orderClass;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'orderId': id,
        'supplier': supplier,
        'retailer': retailer,
        'product': desciption,
        'unitType': unitType,
        'quantity': quantity,
        'amount': totalPrice,
        'currency': currency,
        'paymentMethod': paymentMethod,
        'startedDate': startedDate,
        'status': status,
        'lastUpdatedDate': updatedDate,
        r'$class': orderClass
      };
}
