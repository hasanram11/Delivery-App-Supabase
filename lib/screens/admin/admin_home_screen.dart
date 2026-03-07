import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import 'products_screen.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        actions: [

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

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Card(
              child: ListTile(
                leading: const Icon(Icons.inventory),
                title: const Text("Products"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProductsScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            Card(
              child: ListTile(
                leading: const Icon(Icons.receipt_long),
                title: const Text("Orders"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),

          ],
        ),
      ),
    );
  }
}