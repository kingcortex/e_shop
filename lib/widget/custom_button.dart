import 'package:e_shop/theme/colors.dart';
import 'package:e_shop/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final void Function()? onTap;
  const CustomButton({super.key, required this.text, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryButtonColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            alignment: Alignment.center,
            height: 56,
            child: icon == null
                ? Text(
                    text.toUpperCase(),
                    style: myTexStyle(
                      color: pureWhite,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon!,
                      const Gap(10),
                      Text(
                        text.toUpperCase(),
                        style: myTexStyle(
                          color: pureWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class LikeButton extends StatelessWidget {
  final void Function()? onTap;
  final bool isLiked;
  final Size? size;
  const LikeButton({super.key, this.onTap, required this.isLiked, this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: size != null ? size!.height : 40,
        width: size != null ? size!.width : 78,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          color: pureWhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: isLiked
            ? const Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : Icon(
                Icons.favorite_border_outlined,
                color: borderColor,
              ),
      ),
    );
  }
}

class ShopButton extends StatelessWidget {
  final void Function()? onTap;
  const ShopButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 78,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        color: primaryButtonColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SvgPicture.asset(
        "assets/icons/shopping-cart.svg",
        // ignore: deprecated_member_use
        color: pureWhite,
      ),
    );
  }
}
