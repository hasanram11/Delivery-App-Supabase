import 'package:flutter/material.dart';
import '../../routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    });

    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
