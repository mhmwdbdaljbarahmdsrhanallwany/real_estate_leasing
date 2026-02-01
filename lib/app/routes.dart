// ملف إدارة مسارات التطبيق
// يحتوي على تعريفات جميع المسارات في التطبيق

import 'package:flutter/cupertino.dart';

class AppRoutes {
  // المسارات الرئيسية
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String dashboard = '/dashboard';
  static const String forgotPassword = '/forgot-password';

  // مسارات لوحة التحكم
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';

  // مسارات إدارة المؤسسات
  static const String agency = '/agency';
  static const String agencyDetails = '/agency/details';
  static const String agencyEdit = '/agency/edit';
  static const String agencySubscriptions = '/agency/subscriptions';

  // مسارات إدارة الملاك
  static const String owners = '/owners';
  static const String ownerDetails = '/owner/details';
  static const String ownerEdit = '/owner/edit';
  static const String ownerAdd = '/owner/add';
  static const String ownerAgents = '/owner/agents';

  // مسارات إدارة العقارات
  static const String buildings = '/buildings';
  static const String buildingDetails = '/building/details';
  static const String buildingEdit = '/building/edit';
  static const String buildingAdd = '/building/add';
  static const String buildingUnits = '/building/units';

  // مسارات إدارة الوحدات
  static const String units = '/units';
  static const String unitDetails = '/unit/details';
  static const String unitEdit = '/unit/edit';
  static const String unitAdd = '/unit/add';
  static const String unitTypes = '/unit/types';

  // مسارات إدارة المستأجرين
  static const String tenants = '/tenants';
  static const String tenantDetails = '/tenant/details';
  static const String tenantEdit = '/tenant/edit';
  static const String tenantAdd = '/tenant/add';
  static const String tenantResidents = '/tenant/residents';

  // مسارات إدارة العقود
  static const String contracts = '/contracts';
  static const String contractDetails = '/contract/details';
  static const String contractEdit = '/contract/edit';
  static const String contractAdd = '/contract/add';
  static const String contractRenew = '/contract/renew';

  // مسارات إدارة المدفوعات
  static const String payments = '/payments';
  static const String paymentDetails = '/payment/details';
  static const String paymentAdd = '/payment/add';
  static const String paymentHistory = '/payment/history';

  // مسارات إدارة التأمينات
  static const String deposits = '/deposits';
  static const String depositDetails = '/deposit/details';
  static const String depositAdd = '/deposit/add';
  static const String guarantors = '/guarantors';

  // مسارات الفحوصات والتسليم
  static const String inspections = '/inspections';
  static const String inspectionDetails = '/inspection/details';
  static const String handoverRequests = '/handover/requests';
  static const String handoverDetails = '/handover/details';

  // مسارات التقارير
  static const String reports = '/reports';
  static const String financialReports = '/reports/financial';
  static const String occupancyReports = '/reports/occupancy';
  static const String subscriptionReports = '/reports/subscription';

  // مسارات الإشعارات
  static const String notifications = '/notifications';
  static const String notificationDetails = '/notification/details';
  static const String sendNotification = '/notification/send';

  // خريطة المسارات
  // ستتم إضافة التعيينات الفعلية لاحقاً
  static final Map<String, WidgetBuilder> routes = {
    // سيتم تعبئة هذه الخريطة لاحقاً
  };

  // دوال مساعدة للمسارات
  static String ownerDetailsRoute(int ownerId) {
    return '$ownerDetails/$ownerId';
  }

  static String buildingDetailsRoute(int buildingId) {
    return '$buildingDetails/$buildingId';
  }

  static String unitDetailsRoute(int unitId) {
    return '$unitDetails/$unitId';
  }

  static String tenantDetailsRoute(int tenantId) {
    return '$tenantDetails/$tenantId';
  }

  static String contractDetailsRoute(int contractId) {
    return '$contractDetails/$contractId';
  }

  static String paymentDetailsRoute(int paymentId) {
    return '$paymentDetails/$paymentId';
  }

  // دالة للحصول على معرف من المسار
  static int? getIdFromRoute(String route) {
    final parts = route.split('/');
    if (parts.length > 2) {
      return int.tryParse(parts.last);
    }
    return null;
  }

  // تحقق إذا كان المسار يحتاج مصادقة
  static bool requiresAuth(String route) {
    final publicRoutes = [splash, login, register, forgotPassword];
    return !publicRoutes.contains(route);
  }
}
