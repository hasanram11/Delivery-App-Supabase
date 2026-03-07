import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../services/product_service.dart';
import '../../services/auth_service.dart';
import '../../providers/cart_provider.dart';

import '../widgets/product_card.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {

  final ProductService _productService = ProductService();

  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = _productService.getProducts();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Menu"),

        actions: [

          /// CART BUTTON
          Consumer<CartProvider>(
            builder: (context, cart, child) {

              return Stack(
                children: [

                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                  ),

                  if(cart.items.isNotEmpty)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        cart.items.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )

                ],
              );
            },
          ),

          /// LOGOUT BUTTON
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {

              await AuthService().logout();

              if(context.mounted){
                Navigator.pushReplacementNamed(context, '/login');
              }

            },
          )

        ],
      ),

      body: FutureBuilder<List<Product>>(

        future: products,

        builder: (context, snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          final items = snapshot.data!;

          return GridView.builder(

            padding: const EdgeInsets.all(12),

            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,

            ),

            itemCount: items.length,

            itemBuilder: (context, index) {

              return ProductCard(
                product: items[index],
              );

            },

          );
        },
      ),
    );
  }
}