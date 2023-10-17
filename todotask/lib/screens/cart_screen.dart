import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todos/provider/cart_provider.dart';
import '../product.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    final List<Product> cartItems = cartProvider.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          return ListTile(
            title: Text(cartItem.name),
            subtitle: Text('Quantity: ${cartItem.quantity}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                context.read<CartProvider>().removeFromCart(cartItem);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Total: \$${cartProvider.totalCost.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Navigate back to ProductListScreen
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
