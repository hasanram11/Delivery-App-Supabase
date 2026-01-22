import 'package:flutter/material.dart';
import '../../routes.dart';

class AdminProductsScreen extends StatelessWidget {
  const AdminProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addProduct);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.fastfood),
              title: const Text('Burger'),
              subtitle: const Text('\$5.99'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.addProduct);
                    },
                  ),
                  IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
