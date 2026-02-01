import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class SideMenu extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const SideMenu({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final List<MenuSection> _menuSections = [
    MenuSection(
      title: 'الرئيسية',
      items: [
        MenuItem(
          icon: Icons.dashboard_outlined,
          label: 'لوحة التحكم',
          index: 0,
          isActive: true,
        ),
        MenuItem(
          icon: Icons.notifications_outlined,
          label: 'الإشعارات',
          index: 1,
          notificationCount: 3,
        ),
        MenuItem(icon: Icons.analytics_outlined, label: 'التقارير', index: 2),
      ],
    ),
    MenuSection(
      title: 'الإدارة',
      items: [
        MenuItem(icon: Icons.business_outlined, label: 'المؤسسات', index: 3),
        MenuItem(icon: Icons.group_outlined, label: 'الملاك', index: 4),
        MenuItem(icon: Icons.apartment_outlined, label: 'العمارات', index: 5),
        MenuItem(icon: Icons.home_work_outlined, label: 'الوحدات', index: 6),
      ],
    ),
    MenuSection(
      title: 'المستأجرين',
      items: [
        MenuItem(icon: Icons.group_outlined, label: 'المستأجرين', index: 7),
        MenuItem(icon: Icons.assignment_outlined, label: 'العقود', index: 8),
        MenuItem(icon: Icons.payment_outlined, label: 'المدفوعات', index: 9),
        MenuItem(icon: Icons.security_outlined, label: 'التأمينات', index: 10),
      ],
    ),
    MenuSection(
      title: 'الإعدادات',
      items: [
        MenuItem(icon: Icons.settings_outlined, label: 'الإعدادات', index: 11),
        MenuItem(icon: Icons.help_outline, label: 'المساعدة', index: 12),
        MenuItem(
          icon: Icons.logout_outlined,
          label: 'تسجيل الخروج',
          index: 13,
          isLogout: true,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: AppColors.sideMenuBg,
        border: const Border(
          right: BorderSide(color: AppColors.border, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // رأس القائمة
          _buildHeader(),

          // قائمة التنقل
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              children: [
                for (var section in _menuSections) ...[
                  _buildSectionTitle(section.title),
                  ..._buildSectionItems(section.items),
                  const SizedBox(height: 20),
                ],
              ],
            ),
          ),

          // تذييل القائمة
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: const Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Row(
        children: [
          // شعار المؤسسة
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.apartment_rounded,
              size: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),

          // معلومات المؤسسة
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'العقارية المتحدة',
                  style: AppTextStyles.h4.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  'نشطة',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Text(title, style: AppTextStyles.menuTitle),
    );
  }

  List<Widget> _buildSectionItems(List<MenuItem> items) {
    return items.map((item) {
      final isSelected = widget.selectedIndex == item.index;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Material(
          color: isSelected ? AppColors.menuItemActive : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: () => widget.onItemSelected(item.index),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // الأيقونة
                  Icon(
                    item.icon,
                    size: 20,
                    color: isSelected
                        ? AppColors.primary
                        : item.isLogout
                        ? AppColors.error
                        : AppColors.iconPrimary,
                  ),
                  const SizedBox(width: 12),

                  // النص
                  Expanded(
                    child: Text(
                      item.label,
                      style: isSelected
                          ? AppTextStyles.menuItemActive
                          : item.isLogout
                          ? AppTextStyles.menuItem.copyWith(
                              color: AppColors.error,
                            )
                          : AppTextStyles.menuItem,
                    ),
                  ),

                  // العداد (إن وجد)
                  if (item.notificationCount != null &&
                      item.notificationCount! > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.error,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        item.notificationCount! > 9
                            ? '9+'
                            : item.notificationCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: const Border(
          top: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Column(
        children: [
          // معلومات النظام
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('الإصدار 1.0.0', style: AppTextStyles.caption),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'نشط',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.success,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // مؤشر حالة النظام
          LinearProgressIndicator(
            value: 0.75,
            backgroundColor: AppColors.border,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.success),
            borderRadius: BorderRadius.circular(3),
          ),
          const SizedBox(height: 8),

          Text('75% من مساحة النظام مستخدمة', style: AppTextStyles.caption),
        ],
      ),
    );
  }
}

class MenuSection {
  final String title;
  final List<MenuItem> items;

  MenuSection({required this.title, required this.items});
}

class MenuItem {
  final IconData icon;
  final String label;
  final int index;
  final bool isActive;
  final int? notificationCount;
  final bool isLogout;

  const MenuItem({
    required this.icon,
    required this.label,
    required this.index,
    this.isActive = false,
    this.notificationCount,
    this.isLogout = false,
  });
}
