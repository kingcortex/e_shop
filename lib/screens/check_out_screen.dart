import 'package:e_shop/controller/debit_card_controller.dart';
import 'package:e_shop/theme/colors.dart';
import 'package:e_shop/theme/styles.dart';
import 'package:e_shop/widget/credit_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DebitCardController debitCardController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Out"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            const Gap(10),
            buildTitle(text: "Paiement method", context: context),
            const Gap(15),
            Obx(
              () => buildElement(
                iconPath: "assets/icons/credit-card.svg",
                text: formatStringWithSpaces(
                  debitCardController.cardNumber.value
                      .replaceAll(RegExp(r'\d(?=\d{4})'), '*'),
                  4,
                  " ",
                ),
              ),
            ),
            const Gap(15),
            buildTitle(
              text: "Delivery address",
              context: context,
            ),
            const Gap(15),
            buildElement(
              iconPath: "assets/icons/home.svg",
              text:
                  "Alexandra Smith\nCesu 31 k-2 5.st, SIA Chili\nRiga\nLV–1012\nLatvia",
            ),
            const Gap(15),
            buildTitle(
              text: "Delivery address",
              context: context,
            ),
            const Gap(15),
            buildElement(
                iconPath: "assets/icons/walking.svg",
                text: "I’ll pick it up myself"),
            buildElement(iconPath: "assets/icons/bike.svg", text: "By courier"),
            buildElement(
              iconPath: "assets/icons/Drone.svg",
              text: "By Drone",
              color: myPurple,
              iconRight: "assets/icons/check.svg",
            ),
            const Gap(35),
            buildTitle(
              text: "Non-contact-delivery",
              withSwicth: true,
              context: context,
            )
          ],
        ),
      ),
    );
  }
}

Widget buildTitle(
    {required BuildContext context,
    required String text,
    bool withSwicth = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: myTexStyle(
          fontSize: 18,
          color: primaryTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      withSwicth == false
          ? InkWell(
              onTap: () {
                context.push('/credit_card');
              },
              child: Text(
                "CHANGE",
                style: myTexStyle(
                  fontSize: 15,
                  color: myPurple,
                ),
              ),
            )
          : const CustomCupertinoSwicth()
    ],
  );
}

Widget buildElement(
    {required String iconPath,
    required String text,
    String? iconRight,
    Color? color}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(iconPath),
            const Gap(10),
            Text(
              text,
              style: myTexStyle(
                color: color ?? secondaryTextColor,
              ),
            ),
          ],
        ),
        if (iconRight != null) SvgPicture.asset(iconRight)
      ],
    ),
  );
}

class CustomCupertinoSwicth extends StatefulWidget {
  const CustomCupertinoSwicth({super.key});

  @override
  State<CustomCupertinoSwicth> createState() => _CustomCupertinoSwicthState();
}

class _CustomCupertinoSwicthState extends State<CustomCupertinoSwicth> {
  bool iOk = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      activeColor: const Color(0xffE2CBFF),
      value: iOk,
      onChanged: (etat) {
        setState(() {
          iOk = etat;
        });
      },
    );
  }
}
