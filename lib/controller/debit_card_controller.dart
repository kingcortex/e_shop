import 'package:get/get.dart';

class DebitCardController extends GetxController {
  RxString cardNumber = "4747474746464646".obs;
  RxString nameOfCard = "Alexandra Crus".obs;
  RxString expiryDate = "08/21".obs;

  void setCardNumber(String newCardNumber) {
    cardNumber.value = newCardNumber;
  }

  void setNameOfCard(String newName) {
    nameOfCard.value = newName;
  }

  void setExpiryDate(String newExpiryDate) {
    expiryDate.value = newExpiryDate;
  }
}
