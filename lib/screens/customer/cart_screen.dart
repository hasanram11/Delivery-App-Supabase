import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.fastfood),
                    title: const Text('Burger'),
                    subtitle: const Text('Quantity: 1'),
                    trailing: const Text('\$5.99'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: const Text('Checkout - \$5.99'),
            ),
          ),
        ],
      ),
    );
  }
}
