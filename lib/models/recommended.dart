import 'package:flutter/material.dart';
import 'package:food_app/utils/app_colors.dart';

class RecommendedFood {
  final String img;
  final String name;
  final int price;
  final Color background;
  final Color text;

  RecommendedFood({
    required this.background,
    required this.img,
    required this.name,
    required this.price,
    required this.text,
  });
}

List<RecommendedFood> recommendedFood = [
  RecommendedFood(
    img: 'assets/images/meat-burger.jpg',
    name: 'Hamburg',
    price: 21,
    background: AppColors.lightBrownBackground,
    text: AppColors.lightBrownText,
  ),
  RecommendedFood(
    img: 'assets/images/chips.jpg',
    name: 'Chips',
    price: 18,
    background: AppColors.lightBlueBackground,
    text: AppColors.lightBlueText,
  ),
  RecommendedFood(
    img: 'assets/images/crisps.png',
    name: 'Crisps',
    price: 10,
    background: AppColors.lightGreenBackground,
    text: AppColors.lightGreenText,
  ),
  RecommendedFood(
    img: 'assets/images/pizza.jpg',
    name: 'Pizza',
    price: 44,
    background: AppColors.lightBrownBackground,
    text: AppColors.lightBrownText,
  ),
  RecommendedFood(
    img: 'assets/images/corn-dog.jpg',
    name: 'Hot dog',
    price: 8,
    background: AppColors.lightBlueBackground,
    text: AppColors.lightBlueText,
  )
];
