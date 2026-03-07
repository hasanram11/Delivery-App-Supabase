import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/product_model.dart';

class ProductService {

  final supabase = Supabase.instance.client;

  Future<List<Product>> getProducts() async {

    final response = await supabase
        .from('products')
        .select()
        .eq('available', true)
        .order('name');

    return (response as List)
        .map((product) => Product.fromMap(product))
        .toList();
  }

  Future<List<Product>> getAllProducts() async {

    final response = await supabase
        .from('products')
        .select()
        .order('name');

    return (response as List)
        .map((product) => Product.fromMap(product))
        .toList();
  }

}