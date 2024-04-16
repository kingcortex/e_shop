import 'package:get/get.dart';

class FilterController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    if (index != currentIndex.value) {
      currentIndex.value = index;
    }
  }
}
