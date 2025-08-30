import 'package:quran_app/core/export/export.dart';

class AppRoutes {
  static List<GetPage> getPages = [
    GetPage(name: Routes.splashView, page: () => const SplashView()),
    GetPage(name: Routes.homeView, page: () => const HomeView()),
    GetPage(name: Routes.azkarView, page: () => const AzkarView()),
    GetPage(name: Routes.tasbihView, page: () => const TasbihView()),
  ];
}
