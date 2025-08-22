import 'package:get/get.dart';
import 'package:quran_app/core/routes/routes.dart';
import 'package:quran_app/view/home/home_view.dart';
import 'package:quran_app/view/splash/splash_view.dart';

class AppRoutes {
  static List<GetPage> getPages = [
    GetPage(name: Routes.splashView, page: () => const SplashView()),
    GetPage(name: Routes.homeView, page: () => const HomeView()),
  ];
}
