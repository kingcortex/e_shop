import 'package:e_shop/theme/colors.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          color: bgWithe,
          border: Border.all(
            width: 2,
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(30)),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search",
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
