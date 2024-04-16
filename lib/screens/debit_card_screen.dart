import 'package:e_shop/controller/debit_card_controller.dart';
import 'package:e_shop/widget/credit_card.dart';
import 'package:e_shop/widget/custom_button.dart';
import 'package:e_shop/widget/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../theme/colors.dart';
import '../theme/styles.dart';

class DebitCardScreen extends StatelessWidget {
  const DebitCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DebitCardController controller = Get.find();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Credit / Debit card",
              style: myTexStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: primaryTextColor,
              ),
            ),
            const Gap(30),
            const CreditCard(),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SvgPicture.asset("assets/icons/Take_photo.svg")],
            ),
            const Gap(20),
            CustomField(
              onChanged: (value) {
                controller.setNameOfCard(value);
              },
              label: "Name on card",
            ),
            const Gap(25),
            CustomField(
              onChanged: (value) {
                controller.setCardNumber(value);
              },
              label: "Card number",
              surffix: "assets/mc_symbol.svg",
            ),
            const Gap(25),
            Row(
              children: [
                Expanded(
                  child: CustomField(
                    onChanged: (value) {
                      controller.setExpiryDate(value);
                    },
                    label: "Expiry date",
                  ),
                ),
                const Gap(25),
                const Expanded(
                  child: CustomField(
                    label: "CVC",
                    surffix: "assets/Hint.svg",
                  ),
                )
              ],
            ),
            const Gap(40),
            CustomButton(
              text: "use this card",
              onTap: () async {
                bool? isOk = await showConfirmationDialog(context);
                if (isOk!) {
                  // ignore: use_build_context_synchronously
                  context.pop();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

Future<bool?> showConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Confirmer l\'action'),
        content: const Text('Êtes-vous sûr de vouloir continuer?'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text('Annuler'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          CupertinoDialogAction(
            child: const Text('Confirmer'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}
