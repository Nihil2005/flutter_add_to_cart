import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return ListTile(
          leading: Image.network(item.product.imageUrl),
          title: Text(item.product.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  '\$${(item.product.price * item.quantity).toStringAsFixed(2)}'),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      if (item.quantity > 1) {
                        cartProvider.decreaseQuantity(item.product);
                      }
                    },
                  ),
                  Text(item.quantity.toString()),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      cartProvider.addToCart(item.product);
                    },
                  ),
                ],
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.remove_shopping_cart),
            onPressed: () => cartProvider.removeFromCart(item.product),
          ),
        );
      },
    );
  }
}
