// lib/main.dart
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/routes.dart';
import 'screens/profile/profile_screen.dart'; // أضف استيراد الصفحة

void main() {
  runApp(const RentalManagementApp());
}

class RentalManagementApp extends StatelessWidget {
  const RentalManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'نظام إدارة التأجير',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.blue),
      home: const App(),
      // أضف routes هنا
      routes: {AppRoutes.profile: (context) => const ProfileScreen()},
    );
  }
}
