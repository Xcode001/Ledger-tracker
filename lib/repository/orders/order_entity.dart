class OrderEntity {
  final String id;
  final String supplier;
  final String retailer;
  final String desciption;
  final int quanity;
  final double totalPrice;
  final String status;
  final String updatedDate;

  OrderEntity(this.id, this.supplier, this.retailer, this.desciption,
      this.quanity, this.totalPrice, this.status, this.updatedDate);

  @override
  int get hashCode =>
      supplier.hashCode ^
      retailer.hashCode ^
      desciption.hashCode ^
      status.hashCode ^
      updatedDate.hashCode ^
      id.hashCode;

  Map<Object, Object> toJson() {
    return {
      "\u{0024}class": "com.vsii.trd.ordertracker.Order" as String,
      "orderId": id,
      "product": desciption,
      "status": status,
      "quantity": quanity as int,
      "unitType": 'PCS',
      "amount": totalPrice.round(),
      "currency": 'USD',
      "paymentMethod": 'BANK_TRANSFER',
      "startedDate": "2018-07-27T08:35:53.206Z",
      "lastUpdatedDate": updatedDate,
      "retailer": "resource:com.vsii.trd.ordertracker.Retailer#4202",
      "supplier": "resource:com.vsii.trd.ordertracker.Supplier#3665",
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderEntity &&
          runtimeType == other.runtimeType &&
          supplier == other.supplier &&
          retailer == other.retailer &&
          desciption == other.desciption &&
          status == other.status &&
          updatedDate == other.updatedDate &&
          id == other.id;

  @override
  String toString() {
    return 'OrderEntity{supplier: $supplier, retailer: $retailer, desciption: $desciption, quanity: $quanity, totalPrice: $totalPrice, status: $status, updatedDate: $updatedDate, id: $id}';
  }

  static OrderEntity fromJson(Map<Object, Object> json) {
    return OrderEntity(
      json["orderId"] as String,
      json["supplier"] as String,
      json["retailer"] as String,
      json["product"] as String,
      json["quantity"] as int,
      double.parse((json["amount"] as int).toString()),
      json["status"] as String,
      json["lastUpdatedDate"] as String,
    );
  }
}
