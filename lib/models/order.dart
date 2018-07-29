import 'package:vsii_trader/common/uuid.dart';
import 'package:meta/meta.dart';
import 'package:vsii_trader/repository/orders/orders_index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
@immutable
class Order extends Object with _$OrderSerializerMixin {
  @JsonKey(name: 'orderId')
  final String id;

  final String supplier = "resource:com.vsii.trd.ordertracker.Supplier#4696";

  final String retailer = "resource:com.vsii.trd.ordertracker.Retailer#7727";

  @JsonKey(name: 'product')
  final String desciption;

  final String unitType = 'BOX';

  final int quantity;

  @JsonKey(name: 'amount')
  final double totalPrice;

  final String currency = 'USD';

  final String paymentMethod = 'BANK_TRANSFER';

  final String startedDate = '2018-07-27T08:35:53.206Z';

  final String status;

  @JsonKey(name: 'lastUpdatedDate')
  final String updatedDate;

  @JsonKey(name: '\u{0024}class')
  final String orderClass = "com.vsii.trd.ordertracker.Order";

  Order({
    String id,
    String supplier,
    String retailer,
    String desciption = '',
    String unitType,
    int quantity,
    double totalPrice,
    String currency,
    String paymentMethod,
    String startedDate,
    String status,
    String updatedDate,
    String orderClass,
  })  : this.desciption = desciption ?? '',
        this.quantity = quantity ?? 0,
        this.status = 'NEW',
        this.totalPrice = totalPrice ?? 0.00,
        this.updatedDate =
            updatedDate ?? (new DateTime.now()).toString().split(' ')[0],
        this.id = id ?? Uuid().generateV4();

  Order copyWith(
      {String id,
      String supplier,
      String retailer,
      String desciption,
      int quantity,
      double totalPrice,
      String status,
      String updatedDate}) {
    return Order(
      id: id ?? this.id,
      supplier: supplier ?? this.supplier,
      retailer: retailer ?? this.retailer,
      desciption: desciption ?? this.desciption,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }

  @override
  int get hashCode =>
      supplier.hashCode ^
      retailer.hashCode ^
      desciption.hashCode ^
      status.hashCode ^
      updatedDate.hashCode ^
      id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Order &&
          runtimeType == other.runtimeType &&
          supplier == other.supplier &&
          retailer == other.retailer &&
          desciption == other.desciption &&
          status == other.status &&
          updatedDate == other.updatedDate &&
          id == other.id;

  @override
  String toString() {
    return 'OrderEntity{supplier: $supplier, retailer: $retailer, desciption: $desciption, quanity: $quantity, totalPrice: $totalPrice, status: $status, updatedDate: $updatedDate, id: $id}';
  }

  OrderEntity toEntity() {
    return OrderEntity(id, supplier, retailer, desciption, quantity, totalPrice,
        status, updatedDate);
  }

  static Order fromEntity(OrderEntity entity) {
    return Order(
      id: entity.id ?? Uuid().generateV4(),
      supplier: entity.supplier ?? 'IBM',
      retailer: entity.retailer ?? 'VSII',
      desciption: entity.desciption ?? '',
      quantity: entity.quantity ?? 0,
      totalPrice: entity.totalPrice ?? 0.00,
      status: entity.status ?? 'New Request',
      updatedDate: entity.updatedDate ?? 'Stone age',
    );
  }

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
