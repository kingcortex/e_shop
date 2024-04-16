import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:e_shop/controller/article_controller.dart';
import 'package:e_shop/controller/cart_controller.dart';
import 'package:e_shop/model/articles_model.dart';
import 'package:e_shop/theme/colors.dart';
import 'package:e_shop/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../theme/styles.dart';

class DetailScreen extends StatelessWidget {
  final String id;
  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Article article = listArticle[int.parse(id)];
    ArticleController articleController = Get.find(tag: id);
    CartController cartController = Get.find();

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: 358,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(article.image), fit: BoxFit.fill),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 32,
                color: pureWhite,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              height: 550,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: bgWithe,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(20),
                      Text(
                        article.name,
                        style: myTexStyle(
                          fontSize: 24,
                          color: primaryTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(12),
                      Row(
                        children: [
                          Text(
                            article.price.toString(),
                            style: myTexStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: primaryTextColor,
                            ),
                          ),
                          Text(
                            "€ / piece",
                            style: myTexStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const Gap(15),
                      Text(
                        "~ 150 gr / piece",
                        style: myTexStyle(color: primaryButtonColor),
                      ),
                      const Gap(35),
                      Text(
                        "Spain",
                        style: myTexStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryTextColor,
                        ),
                      ),
                      const Gap(10),
                      Text(
                        article.description,
                        textAlign: TextAlign.start,
                        style: myTexStyle(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => LikeButton(
                          size: const Size(78, 56),
                          isLiked: articleController.isLiked.value,
                          onTap: () => articleController.like(),
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: CustomButton(
                          onTap: () {
                            cartController.addToShop(article);
                            final snackBar = SnackBar(
                              duration: const Duration(milliseconds: 400),
                              margin: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).size.height - 245),
                              dismissDirection: DismissDirection.up,

                              /// need to set following properties for best effect of awesome_snackbar_content
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                color: primaryButtonColor,
                                title: 'Success!',
                                message: 'add successfully!',

                                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                contentType: ContentType.success,
                              ),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          icon: SvgPicture.asset(
                            "assets/icons/shopping-cart.svg",
                            // ignore: deprecated_member_use
                            color: pureWhite,
                          ),
                          text: "add to cart",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
