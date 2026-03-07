import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartItem {

  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

}

class CartProvider extends ChangeNotifier {

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(Product product){

    final index =
        _items.indexWhere((item) => item.product.id == product.id);

    if(index >= 0){
      _items[index].quantity++;
    }else{
      _items.add(CartItem(product: product));
    }

    notifyListeners();
  }

  void increaseQty(Product product){

    final item =
        _items.firstWhere((item) => item.product.id == product.id);

    item.quantity++;

    notifyListeners();
  }

  void decreaseQty(Product product){

    final item =
        _items.firstWhere((item) => item.product.id == product.id);

    if(item.quantity > 1){
      item.quantity--;
    }else{
      _items.remove(item);
    }

    notifyListeners();
  }

  void clearCart(){

    _items.clear();

    notifyListeners();
  }

  double get totalPrice {

    double total = 0;

    for(final item in _items){
      total += item.product.price * item.quantity;
    }

    return total;
  }

}