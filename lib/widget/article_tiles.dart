import 'package:e_shop/controller/article_controller.dart';
import 'package:e_shop/model/articles_model.dart';
import 'package:e_shop/theme/colors.dart';
import 'package:e_shop/theme/styles.dart';
import 'package:e_shop/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(ArticleController(), tag: article.index, permanent: true);
    return GestureDetector(
      onTap: () {
        context.push('/detail/${article.index}');
      },
      child: SizedBox(
        height: 160,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: 128,
              width: 177,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(article.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.name,
                        style: myTexStyle(
                          fontSize: 18,
                          color: primaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Gap(12),
                      Row(
                        children: [
                          Text(
                            article.price.toString(),
                            style: myTexStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: primaryTextColor,
                            ),
                          ),
                          Text(
                            "€ / piece",
                            style: myTexStyle(),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => LikeButton(
                          isLiked: controller.isLiked.value,
                          onTap: () => controller.like(),
                        ),
                      ),
                      const Gap(10),
                      const ShopButton(),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
