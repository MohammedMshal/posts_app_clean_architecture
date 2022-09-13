import 'package:flutter/material.dart';
import 'package:postes_app_clean_architecture/config/routes/app_routes.dart';
import 'package:postes_app_clean_architecture/core/utils/app_string.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appTitle,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      home: Scaffold(
        appBar: AppBar(title: const Text(AppString.appTitle)),
        body: const Center(child: Text('Hello World')),
      ),
    );
  }
}
