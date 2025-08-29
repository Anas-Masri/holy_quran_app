import 'dart:developer';

import 'package:quran_app/core/export/export.dart';
import 'package:quran_app/core/services/api_service.dart';
import 'package:quran_app/model/azkar_model.dart';

class HomeController extends GetxController {
  int currentIndex = 0;
  // bool isOpened = false;
  int selectedIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  List<bool> isOpenList = [];
  List<AzkarModel> items = [];
  Status status = Status.init;
  @override
  void onInit() {
    getAllAzkar();
    super.onInit();
  }

  void openDropDown(int index) {
    // selectedIndex == index ? selectedIndex = -1 : selectedIndex = index;
    isOpenList[index] = !isOpenList[index];
    log([index].toString());
    // isOpened = !isOpened;

    update();
  }

  void changeTap(int index) {
    currentIndex = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
    update();
  }

  Future<void> getAllAzkar() async {
    status = Status.loading;
    update();
    try {
      items = await ApiService.getAllAzkar();
      isOpenList = List.generate(items.length, (_) => false);
      status = Status.success;
      update();
    } catch (e) {
      status = Status.error;
      update();
    }
  }

  void navigateToAzkarDetails(index) {
    log(index.toString());
    switch (index) {
      case 0:
        Get.toNamed(Routes.azkarView);
      case 1:
        Get.toNamed(Routes.azkarView);
      case 2:
        Get.toNamed(Routes.azkarView);
      case 3:
        Get.toNamed(Routes.azkarView);
      case 4:
        Get.toNamed(Routes.azkarView);
      case 5:
        Get.toNamed(Routes.azkarView);

        break;
      default:
        Get.toNamed(Routes.homeView);
    }
  }
}

enum Status { init, loading, success, error }
/**
 * 
 *  'أسماء الله الحسني',
    'التسبيح الالكتروني',
    'الأدعية',
    'الأحاديث',
    'الأذكار',
    'القرأن',
 */