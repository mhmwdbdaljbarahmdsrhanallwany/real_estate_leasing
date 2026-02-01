import 'package:flutter/material.dart';

import 'app/app.dart';

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

      // تصميم الثيم
      theme: ThemeData(
        useMaterial3: true,

        // الألوان
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF2563EB),
          // أزرق
          secondary: const Color(0xFF10B981),
          // أخضر
          surface: const Color(0xFFFFFFFF),
          // خلفية
          background: const Color(0xFFF9FAFB),
          // خلفية الصفحة
          error: const Color(0xFFEF4444), // أحمر للأخطاء
        ),

        // الخطوط
        fontFamily: 'Cairo',
        // خط عربي

        // تصميم AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xFF111827),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        // تصميم الأزرار
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2563EB),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        // تصميم حقول الإدخال
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFF9FAFB),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFE5E7EB), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF2563EB), width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          labelStyle: const TextStyle(color: Color(0xFF6B7280)),
          hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
        ),
      ),

      // الصفحة الرئيسية
      home: const App(),
    );
  }
}
