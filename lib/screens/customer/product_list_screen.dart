import 'package:flutter/material.dart';
import '../../services/product_service.dart';
import '../../models/product_model.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final service = ProductService();

    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: StreamBuilder<List<ProductModel>>(
        stream: service.getProducts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final products = snapshot.data!;
          if (products.isEmpty) {
            return const Center(child: Text('No products yet'));
          }

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (_, i) {
              final p = products[i];
              return Card(
                margin: const EdgeInsets.all(12),
                child: ListTile(
                  leading: Image.network(
                    p.imageUrl,
                    width: 56,
                    errorBuilder: (_, __, ___) => const Icon(Icons.image),
                  ),
                  title: Text(p.name),
                  subtitle: Text('\$${p.price.toStringAsFixed(2)}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
