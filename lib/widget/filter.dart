import 'package:e_shop/controller/filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../theme/colors.dart';
import '../theme/styles.dart';

class FilterItem extends StatelessWidget {
  final int index;
  final String text;
  const FilterItem({super.key, required this.index, required this.text});

  @override
  Widget build(BuildContext context) {
    FilterController controller = Get.find();
    return GestureDetector(
      onTap: () {
        controller.changeIndex(index);
      },
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          height: 34,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: controller.currentIndex.value != index
                ? pureWhite
                : const Color(0xffE2CBFF),
          ),
          child: controller.currentIndex.value != index
              ? Text(
                  text,
                  style: myTexStyle(
                    color: primaryTextColor,
                    fontSize: 14,
                  ),
                )
              : Row(
                  children: [
                    SvgPicture.asset("assets/icons/check.svg"),
                    Text(
                      text,
                      style: myTexStyle(
                        color: primaryTextColor,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
