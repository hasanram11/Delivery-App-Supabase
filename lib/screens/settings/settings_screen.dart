import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../../routes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: FilledButton(
          onPressed: () async {
            await authService.logout();
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.login,
              (_) => false,
            );
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
