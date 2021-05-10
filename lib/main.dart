import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/screens/home/home_screen.dart';
import 'package:news/screens/search/search_screen.dart';
import 'package:news/utils/bindings/news_binding.dart';
import 'package:news/utils/bindings/saerch_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: NewsBindind(),
      debugShowCheckedModeBanner: false,
      title: 'NEWS',
      home: HomeScreen(),
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomeScreen(),
          binding: NewsBindind(),
        ),
        GetPage(
          name: '/home',
          page: () => SearchScreen(),
          binding: SearchBinding(),
        ),
      ],
    );
  }
}
