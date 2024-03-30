import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_widget.dart';
import 'cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: CartWidget(),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false).clearCart();
            },
            child: Text('Clear Cart'),
          ),
        ],
      ),
    );
  }
}
