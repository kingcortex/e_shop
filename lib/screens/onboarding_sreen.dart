
import 'package:e_shop/theme/colors.dart';
import 'package:e_shop/theme/styles.dart';
import 'package:e_shop/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    slideAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
          parent: controller, curve: Curves.fastEaseInToSlowEaseOut),
    );
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myPurple,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            height: double.infinity,
          ),
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              "assets/BG.svg",
            ),
          ),
          Positioned(
            top: 66,
            left: 15,
            child: SvgPicture.asset(
              "assets/logo.svg",
            ),
          ),
          Positioned(
            bottom: 0,
            child: SlideTransition(
              position: slideAnimation,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height * .65,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: bgWithe,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    const Gap(40),
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: pureWhite,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/Box.svg"),
                    ),
                    const Gap(10),
                    Text(
                      "Non-Contact\n Deliveries",
                      textAlign: TextAlign.center,
                      style: myTexStyle(
                        color: primaryTextColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(20),
                    Text(
                      textAlign: TextAlign.center,
                      "When placing an order, select the option “Contactless delivery” and the courier will leave your order at the door.",
                      style: myTexStyle(),
                    ),
                    const Gap(38),
                    CustomButton(
                      onTap: () {
                        context.go('/home');
                      },
                      text: "order now",
                    ),
                    const Gap(20),
                    Text(
                      "DISMISS",
                      style: myTexStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
