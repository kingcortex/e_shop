import 'package:e_shop/model/articles_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxDouble total = 0.0.obs;
  RxInt count = 0.obs;

  @override
  void onInit() {
    count.value = listShop.length;
    init();
    super.onInit();
  }

  RxList<Article> listShop = RxList.empty();

  void addToShop(Article article) {
    listShop.add(article);
    total.value += article.price;
    count.value++;
  }

  void plus(double value) {
    total.value += value;
  }

  void moins(double value) {
    total.value -= value;
  }

  void init() {
    if (listShop.isNotEmpty) {
      // ignore: no_leading_underscores_for_local_identifiers
      double _total = 0;
      for (var element in listShop) {
        _total += element.price;
      }
      total.value = _total;
    }
  }
}
