import 'package:get/get.dart';

class ArticleController extends GetxController {
  RxBool isLiked = false.obs;

  void like() {
    isLiked.value = !isLiked.value;
  }
}
