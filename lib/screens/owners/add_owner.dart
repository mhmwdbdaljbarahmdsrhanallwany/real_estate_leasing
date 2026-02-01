import 'package:flutter/material.dart';

class AddOwnerScreen extends StatelessWidget {
  const AddOwnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة مالك جديد'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {},
            tooltip: 'حفظ',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بطاقة المعلومات الأساسية
            _buildBasicInfoCard(),
            const SizedBox(height: 20),

            // بطاقة معلومات الاتصال
            _buildContactInfoCard(),
            const SizedBox(height: 20),

            // بطاقة معلومات إضافية
            _buildAdditionalInfoCard(),
            const SizedBox(height: 30),

            // أزرار الحفظ والإلغاء
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicInfoCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.person_outline, color: Color(0xFF7C3AED)),
                SizedBox(width: 8),
                Text(
                  'المعلومات الأساسية',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // حقل الاسم الكامل
            _buildTextField(
              label: 'الاسم الكامل',
              hintText: 'أدخل الاسم الكامل',
              prefixIcon: Icons.person,
              isRequired: true,
            ),
            const SizedBox(height: 16),

            // حقل رقم الهوية
            _buildTextField(
              label: 'رقم الهوية',
              hintText: 'أدخل رقم الهوية',
              prefixIcon: Icons.badge,
              isRequired: true,
            ),
            const SizedBox(height: 16),

            // حقل تاريخ الميلاد
            _buildDateField(
              label: 'تاريخ الميلاد',
              hintText: 'اختر تاريخ الميلاد',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfoCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.contact_phone_outlined, color: Color(0xFF7C3AED)),
                SizedBox(width: 8),
                Text(
                  'معلومات الاتصال',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // حقل رقم الهاتف
            _buildTextField(
              label: 'رقم الهاتف',
              hintText: 'أدخل رقم الهاتف',
              prefixIcon: Icons.phone,
              keyboardType: TextInputType.phone,
              isRequired: true,
            ),
            const SizedBox(height: 16),

            // حقل البريد الإلكتروني
            _buildTextField(
              label: 'البريد الإلكتروني',
              hintText: 'أدخل البريد الإلكتروني',
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            // حقل العنوان
            _buildTextField(
              label: 'العنوان',
              hintText: 'أدخل العنوان الكامل',
              prefixIcon: Icons.location_on,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionalInfoCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.info_outline, color: Color(0xFF7C3AED)),
                SizedBox(width: 8),
                Text(
                  'معلومات إضافية',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // حقل الحالة
            _buildDropdownField(
              label: 'الحالة',
              items: ['نشط', 'غير نشط', 'معلق'],
              hintText: 'اختر الحالة',
            ),
            const SizedBox(height: 16),

            // حقل نوع المالك
            _buildDropdownField(
              label: 'نوع المالك',
              items: ['فرد', 'شركة', 'مؤسسة'],
              hintText: 'اختر نوع المالك',
            ),
            const SizedBox(height: 16),

            // حقل الملاحظات
            _buildTextField(
              label: 'ملاحظات',
              hintText: 'أضف ملاحظات إضافية',
              prefixIcon: Icons.note,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hintText,
    required IconData prefixIcon,
    bool isRequired = false,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            if (isRequired)
              const Text(' *', style: TextStyle(color: Colors.red)),
          ],
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

  Widget _buildDateField({required String label, required String hintText}) {
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
                child: Icon(Icons.calendar_today, color: Colors.grey[600]),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.calendar_month,
                  color: Color(0xFF7C3AED),
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

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
              foregroundColor: Colors.grey[800],
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('إلغاء'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7C3AED),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('حفظ المالك'),
          ),
        ),
      ],
    );
  }
}
