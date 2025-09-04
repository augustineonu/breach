import 'package:breach/features/auth/domain/bindings/auth_binding.dart';
import 'package:breach/features/auth/pages/auth_page.dart';
import 'package:breach/features/home/domain/bindings/guest_binding.dart';
import 'package:breach/features/home/presentation/guest_page.dart';
import 'package:breach/features/home/presentation/home_page.dart';
import 'package:breach/features/onboarding/presentation/onboarding_binding.dart';
import 'package:breach/features/onboarding/presentation/pages/interest_page.dart';
import 'package:breach/features/onboarding/presentation/pages/welcome_page.dart';
import 'package:breach/routes/app_routes.dart';
import 'package:get/get.dart';
import '../features/home/domain/bindings/home_binding.dart';

class AppPages {
  static const initial = AppRoutes.guest;

  static final routes = [
    GetPage(
      name: AppRoutes.guest,
      page: () => const GuestPage(),
      binding: GuestBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.auth,
      page: () => const AuthPage(),
      binding: AuthBinding(),
    ),
    GetPage(name: AppRoutes.onboarding, page: () => const WelcomePage()),
    GetPage(
      name: AppRoutes.interests,
      page: () => const InterestsPage(),
      binding: OnboardingBinding(),
    ),
  ];
}
