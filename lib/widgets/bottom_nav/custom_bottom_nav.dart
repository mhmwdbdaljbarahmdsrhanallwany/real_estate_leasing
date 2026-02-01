import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class CustomBottomNav extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTabChanged;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTabChanged,
  });

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  final List<BottomNavItem> _navItems = const [
    BottomNavItem(
      icon: Icons.dashboard_outlined,
      activeIcon: Icons.dashboard_rounded,
      label: 'الرئيسية',
      index: 0,
    ),
    BottomNavItem(
      icon: Icons.apartment_outlined,
      activeIcon: Icons.apartment_rounded,
      label: 'العمارات',
      index: 1,
    ),
    BottomNavItem(
      icon: Icons.add_circle_outline,
      activeIcon: Icons.add_circle_rounded,
      label: 'إضافة',
      index: 2,
      isCenter: true,
    ),
    BottomNavItem(
      icon: Icons.group_outlined,
      activeIcon: Icons.group_rounded,
      label: 'المستأجرين',
      index: 3,
    ),
    BottomNavItem(
      icon: Icons.payment_outlined,
      activeIcon: Icons.payment_rounded,
      label: 'المدفوعات',
      index: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _navItems.map((item) {
          return _buildNavItem(item);
        }).toList(),
      ),
    );
  }

  Widget _buildNavItem(BottomNavItem item) {
    final isActive = widget.currentIndex == item.index;

    if (item.isCenter) {
      return _buildCenterButton(item);
    }

    return GestureDetector(
      onTap: () => widget.onTabChanged(item.index),
      child: Container(
        width: 70,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // الأيقونة
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.primary.withOpacity(0.1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                isActive ? item.activeIcon : item.icon,
                size: 22,
                color: isActive ? AppColors.primary : AppColors.iconPrimary,
              ),
            ),
            const SizedBox(height: 4),

            // النص
            Text(
              item.label,
              style: AppTextStyles.caption.copyWith(
                color: isActive ? AppColors.primary : AppColors.textLight,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterButton(BottomNavItem item) {
    return GestureDetector(
      onTap: () => widget.onTabChanged(item.index),
      child: Container(
        width: 70,
        height: 70,
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // زر الإضافة المميز
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.gradientStart, AppColors.gradientEnd],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Icon(
                Icons.add_rounded,
                size: 28,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final int index;
  final bool isCenter;

  const BottomNavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.index,
    this.isCenter = false,
  });
}
