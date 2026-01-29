import 'package:delivery/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import '../../services/order_service.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required List<Product> cart});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        children: [
          ...cart.items.map((e) =>
              ListTile(title: Text('${e.product.name} x${e.qty}'))),
          Text('Total: \$${cart.total}'),
          ElevatedButton(
            child: const Text('Place Order'),
            onPressed: () async {
              await OrderService.createOrder(
                'Customer',
                '000000',
                'Address',
                cart.total,
                cart.items,
              );
              cart.clear();
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
