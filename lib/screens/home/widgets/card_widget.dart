import 'package:flutter/material.dart';
import 'package:food_app/models/recommended.dart';
import 'package:food_app/screens/details/details_screen.dart';
import 'package:get/get.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recommendedFood.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var recommended = recommendedFood[index];
        return GestureDetector(
          onTap: () {
            Get.to(() => DetailsScreen(), arguments: [
              {"id": index}
            ]);
          },
          child: Container(
            color: Colors.transparent,
            width: 120,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: recommended.background,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      image: DecorationImage(
                        image: AssetImage(recommended.img),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        recommended.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: recommended.text,
                        ),
                      ),
                      Text(
                        '\$${recommended.price.toString()}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: recommended.text,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
