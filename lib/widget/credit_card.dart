import 'package:e_shop/controller/debit_card_controller.dart';
import 'package:e_shop/theme/colors.dart';
import 'package:e_shop/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    DebitCardController controller = Get.find();
    return Stack(
      children: [
        Container(
          height: 210,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              colors: [
                Color(0xffB993D6),
                Color(0xff8CA6DB),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: SvgPicture.asset(
            "assets/Ellipse.svg",
          ),
        ),
        Positioned(
          top: 30,
          right: 30,
          child: SvgPicture.asset("assets/mc_symbol.svg"),
        ),
        Positioned.fill(
          child: Obx(
            () => Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  textCard(
                    text: formatStringWithSpaces(
                        controller.cardNumber.value, 4, ' '),
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 180,
                        child: textCard(
                          text: controller.nameOfCard.value,
                          fontSize: 18,
                        ),
                      ),
                      textCard(text: controller.expiryDate.value, fontSize: 18),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

Widget textCard({required String text, double fontSize = 26}) {
  return Text(
    text.toUpperCase(),
    style: myTexStyle(
      color: pureWhite,
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
    ),
  );
}

String formatStringWithSpaces(
    String numberString, int chunkSize, String separator) {
  String formattedNumber = '';

  for (int i = 0; i < numberString.length; i += chunkSize) {
    int endIndex = i + chunkSize;
    if (endIndex > numberString.length) {
      endIndex = numberString.length;
    }
    formattedNumber += numberString.substring(i, endIndex);
    if (endIndex < numberString.length) {
      formattedNumber += separator;
    }
  }

  return formattedNumber;
}
