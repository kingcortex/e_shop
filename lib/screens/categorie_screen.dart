import 'package:e_shop/model/categorie_model.dart';
import 'package:e_shop/widget/categorie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../theme/colors.dart';
import '../theme/styles.dart';
import '../widget/search_bar.dart';

class CategorieSreen extends StatelessWidget {
  const CategorieSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Categories",
              style: myTexStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: primaryTextColor),
            ),
            const Gap(20),
            const MySearchBar(),
            const Gap(10),
            Expanded(
              child: GridView.builder(
                itemCount: listCategorie.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: .8),
                itemBuilder: (context, index) {
                  return CategorieCard(
                    categorie: listCategorie[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
