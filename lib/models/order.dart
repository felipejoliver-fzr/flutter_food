class Order {
  int? id;
  final String clientName;
  final dynamic items;
  final double? price;
  final String? datetime;

  Order(this.clientName, this.items, {this.id, this.price, this.datetime});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "clientName": clientName,
      "items": items,
      "price": price,
      "datetime": datetime
    };
  }
}
