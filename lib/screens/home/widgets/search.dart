import 'package:flutter/material.dart';
import 'package:food_app/utils/app_colors.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(
        children: const [
          Icon(
            Icons.search,
          ),
          SizedBox(
            width: 10,
          ),
          Text('Search')
        ],
      ),
    );
  }
}
