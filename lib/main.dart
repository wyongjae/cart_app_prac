import 'package:cart_app_parc/data/item_data.dart';
import 'package:cart_app_parc/domain/cart_view_model.dart';
import 'package:cart_app_parc/presentation/cart_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CartPage(
        viewModel: CartViewModel(ItemData()),
      ),
    );
  }
}
