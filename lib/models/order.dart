class Order {
  int? id;
  final String clientName;
  final dynamic items;

  Order(this.clientName, this.items, {this.id});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "clientName": clientName,
      "items": items,
    };
  }
}
