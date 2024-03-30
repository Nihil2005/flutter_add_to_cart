import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'cart_widget.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        children: [
          Expanded(
            child: CartWidget(),
          ),
          _buildShippingForm(),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ))),
            onPressed: () {
              _placeOrder(context, cartProvider);
            },
            child: Text('Place Order'),
          ),
        ],
      ),
    );
  }

  Widget _buildShippingForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shipping Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
          ),
          SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(labelText: 'Address'),
          ),
          SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(labelText: 'City'),
          ),
          SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(labelText: 'Zip Code'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  void _placeOrder(BuildContext context, CartProvider cartProvider) {
    // Simulate placing order
    // Here you can add the logic to send order details to your server/database
    cartProvider.clearCart();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Order Placed!'),
      duration: Duration(seconds: 2),
    ));
  }
}
