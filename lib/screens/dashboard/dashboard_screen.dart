import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('لوحة التحكم')),
      body: const Center(
        child: Text(
          'لوحة التحكم - قيد التطوير',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
