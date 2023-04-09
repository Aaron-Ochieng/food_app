import 'package:flutter/material.dart';
import 'package:food_app/screens/home/widgets/card_widget.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/featured_card.dart';

import '../../widgets/custom_menu.dart';
import 'widgets/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomMenuIcon(),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/user/user1.jpg'),
                    )
                  ],
                ),
              ),
              BigText(
                text: "Search for \nrecipes".toUpperCase(),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Search(),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "Recommended",
                      size: 15,
                      color: AppColors.lightGreyColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * (0.3),
                      width: double.maxFinite,
                      child: const CardWidget(),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(
                    text: "Featured",
                    size: 15,
                    color: AppColors.lightGreyColor,
                  ),
                  Text(
                    'COMBOS',
                    style: TextStyle(fontSize: 10, color: AppColors.greyColor),
                  ),
                  Text('FAVORITES',
                      style:
                          TextStyle(fontSize: 10, color: AppColors.greyColor)),
                  Text('RECOMMENDED',
                      style:
                          TextStyle(fontSize: 10, color: AppColors.greyColor)),
                ],
              ),
              const SizedBox(
                height: 140,
                child: FeaturedCard(
                  axis: Axis.vertical,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
