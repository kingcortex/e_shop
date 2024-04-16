import 'package:e_shop/model/categorie_model.dart';
import 'package:e_shop/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../theme/colors.dart';

class CategorieCard extends StatelessWidget {
  final Categorie categorie;
  const CategorieCard({super.key, required this.categorie});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            context.push("/categorie");
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        categorie.imagePath,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: pureWhite,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          categorie.name,
                          style: myTexStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: primaryTextColor,
                          ),
                        ),
                        const Gap(10),
                        Text(
                          "(${categorie.count})",
                          style: myTexStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
