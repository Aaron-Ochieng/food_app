import 'package:flutter/material.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:food_app/widgets/big_text.dart';
import '../models/featured.dart';

class FeaturedCard extends StatelessWidget {
  final Axis axis;
  const FeaturedCard({Key? key, required this.axis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: featuredFood.length,
      scrollDirection: axis,
      itemBuilder: (context, index) {
        var featured = featuredFood[index];
        return Container(
          margin: const EdgeInsets.only(right: 20),
          padding: const EdgeInsets.all(10),
          height: 70,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Row(
            children: [
              SizedBox(
                height: double.maxFinite,
                width: 70,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: featured.background,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(featured.img),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: featured.name,
                    size: 10,
                    color: AppColors.lightGreyColor,
                  ),
                  Wrap(
                    children: List.generate(
                      featured.rating,
                      (index) => Icon(
                        Icons.star,
                        color: AppColors.deepOrangeColor,
                        size: 15,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: "\$${featured.price.toString()}",
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        featured.from.toString(),
                        style: TextStyle(
                          color: AppColors.lightGreyColor,
                          fontSize: 10,
                          decoration: TextDecoration.lineThrough,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Expanded(child: Container()),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.pinkAccent.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
