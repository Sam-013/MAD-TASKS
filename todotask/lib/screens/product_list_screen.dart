import 'package:todos/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todos/product.dart';
import 'package:todos/provider/cart_provider.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(id: 1, name: 'Product 1', price: 10.0),
    Product(id: 2, name: 'Product 2', price: 20.0),
    Product(id: 3, name: 'Product 3', price: 30.0),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List'), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            );
          },
        ),
      ]),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Product Added')));
                context.read<CartProvider>().addToCart(product);
              },
            ),
          );
        },
      ),
    );
  }
}
