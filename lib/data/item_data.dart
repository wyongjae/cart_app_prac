import 'dart:convert';

import 'package:cart_app_parc/data/item.dart';

class ItemData {
  Future<List<Item>> fetchData() async {
    List<dynamic> jsonResponse = await jsonDecode(items);

    return jsonResponse.map((e) => Item.fromJson(e)).toList();
  }
}

const items = '''[
  {
    "name": "포카칩",
    "price": 5000
  },
  {
    "name": "스윙칩",
    "price": 3000
  },
  {
    "name": "감자칩",
    "price": 3500
  },
  {
    "name": "초코칩",
    "price": 2000
  }
]''';
