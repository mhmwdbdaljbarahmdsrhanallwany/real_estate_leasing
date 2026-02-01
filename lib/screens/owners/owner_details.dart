import 'package:flutter/material.dart';

class OwnerDetailsScreen extends StatelessWidget {
  const OwnerDetailsScreen({super.key});

  // بيانات المالك الثابتة
  static const Map<String, dynamic> owner = {
    'id': 1,
    'name': 'محمد أحمد',
    'phone': '+966501234567',
    'email': 'mohamed@example.com',
    'address': 'الرياض - حي النخيل - شارع الملك فهد',
    'idNumber': '١٠٨٧٦٥٤٣٢١',
    'properties': 5,
    'status': 'نشط',
    'joinDate': '٢٠٢٣-٠١-١٥',
    'totalRevenue': '٤٥٠,٠٠٠ ر.س',
  };

  // قائمة العقارات التجريبية
  static const List<Map<String, dynamic>> properties = [
    {
      'id': 1,
      'name': 'عمارة النخيل',
      'address': 'الرياض - حي النخيل',
      'units': 12,
      'occupied': 8,
      'revenue': '١٥٠,٠٠٠ ر.س',
    },
    {
      'id': 2,
      'name': 'برج الرياض',
      'address': 'الرياض - حي العليا',
      'units': 20,
      'occupied': 15,
      'revenue': '٢٥٠,٠٠٠ ر.س',
    },
    {
      'id': 3,
      'name': 'مجمع الروضة',
      'address': 'الرياض - حي الروضة',
      'units': 8,
      'occupied': 6,
      'revenue': '٨٠,٠٠٠ ر.س',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تفاصيل المالك'),
          actions: [
            IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
            IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'نظرة عامة'),
              Tab(text: 'العقارات'),
              Tab(text: 'العقود'),
              Tab(text: 'المدفوعات'),
            ],
            labelColor: Color(0xFF7C3AED),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFF7C3AED),
          ),
        ),
        body: TabBarView(
          children: [
            // تبويب النظرة العامة
            _buildOverviewTab(),
            // تبويب العقارات
            _buildPropertiesTab(),
            // تبويب العقود
            _buildContractsTab(),
            // تبويب المدفوعات
            _buildPaymentsTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // بطاقة معلومات المالك
          _buildOwnerInfoCard(),
          const SizedBox(height: 20),

          // الإحصائيات
          _buildStatsGrid(),
          const SizedBox(height: 20),

          // العقارات الأخيرة
          _buildRecentProperties(),
        ],
      ),
    );
  }

  Widget _buildOwnerInfoCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // صورة المالك
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFF7C3AED).withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF7C3AED), width: 3),
              ),
              child: const Icon(
                Icons.person,
                size: 50,
                color: Color(0xFF7C3AED),
              ),
            ),
            const SizedBox(height: 20),

            // الاسم والمعلومات
            Text(
              owner['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                owner['status'],
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // معلومات الاتصال
            _buildInfoRow(Icons.phone, 'الهاتف', owner['phone']),
            _buildInfoRow(Icons.email, 'البريد الإلكتروني', owner['email']),
            _buildInfoRow(Icons.location_on, 'العنوان', owner['address']),
            _buildInfoRow(Icons.badge, 'رقم الهوية', owner['idNumber']),
            _buildInfoRow(
              Icons.calendar_today,
              'تاريخ الانضمام',
              owner['joinDate'],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF7C3AED).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF7C3AED), size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.3,
      children: [
        _buildStatCard(
          'إجمالي العقارات',
          '${owner['properties']}',
          Icons.apartment,
          Colors.blue,
        ),
        _buildStatCard(
          'إجمالي الإيرادات',
          owner['totalRevenue'],
          Icons.attach_money,
          Colors.green,
        ),
        _buildStatCard('العقود النشطة', '٨', Icons.assignment, Colors.orange),
        _buildStatCard('المدفوعات', '٣٢', Icons.payment, Colors.purple),
      ],
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(fontSize: 12, color: color.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentProperties() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'العقارات الأخيرة',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...properties.map((property) => _buildPropertyCard(property)).toList(),
      ],
    );
  }

  Widget _buildPropertyCard(Map<String, dynamic> property) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.apartment, color: Colors.blue, size: 30),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    property['address'],
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildPropertyInfo(
                        '${property['units']} وحدات',
                        Icons.home,
                      ),
                      const SizedBox(width: 12),
                      _buildPropertyInfo(
                        '${property['occupied']} مشغولة',
                        Icons.check_circle,
                      ),
                      const SizedBox(width: 12),
                      _buildPropertyInfo(
                        property['revenue'],
                        Icons.attach_money,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chevron_right, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyInfo(String text, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.blue),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 12, color: Colors.blue)),
      ],
    );
  }

  Widget _buildPropertiesTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: properties.length,
      itemBuilder: (context, index) => _buildPropertyCard(properties[index]),
    );
  }

  Widget _buildContractsTab() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.assignment, size: 80, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            'قائمة العقود',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentsTab() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.payment, size: 80, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            'سجل المدفوعات',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
