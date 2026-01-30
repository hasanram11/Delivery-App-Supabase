import 'package:delivery/screens/admin/admin_home_screen.dart';
import 'package:delivery/screens/auth/login_screen.dart';
import 'package:delivery/screens/customer/customer_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/auth/login_screen.dart';
import 'screens/admin/admin_home_screen.dart';
import 'screens/customer/customer_home_screen.dart';
import 'services/profile_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<AuthState>(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          final session = snapshot.data?.session;

          if (session == null) {
            return const LoginScreen();
          }

          return FutureBuilder<String>(
            future: ProfileService().getUserRole(),
            builder: (context, roleSnapshot) {
              if (!roleSnapshot.hasData) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }

              return roleSnapshot.data == 'admin'
                  ? const AdminHomeScreen()
                  : const CustomerHomeScreen();
            },
          );
        },
      ),
    );
  }
}
