import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/product_model.dart';

class ProductService {
  final _client = Supabase.instance.client;

  Future<List<Product>> getProducts() async {
    final data = await _client
        .from('products')
        .select()
        .eq('is_available', true)
        .order('name');

    return (data as List)
        .map((e) => Product.fromJson(e))
        .toList();
  }
}
