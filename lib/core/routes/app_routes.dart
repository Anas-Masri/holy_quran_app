import 'package:quran_app/core/export/export.dart';
import 'package:quran_app/view/sub_home/quran_view.dart';
import 'package:quran_app/view/sub_home/surah_view.dart';

class AppRoutes {
  static List<GetPage> getPages = [
    GetPage(name: Routes.splashView, page: () => const SplashView()),
    GetPage(name: Routes.homeView, page: () => const HomeView()),
    GetPage(name: Routes.azkarView, page: () => const AzkarView()),
    GetPage(name: Routes.tasbihView, page: () => const TasbihView()),
    GetPage(name: Routes.quranView, page: () => const QuranView()),
    GetPage(name: Routes.surahView, page: () => const SurahView()),
  ];
}
