import 'package:flutter/material.dart';
import 'package:food_app/models/recommended.dart';
import 'package:food_app/screens/details/widgets/add_widget.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:food_app/widgets/grid_view_card.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../widgets/custom_menu.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key}) : super(key: key);

  dynamic data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print(data[0]['id']);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomMenuIcon(),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.deepOrangeColor,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.deepOrangeColor.withOpacity(0.1),
                              blurRadius: 3,
                              spreadRadius: 1,
                              offset: const Offset(1, 4),
                            )
                          ]),
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BigText(text: recommendedFood[data[0]['id']].name.toUpperCase()),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.only(right: 20),
                height: MediaQuery.of(context).size.height * (1 / 3),
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * (1 / 3),
                      width: MediaQuery.of(context).size.width * (2 / 3),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(recommendedFood[data[0]['id']].img),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      height: double.maxFinite,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.grey.shade100,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.deepOrangeColor
                                          .withOpacity(0.1),
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                      offset: const Offset(1, 4))
                                ]),
                            child: Icon(
                              FluentIcons.heart_20_regular,
                              size: 35,
                              color: AppColors.deepOrangeColor,
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.grey.shade100,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.deepOrangeColor
                                          .withOpacity(0.1),
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                      offset: const Offset(1, 4))
                                ]),
                            child: const Icon(
                              FluentIcons.timer_32_regular,
                              size: 35,
                              color: Colors.pink,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * (1 / 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(
                      text:
                          "\$${recommendedFood[data[0]['id']].price.toString()}",
                      color: Colors.black,
                      size: 25,
                    ),
                    const AddToCartWidget(),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: "Featured",
                        size: 16,
                        color: AppColors.lightGreyColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Expanded(child: GridViewCard())
                    ],
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
