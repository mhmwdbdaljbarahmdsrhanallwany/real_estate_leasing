import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // حالة التطبيق
  bool _isLoading = true;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _simulateAppStart();
  }

  // محاكاة بداية تشغيل التطبيق
  Future<void> _simulateAppStart() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isLoading = false;
      _isLoggedIn = false; // تغيير إلى true لرؤية الصفحة الرئيسية مباشرة
    });
  }

  // الصفحة المؤقتة للصفحة الرئيسية
  Widget _buildMainPage() {
    return Scaffold(
      appBar: AppBar(title: const Text('الصفحة الرئيسية')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.apartment_rounded,
              size: 80,
              color: Color(0xFF2563EB),
            ),
            const SizedBox(height: 20),
            const Text(
              'نظام إدارة التأجير العقاري',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _isLoggedIn ? 'مرحباً بك!' : 'جاري التحميل...',
              style: const TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isLoggedIn = !_isLoggedIn;
                });
              },
              child: Text(
                _isLoggedIn ? 'تسجيل الخروج' : 'تسجيل الدخول التجريبي',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // صفحة تسجيل الدخول المؤقتة
  Widget _buildLoginPage() {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // الشعار
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFF2563EB),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2563EB).withOpacity(0.2),
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

              // العنوان
              const Text(
                'مرحباً بعودتك!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF111827),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'سجل الدخول لإدارة عقاراتك',
                style: TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
              ),
              const SizedBox(height: 40),

              // حقل البريد الإلكتروني
              TextField(
                decoration: InputDecoration(
                  labelText: 'البريد الإلكتروني',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // حقل كلمة المرور
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility_off_outlined),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // زر تسجيل الدخول
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isLoggedIn = true;
                    });
                  },
                  child: const Text('تسجيل الدخول'),
                ),
              ),
              const SizedBox(height: 20),

              // روابط إضافية
              TextButton(
                onPressed: () {},
                child: const Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyle(color: Color(0xFF6B7280)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // عرض شاشة التحميل
    if (_isLoading) {
      return Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // الشعار المتحرك
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFF2563EB),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2563EB).withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.apartment_rounded,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),

              // مؤشر التحميل
              const CircularProgressIndicator(color: Color(0xFF2563EB)),
              const SizedBox(height: 20),

              // نص التحميل
              const Text(
                'جاري تهيئة النظام...',
                style: TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
              ),
            ],
          ),
        ),
      );
    }

    // اختيار الصفحة بناءً على حالة تسجيل الدخول
    return _isLoggedIn ? _buildMainPage() : _buildLoginPage();
  }
}
