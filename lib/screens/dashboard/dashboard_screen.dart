import 'package:flutter/material.dart';

import '../../app/routes.dart';
import '../../utils/colors.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/bottom_nav/custom_bottom_nav.dart';
import '../../widgets/side_menu/side_menu.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedMenuIndex = 0;
  int _selectedNavIndex = 0;

  void _onMenuSelected(int index) {
    setState(() {
      _selectedMenuIndex = index;
    });
    // إغلاق Drawer بعد الاختيار
    Navigator.of(context).pop();
  }

  void _onNavTabChanged(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: _getAppBarTitle(),
        showNotification: true,
        notificationCount: 5,
      ),
      drawer: Drawer(
        width: 280,
        child: SideMenu(
          selectedIndex: _selectedMenuIndex,
          onItemSelected: _onMenuSelected,
        ),
      ),
      body: _buildContent(),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedNavIndex,
        onTabChanged: _onNavTabChanged,
      ),
    );
  }

  String _getAppBarTitle() {
    switch (_selectedMenuIndex) {
      case 0:
        return 'لوحة التحكم';
      case 1:
        return 'الإشعارات';
      case 2:
        return 'التقارير';
      case 3:
        return 'المؤسسات';
      case 4:
        return 'الملاك';
      case 5:
        return 'العمارات';
      case 6:
        return 'الوحدات';
      case 7:
        return 'المستأجرين';
      case 8:
        return 'العقود';
      case 9:
        return 'المدفوعات';
      case 10:
        return 'التأمينات';
      default:
        return 'لوحة التحكم';
    }
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الإحصائيات السريعة
          _buildStatsGrid(),
          const SizedBox(height: 20),

          // الرسم البياني
          _buildChartSection(),
          const SizedBox(height: 20),

          // آخر العمليات
          _buildRecentActivity(),
          const SizedBox(height: 20),

          // المهام القادمة
          _buildUpcomingTasks(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    return SizedBox(
      height: 230,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.5,
        children: [
          _buildStatCard(
            title: 'إجمالي الإيرادات',
            value: '٥٤,٢٠٠ ر.س',
            icon: Icons.trending_up_rounded,
            color: AppColors.success,
            change: '+12%',
          ),
          _buildStatCard(
            title: 'العقود النشطة',
            value: '٤٨',
            icon: Icons.assignment_rounded,
            color: AppColors.primary,
            change: '+5',
          ),
          _buildStatCard(
            title: 'الوحدات المشغولة',
            value: '٨٥%',
            icon: Icons.home_work_rounded,
            color: AppColors.warning,
            change: '+3%',
          ),
          _buildStatCard(
            title: 'المدفوعات المتأخرة',
            value: '٣',
            icon: Icons.schedule_rounded,
            color: AppColors.error,
            change: '-2',
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required String change,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 18),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  change,
                  style: TextStyle(
                    color: color,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'الإيرادات الشهرية',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'آخر ٦ شهور',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bar_chart_rounded,
                    size: 40,
                    color: AppColors.primary.withOpacity(0.3),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'مخطط الإيرادات',
                    style: TextStyle(color: AppColors.textLight, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivity() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'آخر الأنشطة',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              _buildActivityItem(
                icon: Icons.payment_rounded,
                title: 'دفعة جديدة',
                subtitle: 'عقد #٢٣٤',
                time: 'منذ ١٠ دقائق',
                color: AppColors.success,
              ),
              _buildActivityItem(
                icon: Icons.assignment_rounded,
                title: 'عقد جديد',
                subtitle: 'عمارة النخيل',
                time: 'منذ ساعتين',
                color: AppColors.primary,
              ),
              _buildActivityItem(
                icon: Icons.home_work_rounded,
                title: 'وحدة جديدة',
                subtitle: 'عمارة الرياض',
                time: 'منذ يوم',
                color: AppColors.warning,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.border.withOpacity(0.5),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, size: 16, color: color),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 10, color: AppColors.textLight),
                ),
              ],
            ),
          ),
          Text(time, style: TextStyle(fontSize: 4, color: AppColors.textLight)),
        ],
      ),
    );
  }

  // في CustomAppBar
  Widget _buildUserProfile() {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: GestureDetector(
        onTap: () {
          // الانتقال لصفحة الملف الشخصي
          Navigator.of(context).pushNamed(AppRoutes.profile);
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border, width: 1),
          ),
          child: const Icon(
            Icons.person_outline,
            size: 20,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingTasks() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'المهام القادمة',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'عرض الكل',
                  style: TextStyle(color: AppColors.primary, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              _buildTaskItem(
                title: 'تجديد عقد #١٥٦',
                date: 'غداً - ١٠:٠٠ ص',
                priority: 'عالي',
                priorityColor: AppColors.error,
              ),
              _buildTaskItem(
                title: 'فحص وحدة ٤٠١',
                date: 'بعد غد - ٠٢:٠٠ م',
                priority: 'متوسط',
                priorityColor: AppColors.warning,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTaskItem({
    required String title,
    required String date,
    required String priority,
    required Color priorityColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.border.withOpacity(0.5),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: AppColors.border, width: 1.5),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(fontSize: 10, color: AppColors.textLight),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: priorityColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Text(
              priority,
              style: TextStyle(
                color: priorityColor,
                fontSize: 9,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
