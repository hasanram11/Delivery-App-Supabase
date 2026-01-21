import 'package:flutter/material.dart';
import '../../routes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Change Store (Option 1)
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.storeCode,
              (route) => false,
            );
          },
          child: const Text('Change Store'),
        ),
      ),
    );
  }
}
