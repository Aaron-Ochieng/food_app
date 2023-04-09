import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/routes/index.dart';
import 'package:food_app/utils/app_colors.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      getPages: Routes.pages,
    );
  }
}
