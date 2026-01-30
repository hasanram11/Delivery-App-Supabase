import 'package:flutter/material.dart';

import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/admin/admin_home_screen.dart';
import 'screens/customer/customer_home_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/login': (_) => const LoginScreen(),
  '/register': (_) => const RegisterScreen(),
  '/admin-home': (_) => const AdminHomeScreen(),
  '/customer-home': (_) => const CustomerHomeScreen(),
};
