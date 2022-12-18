// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart-store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartStore on _CartStoreBase, Store {
  Computed<bool>? _$listContainsComputed;

  @override
  bool get listContains =>
      (_$listContainsComputed ??= Computed<bool>(() => super.listContains,
              name: '_CartStoreBase.listContains'))
          .value;
  Computed<int>? _$getValueComputed;

  @override
  int get getValue => (_$getValueComputed ??=
          Computed<int>(() => super.getValue, name: '_CartStoreBase.getValue'))
      .value;

  late final _$valueAtom = Atom(name: '_CartStoreBase.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$_CartStoreBaseActionController =
      ActionController(name: '_CartStoreBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addToCart() {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.addToCart');
    try {
      return super.addToCart();
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(dynamic idToRemove) {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.removeItem');
    try {
      return super.removeItem(idToRemove);
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
listContains: ${listContains},
getValue: ${getValue}
    ''';
  }
}
