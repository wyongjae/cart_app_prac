import 'package:cart_app_parc/data/item.dart';
import 'package:cart_app_parc/presentation/cart_list_page.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Item> _items = [
    Item(name: '포카칩', price: 3000),
    Item(name: '책', price: 15000),
    Item(name: '핸드폰', price: 1050000),
    Item(name: '연필', price: 1500),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartListPage()),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = _items[index];

          return SizedBox(
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Card(
                    child: ListTile(
                      title: Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text('${item.price}'),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.check),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
