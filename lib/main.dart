import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_web/utils/theme.dart';
import 'package:healthcare_web/views/home.dart';
import 'package:healthcare_web/views/landing_page/blanding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      initialRoute: '/start',
      getPages: [
        GetPage(name: '/start', page: () => const LandingPage()),
        GetPage(name: '/home', page: () => const HomePage()),
      ],
    );
  }
}


// buttonColor: const Color(0xffffbd59),
//     primaryColor: const Color(0xffffbd59),

 
