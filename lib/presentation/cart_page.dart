import 'package:cart_app_parc/data/item.dart';
import 'package:cart_app_parc/domain/cart_view_model.dart';
import 'package:cart_app_parc/presentation/cart_list_page.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final CartViewModel viewModel;

  const CartPage({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchItem();
  }

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
      body: StreamBuilder<List<Item>>(
        initialData: const [],
        stream: widget.viewModel.cartStream,
        builder: (BuildContext context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final items = snapshot.data ?? [];

          return ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];

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
          );
        },
      ),
    );
  }
}
