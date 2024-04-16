import 'package:e_shop/controller/cart_controller.dart';
import 'package:e_shop/controller/debit_card_controller.dart';
import 'package:e_shop/navigation/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(DebitCardController());
  Get.put(
    CartController(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppNavigation.router,
    );
  }
}
