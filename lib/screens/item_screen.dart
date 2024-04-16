import 'package:e_shop/controller/filter_controller.dart';
import 'package:e_shop/model/articles_model.dart';
import 'package:e_shop/theme/colors.dart';
import 'package:e_shop/widget/article_tiles.dart';
import 'package:e_shop/widget/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../theme/styles.dart';
import '../widget/search_bar.dart';

class VegetableScren extends StatefulWidget {
  const VegetableScren({super.key});

  @override
  State<VegetableScren> createState() => _VegetableScrenState();
}

class _VegetableScrenState extends State<VegetableScren> {
  @override
  void initState() {
    Get.put(FilterController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset("assets/Vegetables.svg"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(30),
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                Text(
                  "Vegetables",
                  style: myTexStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: primaryTextColor,
                  ),
                ),
                const Gap(20),
                const MySearchBar(),
                const Gap(10),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return FilterItem(
                        index: index,
                        text: [
                          "Cabbage and lettuce (14)",
                          "Cucumbers and tomatoes (10)",
                          "Oinons and garlic (8)"
                        ][index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Gap(10);
                    },
                  ),
                ),
                const Gap(10),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return FilterItem(
                        index: index + 3,
                        text: [
                          "Oinons and garlic (8)",
                          "Peppers (7)",
                          "Potatoes and carrots (4)"
                        ][index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Gap(10);
                    },
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(top: 5),
                    itemCount: listArticle.length,
                    itemBuilder: (context, index) {
                      return ArticleCard(
                        article: listArticle[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Gap(10);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
