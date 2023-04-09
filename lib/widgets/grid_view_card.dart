import 'package:flutter/material.dart';
import 'package:food_app/utils/app_colors.dart';
import '../models/featured.dart';

class GridViewCard extends StatelessWidget {
  final bool iconEnabled;
  const GridViewCard({Key? key, this.iconEnabled = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1 / 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      itemCount: featuredFood.length,
      itemBuilder: (context, index) {
        var featured = featuredFood[index];
        return Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10, right: 15),
          height: 70,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: featured.background,
                  image: DecorationImage(
                    image: AssetImage(featured.img),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    featured.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${featured.price}',
                    style: TextStyle(color: AppColors.deepOrangeColor),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
