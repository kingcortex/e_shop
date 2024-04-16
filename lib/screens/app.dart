import 'package:e_shop/screens/cart_screen.dart';
import 'package:e_shop/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int currentIndex = 0;
  void cangePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: const SafeArea(child: CategorieSreen()),
      body: const CartSreen(),
      backgroundColor: bgWithe,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: myPurple,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (value) => cangePage(value),
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
            icon: SvgPicture.asset(
              "assets/icons/shopping-cart.svg",
              // ignore: deprecated_member_use
              color: currentIndex == 1 ? myPurple : null,
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
