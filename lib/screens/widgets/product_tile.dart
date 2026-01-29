import 'package:delivery/models/product_model.dart';
import 'package:delivery/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product_model.dart';
import '../../providers/cart_provider.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      trailing: ElevatedButton(
        child: Text('\$${product.price}'),
        onPressed: () =>
            context.read<CartProvider>().add(product),
      ),
    );
  }
}
