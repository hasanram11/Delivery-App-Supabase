import 'package:flutter/material.dart';
import '../../services/supabase_service.dart';

class AdminOrdersScreen extends StatelessWidget {
  const AdminOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: FutureBuilder(
        future: SupabaseService.client
            .from('delivery_orders')
            .select()
            .order('created_at', ascending: false),
        builder: (_, snap) {
          if (!snap.hasData) return const CircularProgressIndicator();
          final orders = snap.data!;
          return ListView(
            children: orders.map<Widget>((o) =>
              ListTile(
                title: Text(o['customer_name']),
                subtitle: Text(o['status']),
              ),
            ).toList(),
          );
        },
      ),
    );
  }
}
