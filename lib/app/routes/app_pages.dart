import 'package:get/get.dart';
import 'package:hiki/app/modules/detail/view/detail.dart';

import '../modules/auth/landing/bindings/landing_binding.dart';
import '../modules/auth/landing/views/landing_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/lupapassword/bindings/lupapassword_binding.dart';
import '../modules/auth/lupapassword/views/lupapassword_view.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LUPAPASSWORD,
      page: () => LupapasswordView(),
      binding: LupapasswordBinding(),
    ),
    GetPage(
        name: _Paths.LANDING,
        page: () => const LandingView(),
        binding: LandingBinding(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: _Paths.DETAIL,
        page: () =>  const DetailView(),
    )
  ];
}
