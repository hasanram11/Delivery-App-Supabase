import 'package:flutter/material.dart';
import 'routes.dart';
import 'core/config/app_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color(AppConfig.primaryColor),
        scaffoldBackgroundColor: Colors.grey.shade50,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
