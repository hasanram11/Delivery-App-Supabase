import 'package:delivery/services/auth_service.dart';
import 'package:flutter/material.dart';
import '../../services/auth_service.dart';


class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => AuthService().logout(),
          ),
        ],
      ),
      body: const Center(child: Text('Product List')),
    );
  }
}
