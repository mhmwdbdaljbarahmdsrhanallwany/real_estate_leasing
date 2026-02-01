import 'package:flutter/material.dart';

import '../screens/dashboard/dashboard_screen.dart';
import '../utils/colors.dart'; // تأكد من هذا المسار

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool _isLoading = true;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _simulateAppStart();
  }

  Future<void> _simulateAppStart() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
      _isLoggedIn = true;
    });
  }

  Widget _buildSplashScreen() {
    return Scaffold(
      backgroundColor: AppColors.surfaceDark, // تأكد من وجود هذا اللون
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // الشعار المتحرك
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.gradientStart, AppColors.gradientEnd],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Icon(
                Icons.apartment_rounded,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),

            // النص
            const Text(
              'نظام إدارة التأجير',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'الإصدار 1.0.0',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
            const SizedBox(height: 30),

            // مؤشر التحميل
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return _buildSplashScreen();
    }

    return const DashboardScreen(); // بسيط
  }
}
