import 'package:flutter/material.dart';

class AddEditProductScreen extends StatelessWidget {
  const AddEditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            Container(
              height: 150,
              color: Colors.grey.shade200,
              child: const Center(
                child: Icon(Icons.image, size: 60),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              value: true,
              onChanged: (v) {},
              title: const Text('Available'),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () {},
              child: const Text('Save Product'),
            )
          ],
        ),
      ),
    );
  }
}
