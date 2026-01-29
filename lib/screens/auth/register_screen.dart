import 'package:delivery/services/auth_service.dart';
import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../widgets/auth_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final auth = AuthService();
  String role = 'customer';
  bool loading = false;

  Future<void> register() async {
    setState(() => loading = true);
    try {
      await auth.register(
        email: emailCtrl.text,
        password: passCtrl.text,
        role: role,
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AuthTextField(controller: emailCtrl, label: 'Email'),
            const SizedBox(height: 12),
            AuthTextField(
              controller: passCtrl,
              label: 'Password',
              obscure: true,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField(
              value: role,
              items: const [
                DropdownMenuItem(
                  value: 'customer',
                  child: Text('Customer'),
                ),
                DropdownMenuItem(
                  value: 'admin',
                  child: Text('Admin'),
                ),
              ],
              onChanged: (value) => role = value!,
              decoration: const InputDecoration(
                labelText: 'Account Type',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: loading ? null : register,
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
