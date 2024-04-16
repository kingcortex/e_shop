import 'package:e_shop/controller/cart_controller.dart';
import 'package:e_shop/theme/colors.dart';
import 'package:e_shop/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class MainWrapper extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const MainWrapper({
    super.key,
    required this.navigationShell,
  });

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int currentIndex = 0;
  void goToBrash(int index) {
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }

  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      backgroundColor: bgWithe,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: myPurple,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (value) {
          goToBrash(value);

          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/grid.svg",
              // ignore: deprecated_member_use
              color: currentIndex == 0 ? myPurple : null,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/icons/shopping-cart.svg",
                    // ignore: deprecated_member_use
                    color: currentIndex == 1 ? myPurple : null,
                  ),
                ),
                if(cartController.count.value != 0) Positioned(
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                      color: Color(0xffCBF265),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      cartController.count.value.toString(),
                      style: myTexStyle(color: primaryTextColor, fontSize: 14),
                    ),
                  ),
                )
              ],
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/user.svg",
              // ignore: deprecated_member_use
              color: currentIndex == 2 ? myPurple : null,
            ),
            label: "Acount",
          )
        ],
      ),
    );
  }
}
