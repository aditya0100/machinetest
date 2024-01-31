import 'package:get/get.dart';

import '../pages/dashboard.dart';
import '../pages/login.dart';
import '../pages/signup.dart';
import '../pages/splash_screen.dart';
import 'bindings.dart';


class Pages {
  static final allRoutes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(
        name: '/login', page: () => const LoginPage(), binding: LoginBinding()),
    GetPage(
        name: '/signup',
        page: () => const SignUpPage(),
        binding: SignUpBinding()),
    GetPage(
        name: '/dashboard',
        page: () => const Dashboard(),
        binding: DashboardBinding()),
  ];
}
