import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/customer/customer_home_screen.dart';
import 'screens/customer/cart_screen.dart';
import 'screens/admin/admin_orders_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const home = '/home';
  static const cart = '/cart';
  static const admin = '/admin';

  static Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    home: (_) => const CustomerHomeScreen(),
    //cart: (_) => const CartScreen(),
    admin: (_) => const AdminOrdersScreen(),
  };
}
