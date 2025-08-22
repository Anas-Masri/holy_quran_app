import 'package:quran_app/core/export/export.dart';

class SplashController extends GetxController {
  @override
  onInit() {
    super.onInit();
    timerFunction();
  }

  timerFunction() {
    Future.delayed(
        const Duration(seconds: 3), () => Get.offNamed(Routes.homeView));
  }
}
