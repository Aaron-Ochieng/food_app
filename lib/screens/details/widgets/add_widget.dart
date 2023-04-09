import 'package:flutter/material.dart';
import 'package:food_app/utils/app_colors.dart';

class AddToCartWidget extends StatefulWidget {
  const AddToCartWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AddToCartWidget> createState() => _AddToCartWidgetState();
}

int items = 0;

class _AddToCartWidgetState extends State<AddToCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: MediaQuery.of(context).size.width * (6 / 10),
      decoration: BoxDecoration(
        color: AppColors.deepOrangeColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (items > 0) {
                        setState(() {
                          items = items - 1;
                          // ignore: avoid_print
                          print(items);
                        });
                      }
                    },
                    child: Icon(
                      Icons.remove,
                      color: AppColors.deepOrangeColor,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    items.toString(),
                    style: TextStyle(
                      color: AppColors.deepOrangeColor,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        items = items + 1;
                        // ignore: avoid_print
                        print(items);
                      });
                    },
                    child: Icon(
                      Icons.add,
                      color: AppColors.deepOrangeColor,
                    ),
                  )
                ]),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            "Add to cart",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
