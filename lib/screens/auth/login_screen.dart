import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../../routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authService = AuthService();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  Future<void> _login() async {
    final role = await _authService.login(
      email: emailCtrl.text,
      password: passwordCtrl.text,
    );

    if (role == 'admin') {
      Navigator.pushReplacementNamed(context, AppRoutes.adminHome);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.customerHome);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 16),
            TextField(
              controller: passwordCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 24),
            FilledButton(onPressed: _login, child: const Text('Login')),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.register);
              },
              child: const Text('Create account'),
            ),
          ],
        ),
      ),
    );
  }
}
