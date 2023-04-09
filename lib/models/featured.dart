import 'package:flutter/material.dart';
import 'package:food_app/utils/app_colors.dart';

class Featured {
  final String name;
  final int rating;
  final int price;
  final int from;
  final String img;
  final Color background;

  Featured(
      {required this.name,
      required this.background,
      required this.rating,
      required this.price,
      required this.from,
      required this.img});
}

List<Featured> featuredFood = [
  Featured(
    name: "Delicious hot dog",
    rating: 4,
    price: 5,
    from: 8,
    img: 'assets/images/featured/hot-dog-emoji.png',
    background: AppColors.lightBrownBackground,
  ),
  Featured(
    name: "Cheese",
    rating: 5,
    price: 20,
    from: 30,
    img: 'assets/images/featured/cheese.png',
    background: AppColors.lightBlueBackground,
  ),
  Featured(
    name: "Meat Sandwich",
    rating: 5,
    price: 20,
    from: 22,
    img: 'assets/images/featured/sandwich-emoji.png',
    background: AppColors.lightGreenBackground,
  ),
  Featured(
    name: "Taco",
    rating: 5,
    price: 2,
    from: 3,
    img: 'assets/images/featured/taco-emoji.png',
    background: AppColors.lightBlueBackground,
  )
];
