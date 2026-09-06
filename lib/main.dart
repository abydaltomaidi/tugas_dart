import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantApp());
}

//class RestaurantApp
class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Detail',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE85D04)),
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
      ),
      home: const RestaurantDetailPage(),
    );
  }
}
