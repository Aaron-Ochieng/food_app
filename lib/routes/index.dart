import 'package:food_app/screens/details/details_screen.dart';
import 'package:food_app/screens/home/home_screen.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> pages = [
    GetPage(
      name: "/",
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: "/detail-screen",
      page: () => DetailsScreen(),
    )
  ];
}
