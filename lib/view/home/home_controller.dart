import 'package:quran_app/core/export/export.dart';

class HomeController extends GetxController {
  int currentIndex = 0;

  PageController pageController = PageController(initialPage: 0);

  void changeTap(int index) {
    currentIndex = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
    update();
  }
}
