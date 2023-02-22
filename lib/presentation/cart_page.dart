import 'package:cart_app_parc/data/item.dart';
import 'package:cart_app_parc/domain/cart_view_model.dart';
import 'package:cart_app_parc/presentation/cart_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CartViewModel>();

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
        itemCount: viewModel.products.length,
        itemBuilder: (BuildContext context, int index) {
          final item = viewModel.products[index];

          return Card(
            child: ListTile(
              title: Text(
                item.name,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text('${item.price}'),
              trailing: IconButton(
                onPressed: () {
                  viewModel.onItemClick(item);
                },
                icon: item.isChecked
                    ? const Icon(
                        Icons.check,
                        color: Colors.red,
                      )
                    : const Icon(Icons.check),
              ),
            ),
          );
        },
      ),
    );
  }
}
