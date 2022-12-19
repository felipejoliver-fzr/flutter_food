import 'dart:math';

import 'package:flutter_food/components/product-item.dart';
import 'package:mobx/mobx.dart';
part 'cart-store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  ObservableList<ProductItem> cartProducts = ObservableList<ProductItem>();

  Random random = Random();

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  void addToCart() => List.from(cartProducts
    ..add(ProductItem(
        id: value,
        name: 'X-Burguer ${value}',
        description: '',
        price: 20,
        img: "xburguer.png",
        quantity: 1)));

  @action
  void removeItem(idToRemove) =>
      List.from(cartProducts..removeWhere((item) => item.id == idToRemove));

  @action
  void clear() => List.from(cartProducts..clear());

  @computed
  bool get listContains => cartProducts.isNotEmpty;

  @computed
  int get getValue => value;

  @computed
  double get getTotalCart =>
      cartProducts.fold(0, (previous, current) => previous + current.price);
}
