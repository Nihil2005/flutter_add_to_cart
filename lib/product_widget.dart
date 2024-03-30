import 'package:flutter/material.dart';
import 'product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final Function(Product) addToCart;

  ProductWidget({required this.product, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(product.imageUrl),
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: Icon(Icons.add_shopping_cart),
        onPressed: () => addToCart(product),
      ),
    );
  }
}
