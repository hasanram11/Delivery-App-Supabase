import '../services/supabase_service.dart';
import '../models/cart_item_model.dart';

class OrderService {
  static Future<void> createOrder(
      String name,
      String phone,
      String address,
      double total,
      List<CartItem> items) async {

    final order = await SupabaseService.client
        .from('delivery_orders')
        .insert({
          'customer_name': name,
          'phone': phone,
          'address': address,
          'total': total,
        })
        .select()
        .single();

    for (final i in items) {
      await SupabaseService.client
          .from('delivery_order_items')
          .insert({
            'order_id': order['id'],
            'product_id': i.product.id,
            'qty': i.qty,
            'price': i.product.price,
          });
    }
  }
}
