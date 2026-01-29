import 'package:flutter/material.dart';
import '../models/cart_item_model.dart';
import '../models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> items = [];

  void add(Product product) {
    final index =
        items.indexWhere((e) => e.product.id == product.id);
    if (index >= 0) {
      items[index].qty++;
    } else {
      items.add(CartItem(product, 1));
    }
    notifyListeners();
  }

  double get total =>
      items.fold(0, (s, e) => s + e.product.price * e.qty);

  void clear() {
    items.clear();
    notifyListeners();
  }
}
