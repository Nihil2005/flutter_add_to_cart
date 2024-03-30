import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product.dart';
import 'product_widget.dart';
import 'cart_provider.dart';
import 'cart_screen.dart';
import './Checkout Screen.dart'; // Import the CheckoutScreen

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        initialRoute: '/', // Set initial route
        routes: {
          '/': (context) => MyHomePage(), // Home page
          '/cart': (context) => CartScreen(), // Cart screen
          '/checkout': (context) => CheckoutScreen(), // Checkout screen
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter eCommerce'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ProductWidget(
                  product: Product(
                    id: 1,
                    name: 'Product 1',
                    price: 10.0,
                    imageUrl:
                        'https://images.unsplash.com/photo-1580052614034-c55d20bfee3b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8b3JhbmdlfGVufDB8fDB8fHww',
                  ),
                  addToCart: (product) =>
                      Provider.of<CartProvider>(context, listen: false)
                          .addToCart(product),
                ),
                ProductWidget(
                  product: Product(
                    id: 2,
                    name: 'Product 2',
                    price: 20.0,
                    imageUrl:
                        'https://images.unsplash.com/photo-1589217157232-464b505b197f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YXBwbGV8ZW58MHx8MHx8fDA%3D',
                  ),
                  addToCart: (product) =>
                      Provider.of<CartProvider>(context, listen: false)
                          .addToCart(product),
                ),
              ],
            ),
          ),
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) => Text(
              'Total: \$${cartProvider.totalSum.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart'); // Navigate to cart screen
            },
            child: Text('View Cart'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                  context, '/checkout'); // Navigate to checkout screen
            },
            child: Text('Proceed to Checkout'),
          ),
        ],
      ),
    );
  }
}
