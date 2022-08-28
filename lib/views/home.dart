import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(
                left: ResponsiveWidget.isMediumScreen(context) ? 60 : 75,
                top: ResponsiveWidget.isMediumScreen(context) ? 20 : 25,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/logo1.png",
                    height: ResponsiveWidget.isMediumScreen(context) ? 55 : 70,
                    width: ResponsiveWidget.isMediumScreen(context) ? 55 : 70,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.08,
                  ),
                ],
              ))
        ]),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            CarouselSlider(
              items: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.3,
                    color: const Color.fromARGB(255, 42, 39, 44),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            //  child: Image.asset('assets/c78de67c6d0c83cf380fccdb0a2b167e.jpg'),
                            height: 250,
                            width: 300,
                            decoration: const BoxDecoration(
                                color: Color(0xFF0C9869),
                                borderRadius: BorderRadius.zero)),
                        Container(
                            //  child: Image.asset('assets/c78de67c6d0c83cf380fccdb0a2b167e.jpg'),
                            height: 250,
                            width: 300,
                            decoration: const BoxDecoration(
                                color: Color(0xFF0C9869),
                                borderRadius: BorderRadius.zero)),
                        Container(
                            // child: Image.asset('assets/c78de67c6d0c83cf380fccdb0a2b167e.jpg'),
                            height: 250,
                            width: 300,
                            decoration: const BoxDecoration(
                                color: Color(0xFF0C9869),
                                borderRadius: BorderRadius.zero))
                      ],
                    )
                    //rgba(NaN, 40, 44, 0.25)),)
                    ),
              ],
              options: CarouselOptions(autoPlay: false),
            ),
          ],
        )
      ]),
    ));
  }
}
