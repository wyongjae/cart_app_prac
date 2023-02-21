import 'package:cart_app_parc/domain/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartListPage extends StatelessWidget {
  const CartListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CartViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('CartListPage'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: viewModel.items.length,
        itemBuilder: (BuildContext context, int index) {
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
                        '${viewModel.items[index]}',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
