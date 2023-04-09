import 'package:flutter/material.dart';

class CustomMenuIcon extends StatelessWidget {
  const CustomMenuIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/icon.png"),
        ),
      ),
    );
  }
}
