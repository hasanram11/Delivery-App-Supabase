import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';

import 'providers/cart_provider.dart';
import 'routes.dart';
import 'core/config/app_config.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://hrpnzwqjelqqgzovmjdv.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhycG56d3FqZWxxcWd6b3ZtamR2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1ODY5NjcsImV4cCI6MjA4NTE2Mjk2N30.cajwn0VaYgO7WYB_q4B0bkfmTY8FIibizkTsD665j30',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Delivery App',

        theme: AppTheme.lightTheme,

        initialRoute: '/login',
        routes: appRoutes,
      ),
    );
  }
}