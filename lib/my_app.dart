import 'package:flutter/material.dart';
import 'package:test_application/Pages/home_page.dart';

/// This is the Main app Class, We will set all configuration of the app here
class MyApp extends StatelessWidget {
  /// Constructor of the myApp to set the key of the super class
  /// which is stateless widget
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
