import 'package:flutter/material.dart';

import 'screens/splash/splash_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/customer/customer_home_screen.dart';
import 'screens/admin/admin_home_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/customer/cart_screen.dart';
import 'screens/admin/admin_products_screen.dart';
import 'screens/admin/add_edit_product_screen.dart';

class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const customerHome = '/customer-home';
  static const adminHome = '/admin-home';
  static const settings = '/settings';
  static const cart = '/cart';
  static const adminProducts = '/admin-products';
  static const addProduct = '/add-product';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),
    customerHome: (context) => const CustomerHomeScreen(),
    adminHome: (context) => const AdminHomeScreen(),
    settings: (context) => const SettingsScreen(),
    cart: (context) => const CartScreen(),
    adminProducts: (context) => const AdminProductsScreen(),
    addProduct: (context) => const AddEditProductScreen(),
  };
}
