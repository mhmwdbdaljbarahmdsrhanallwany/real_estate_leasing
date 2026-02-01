import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showSideMenu = true;

  void _onMenuSelected(int index) {
    setState(() {
      _selectedMenuIndex = index;
    });
  }

  void _onNavTabChanged(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  void _toggleSideMenu() {
    setState(() {
      _showSideMenu = !_showSideMenu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: _getAppBarTitle(),
        onMenuPressed: _toggleSideMenu,
        showNotification: true,
        notificationCount: 5,
      ),
      drawer: _showSideMenu
          ? Drawer(
              width: 280,
              backgroundColor: Colors.transparent,
              child: SideMenu(
                selectedIndex: _selectedMenuIndex,
                onItemSelected: _onMenuSelected,
              ),
            )
          : null,
      body: Row(
        children: [
          // القائمة الجانبية (ثابتة)
          if (_showSideMenu)
            SideMenu(
              selectedIndex: _selectedMenuIndex,
              onItemSelected: _onMenuSelected,
            ),

          // المحتوى الرئيسي
          Expanded(
            child: Container(
              color: AppColors.background,
              child: _buildContent(),
            ),
          ),
        ],
      ),
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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الإحصائيات السريعة
          _buildStatsGrid(),
          const SizedBox(height: 30),

          // الرسم البياني
          _buildChartSection(),
          const SizedBox(height: 30),

          // آخر العمليات
          _buildRecentActivity(),
          const SizedBox(height: 30),

          // المهام القادمة
          _buildUpcomingTasks(),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border, width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الأيقونة
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 16),

          // القيمة
          Text(
            value,
            style: AppTextStyles.h2.copyWith(color: AppColors.textPrimary),
          ),
          const SizedBox(height: 8),

          // العنوان والتغيير
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  change,
                  style: AppTextStyles.caption.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('الإيرادات الشهرية', style: AppTextStyles.h3),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('آخر ٦ شهور', style: AppTextStyles.caption),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // محاكاة الرسم البياني
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bar_chart_rounded,
                    size: 60,
                    color: AppColors.primary.withOpacity(0.3),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'مخطط الإيرادات',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textLight,
                    ),
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
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('آخر الأنشطة', style: AppTextStyles.h3),
          const SizedBox(height: 20),

          // قائمة الأنشطة
          Column(
            children: [
              _buildActivityItem(
                icon: Icons.payment_rounded,
                title: 'دفعة جديدة',
                subtitle: 'عقد #٢٣٤ - محمد أحمد',
                time: 'منذ ١٠ دقائق',
                color: AppColors.success,
              ),
              _buildActivityItem(
                icon: Icons.assignment_ind_rounded,
                title: 'عقد جديد',
                subtitle: 'عمارة النخيل - شقة ٣٠١',
                time: 'منذ ساعتين',
                color: AppColors.primary,
              ),
              _buildActivityItem(
                icon: Icons.home_work_rounded,
                title: 'وحدة جديدة',
                subtitle: 'عمارة الرياض - الطابق ٤',
                time: 'منذ يوم',
                color: AppColors.warning,
              ),
              _buildActivityItem(
                icon: Icons.warning_rounded,
                title: 'تنبيه تأخير',
                subtitle: 'عقد #١٨٩ - سعيد خالد',
                time: 'منذ يومين',
                color: AppColors.error,
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
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: Row(
        children: [
          // الأيقونة
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: color),
          ),
          const SizedBox(width: 16),

          // النص
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),

          // الوقت
          Text(time, style: AppTextStyles.caption),
        ],
      ),
    );
  }

  Widget _buildUpcomingTasks() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('المهام القادمة', style: AppTextStyles.h3),
              TextButton(
                onPressed: () {},
                child: Text(
                  'عرض الكل',
                  style: AppTextStyles.button.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // قائمة المهام
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
              _buildTaskItem(
                title: 'اجتماع مع الملاك',
                date: 'الأحد - ١١:٠٠ ص',
                priority: 'منخفض',
                priorityColor: AppColors.success,
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
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: Row(
        children: [
          // مربع الاختيار
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.border, width: 2),
            ),
          ),
          const SizedBox(width: 16),

          // تفاصيل المهمة
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),

          // الأولوية
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: priorityColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              priority,
              style: AppTextStyles.caption.copyWith(
                color: priorityColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
