import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final VoidCallback? onMenuPressed;
  final bool showNotification;
  final int notificationCount;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.actions,
    this.onMenuPressed,
    this.showNotification = false,
    this.notificationCount = 0,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.appBarBg,
        boxShadow: [
          BoxShadow(
            color: AppColors.appBarShadow,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        border: const Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            // القسم الأيسر: زر القائمة واسم التطبيق
            Expanded(
              child: Row(
                children: [
                  // زر القائمة أو الرجوع
                  _buildLeadingButton(context),
                  const SizedBox(width: 16),

                  // شعار التطبيق
                  _buildAppLogo(),
                  const SizedBox(width: 12),

                  // العنوان
                  _buildTitle(),
                ],
              ),
            ),

            // القسم الأيمن: الإجراءات
            Row(
              children: [
                // زر الإشعارات
                if (showNotification) _buildNotificationButton(),

                // الأزرار الإضافية
                if (actions != null) ...actions!,

                // صورة المستخدم
                _buildUserProfile(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeadingButton(BuildContext context) {
    if (showBackButton) {
      return IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.arrow_back_rounded,
            size: 20,
            color: AppColors.textPrimary,
          ),
        ),
      );
    }

    return IconButton(
      onPressed: onMenuPressed,
      icon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.menu_rounded,
          size: 20,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildAppLogo() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(Icons.apartment_rounded, size: 20, color: Colors.white),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: AppTextStyles.h3),
        Text('نظام إدارة التأجير', style: AppTextStyles.caption),
      ],
    );
  }

  Widget _buildNotificationButton() {
    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.notifications_outlined,
              size: 20,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        if (notificationCount > 0)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.error,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
              child: Text(
                notificationCount > 9 ? '9+' : notificationCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildUserProfile() {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: GestureDetector(
        onTap: () {},
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
}
