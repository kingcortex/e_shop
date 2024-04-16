import 'package:e_shop/controller/cart_controller.dart';
import 'package:e_shop/model/articles_model.dart';
import 'package:e_shop/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../theme/styles.dart';

class CartTile extends StatefulWidget {
  final Article article;
  const CartTile({super.key, required this.article});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  int count = 1;
  CartController controller = Get.find();

  void increment() {
    setState(() {
      count++;
    });
    controller.plus(widget.article.price);
  }

  void decrement() {
    if (count > 1) {
      setState(() {
        count--;
      });
      controller.moins(widget.article.price);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
        color: pureWhite,
        //border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0, 0),
            blurRadius: 8,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(widget.article.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.article.name,
                        style: myTexStyle(
                          fontSize: 16,
                          color: primaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Gap(12),
                      Row(
                        children: [
                          Text(
                            widget.article.price.toString(),
                            style: myTexStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: primaryTextColor,
                            ),
                          ),
                          Text(
                            "€ / piece",
                            style: myTexStyle(),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            height: double.infinity,
            width: 30,
            decoration: BoxDecoration(
              color: const Color(0xffE2CBFF).withOpacity(0.6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    increment();
                  },
                  child: Icon(
                    Icons.add,
                    color: primaryTextColor,
                  ),
                ),
                Text(
                  count.toString(),
                  style: myTexStyle(fontSize: 20),
                ),
                InkWell(
                  onTap: () {
                    decrement();
                  },
                  child: Icon(
                    Icons.remove,
                    color: primaryTextColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
