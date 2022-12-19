class Product {
  int? id;
  final String name;
  final double price;
  final String img;
  final int quantity;

  Product(this.name, this.price, this.quantity, this.img, {this.id});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "img": img,
      "quantity": quantity,
    };
  }
}
