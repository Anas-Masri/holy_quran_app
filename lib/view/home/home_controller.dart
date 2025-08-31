import 'dart:developer';

import 'package:quran_app/core/export/export.dart';

class HomeController extends GetxController {
  int tasbihCounterTemp = 0;
  int currentIndex = 0;
  int selectedIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  List<bool> isOpenList = [];
  List<AzkarModel> items = [];
  int selectedIndexTasbihList = 0;
  Status status = Status.init;
  List<int> counters = List.generate(AppConstants.tasbihList.length, (_) => 0);
  @override
  void onInit() {
    getAllAzkar();
    super.onInit();
  }

  void tasbihIncrement() {
    counters[selectedIndexTasbihList]++;

    tasbihCounterTemp = counters[selectedIndexTasbihList];
    counters[selectedIndexTasbihList] = tasbihCounterTemp;
    update();
  }

  void tasbihReset() {
    tasbihCounterTemp = 0;
    counters[selectedIndexTasbihList] = tasbihCounterTemp;

    update();
  }

  void changeSelectedTasbihIndex() {
    tasbihCounterTemp = counters[selectedIndexTasbihList];
    selectedIndexTasbihList < AppConstants.tasbihList.length - 1
        ? selectedIndexTasbihList++
        : selectedIndexTasbihList = 0;
    tasbihCounterTemp = counters[selectedIndexTasbihList];
    update();
  }

  void openDropDown(int index) {
    isOpenList[index] = !isOpenList[index];
    log([index].toString());
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
        Get.toNamed(Routes.tasbihView);
      case 2:
        Get.toNamed(Routes.azkarView);
      case 3:
        Get.toNamed(Routes.azkarView);
      case 4:
        Get.toNamed(Routes.azkarView);
      case 5:
        Get.toNamed(Routes.quranView);

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