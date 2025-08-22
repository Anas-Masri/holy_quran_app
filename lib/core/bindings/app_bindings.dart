import 'package:quran_app/core/export/export.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
