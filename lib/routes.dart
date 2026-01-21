import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/store_code/store_code_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/customer/customer_home_screen.dart';
import 'screens/admin/admin_home_screen.dart';
import 'screens/settings/settings_screen.dart';

class AppRoutes {
  static const splash = '/splash';
  static const storeCode = '/store-code';
  static const login = '/login';
  static const register = '/register';
  static const customerHome = '/customer-home';
  static const adminHome = '/admin-home';
  static const settings = '/settings';

  static Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    storeCode: (_) => const StoreCodeScreen(),
    login: (_) => const LoginScreen(),
    register: (_) => const RegisterScreen(),
    customerHome: (_) => const CustomerHomeScreen(),
    adminHome: (_) => const AdminHomeScreen(),
    settings: (_) => const SettingsScreen(),
  };
}
