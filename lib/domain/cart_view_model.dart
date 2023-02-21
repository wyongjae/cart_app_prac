import 'dart:async';

import 'package:cart_app_parc/data/item.dart';
import 'package:cart_app_parc/data/item_data.dart';

class CartViewModel {
  final ItemData itemData;

  CartViewModel(this.itemData);

  final _cartStreamController = StreamController<List<Item>>();

  Stream<List<Item>> get cartStream => _cartStreamController.stream;

  Future<void> fetchItem() async {
    final result = await itemData.fetchData();
    _cartStreamController.add(result);
  }
}