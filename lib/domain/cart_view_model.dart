import 'dart:collection';

import 'package:cart_app_parc/data/item.dart';
import 'package:flutter/material.dart';

class CartViewModel with ChangeNotifier {
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}