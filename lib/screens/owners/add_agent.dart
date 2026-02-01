import 'package:flutter/material.dart';

class AddAgentScreen extends StatelessWidget {
  const AddAgentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة وكيل جديد'),
        actions: [IconButton(icon: const Icon(Icons.save), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // معلومات المالك
            _buildOwnerCard(),
            const SizedBox(height: 20),

            // معلومات الوكيل
            _buildAgentForm(),
            const SizedBox(height: 30),

            // أزرار الحفظ
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildOwnerCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF7C3AED).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.person,
                size: 24,
                color: Color(0xFF7C3AED),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'محمد أحمد',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'مالك - ٥ عقارات',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgentForm() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'معلومات الوكيل',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // حقل الاسم
            _buildFormField(
              label: 'الاسم الكامل',
              hintText: 'أدخل اسم الوكيل',
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: 16),

            // حقل رقم الهاتف
            _buildFormField(
              label: 'رقم الهاتف',
              hintText: 'أدخل رقم الهاتف',
              prefixIcon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),

            // حقل البريد الإلكتروني
            _buildFormField(
              label: 'البريد الإلكتروني',
              hintText: 'أدخل البريد الإلكتروني',
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            // حقل الدور
            _buildDropdownField(
              label: 'الدور',
              items: ['إداري', 'قانوني', 'مالي'],
              hintText: 'اختر دور الوكيل',
            ),
            const SizedBox(height: 16),

            // حقل العلاقة
            _buildFormField(
              label: 'العلاقة',
              hintText: 'أدخل علاقة الوكيل بالمالك',
              prefixIcon: Icons.link,
            ),
            const SizedBox(height: 16),

            // حقل الملاحظات
            _buildFormField(
              label: 'ملاحظات',
              hintText: 'أضف ملاحظات إضافية',
              prefixIcon: Icons.note,
              maxLines: 3,
            ),
            const SizedBox(height: 16),

            // حالة الوكيل
            Row(
              children: [
                const Text(
                  'حالة الوكيل: ',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Switch(value: true, onChanged: (value) {}),
                const Text('نشط'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required String hintText,
    required IconData prefixIcon,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(prefixIcon, color: Colors.grey[600]),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                  keyboardType: keyboardType,
                  maxLines: maxLines,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required List<String> items,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
              ),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: null,
                    items: items.map((item) {
                      return DropdownMenuItem(value: item, child: Text(item));
                    }).toList(),
                    onChanged: (value) {},
                    hint: Text(
                      hintText,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    isExpanded: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF7C3AED),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'إضافة الوكيل',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
