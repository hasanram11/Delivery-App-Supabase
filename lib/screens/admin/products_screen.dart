import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import '../../services/product_service.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  final ProductService _productService = ProductService();
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = _productService.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
      ),

      body: FutureBuilder<List<Product>>(
        future: products,
        builder: (context, snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }

          final items = snapshot.data!;

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {

              final product = items[index];

              return ListTile(
                leading: product.imageUrl.isNotEmpty
                    ? Image.network(product.imageUrl,width:50)
                    : const Icon(Icons.fastfood),

                title: Text(product.name),

                subtitle: Text(product.category),

                trailing: Text("\$${product.price}"),
              );
            },
          );
        },
      ),
    );
  }
}