import 'package:e_shop/controller/cart_controller.dart';
import 'package:e_shop/widget/cart_tiles.dart';
import 'package:e_shop/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../theme/colors.dart';
import '../theme/styles.dart';

class CartSreen extends StatelessWidget {
  const CartSreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 60),
            child: cartController.count.value != 0
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cart",
                        style: myTexStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: primaryTextColor,
                        ),
                      ),
                      Expanded(
                        child: Obx(
                          () => ListView.separated(
                            itemCount: cartController.listShop.length,
                            itemBuilder: (context, index) {
                              return CartTile(
                                  article: cartController.listShop[index]);
                            },
                            separatorBuilder: (context, index) {
                              return const Gap(10);
                            },
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: myTexStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  "${cartController.total.value.toStringAsFixed(2)} €",
                                  style: myTexStyle(
                                    fontWeight: FontWeight.bold,
                                    color: primaryTextColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Gap(20),
                          CustomButton(
                            onTap: () {
                              context.push('/check_out');
                            },
                            text: "Check Out",
                          ),
                        ],
                      )
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Cart",
                        style: myTexStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: primaryTextColor,
                        ),
                      ),
                      Center(
                        child: Text(
                          "Cart is empty",
                          style: myTexStyle(),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
