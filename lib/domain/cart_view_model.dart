import 'dart:collection';

import 'package:cart_app_parc/data/item.dart';
import 'package:flutter/material.dart';

class CartViewModel with ChangeNotifier {
  final List<Item> products = [
    Item(name: '포카칩', price: 3000),
    Item(name: '책', price: 15000),
    Item(name: '핸드폰', price: 1050000),
    Item(name: '연필', price: 2000),
  ];

  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  void _addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void _removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }

  void onItemClick(Item item) {
    item.isChecked = !item.isChecked;

    if (item.isChecked) {
      _addItem(item);
    } else {
      _removeItem(item);
    }
  }
}
