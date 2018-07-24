class OrderEntity {
  final String id;
  final String supplier;
  final String desciption;
  final int quanity;
  final double totalPrice;
  final String status;
  final String updatedDate;

  OrderEntity(this.id, this.supplier, this.desciption, this.quanity, this.totalPrice, this.status, this.updatedDate);

  @override
  int get hashCode =>
      supplier.hashCode ^ desciption.hashCode ^ status.hashCode ^ updatedDate.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is OrderEntity &&
              runtimeType == other.runtimeType &&
              supplier == other.supplier &&
              desciption == other.desciption &&
              status == other.status &&
              updatedDate == other.updatedDate &&
              id == other.id;

  Map<String, Object> toJson() {
    return {
      "supplier": supplier,
      "desciption": desciption,
      "quanity": quanity,
      "totalPrice": totalPrice,
      "status": status,
      "updatedDate": updatedDate,
      "id": id,
    };
  }

  @override
  String toString() {
    return 'OrderEntity{supplier: $supplier, desciption: $desciption, quanity: $quanity, totalPrice: $totalPrice, status: $status, updatedDate: $updatedDate, id: $id}';
  }

  static OrderEntity fromJson(Map<String, Object> json) {
    return OrderEntity(
      json["id"] as String,
      json["supplier"] as String,
      json["desciption"] as String,
      json["quanity"] as int,
      json["totalPrice"] as double,
      json["status"] as String,
      json["updatedDate"] as String,
    );
  }
}
