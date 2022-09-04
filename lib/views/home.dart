import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_web/utils/constants.dart';
import 'package:healthcare_web/widgets/bottom_bar.dart';
import 'package:healthcare_web/widgets/text.dart';
import 'package:healthcare_web/widgets/top_tabs.dart';

import '../Responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(
              screenSize.width,
              Get.height * 0.099,
            ),
            child: TopTabs()),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // const SizedBox(
            //   height: 20,
            // ),
            // Stack(
            //   children: [
            //     commonCarousel(
            //         Get.width,
            //         [
            //           Container(
            //             width: Get.width,
            //             decoration: BoxDecoration(
            //                 //borderRadius: BorderRadius.circular(20),

            //                 image: DecorationImage(
            //               colorFilter: ColorFilter.mode(
            //                   Colors.black.withOpacity(0.3), BlendMode.dstATop),
            //               image: const NetworkImage(
            //                   "https://thumbs.dreamstime.com/z/mens-health-banner-medical-health-care-concept-screen-doctor-stethoscope-mens-health-banner-medical-health-care-143602912.jpg"),
            //               fit: BoxFit.cover,
            //             )),
            //           ),
            //           Container(
            //             width: Get.width,
            //             decoration: BoxDecoration(
            //                 //borderRadius: BorderRadius.circular(20),
            //                 image: DecorationImage(
            //               colorFilter: ColorFilter.mode(
            //                   Colors.black.withOpacity(0.3), BlendMode.dstATop),
            //               image: const NetworkImage(
            //                   "https://media-exp1.licdn.com/dms/image/D4E34AQGMywBoZxE4Hw/ugc-proxy-shrink_1280_800/0/1661875306743?e=1662498000&v=beta&t=h4tA12wAyG358iX3zzkgWaGMhbsDWNjTVYi6Mq9QPcc"),
            //               fit: BoxFit.cover,
            //             )),
            //           ),
            //         ],
            //         ResponsiveWidget.isMediumScreen(context) ? 300 : 500),
            //     Column(
            //       children: [
            //         Text1(text: "HealthCare", color: Color(themeColor), size: 80),
            //         Text3(
            //             weigth: false,
            //             size: 50,
            //             text: "Best Health Services Near You",
            //             color: Color(themeColor)),
            //         SizedBox(
            //           height: 30,
            //         ),
            //         // Text1(
            //         //     text: "Best Health Services Near You",
            //         //     color: Color(themeColor),
            //         //     size: 50),
            //         Row(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Container(
            //               height: ResponsiveWidget.isMediumScreen(context)
            //                   ? MediaQuery.of(context).size.height * 0.17
            //                   : MediaQuery.of(context).size.height * 0.15,
            //               width: MediaQuery.of(context).size.width * 0.7,
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Container(
            //                     color: Colors.white,
            //                     child: TextFormField(
            //                       cursorColor: const Color(0x0072bc),
            //                       decoration: const InputDecoration(
            //                           suffixIcon: Icon(Icons.location_on),
            //                           suffixIconColor: Color(0x0072bc),

            //                           //suffixText: "Locate Me",
            //                           hintText: "Enter your Location",
            //                           // labelText: "Name",
            //                           focusColor: Color(0xFF0C9869),
            //                           // labelS 0xFF0C9869tyle: TextStyle(color: Colors.black),
            //                           fillColor: Color(0xFF0C9869),
            //                           focusedBorder: OutlineInputBorder(
            //                               borderRadius:
            //                                   BorderRadius.all(Radius.zero),
            //                               borderSide: BorderSide(
            //                                   color: Color(0xFF0C9869),
            //                                   style: BorderStyle.solid)),
            //                           enabledBorder: OutlineInputBorder(
            //                               borderRadius: BorderRadius.only(
            //                                   topLeft: Radius.circular(20),
            //                                   bottomLeft: Radius.circular(20)),
            //                               borderSide: BorderSide(
            //                                   width: 2,
            //                                   color: Color(0xFF0C9869),
            //                                   style: BorderStyle.solid)),
            //                           border: OutlineInputBorder(
            //                               borderRadius: BorderRadius.only(
            //                                   topLeft: Radius.circular(20),
            //                                   bottomLeft: Radius.circular(20)),
            //                               borderSide: BorderSide(
            //                                   color: Color(0xffffbd59),
            //                                   style: BorderStyle.solid))),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             ElevatedButton(
            //                 onPressed: () {},
            //                 style: ButtonStyle(
            //                     padding: MaterialStateProperty.all<EdgeInsets>(
            //                         const EdgeInsets.all(26)),
            //                     backgroundColor: MaterialStateProperty.all<Color>(
            //                         const Color(themeColor)),
            //                     shape: MaterialStateProperty.all<
            //                             RoundedRectangleBorder>(
            //                         const RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.only(
            //                           topRight: Radius.circular(20),
            //                           bottomRight: Radius.circular(20)),
            //                     ))),
            //                 child: Text2(
            //                     weigth: false,
            //                     size: 0.015,
            //                     text: 'Locate Me',
            //                     color: Colors.white)),
            //           ],
            //         ),
            //       ],
            //     )
            //   ],
            // ),
            // commonCarousel(
            //     Get.width,
            //     [
            //       Container(
            //         width: Get.width,
            //         decoration: const BoxDecoration(
            //             //borderRadius: BorderRadius.circular(20),

            //             image: DecorationImage(
            //           image: NetworkImage(
            //               "https://thumbs.dreamstime.com/z/mens-health-banner-medical-health-care-concept-screen-doctor-stethoscope-mens-health-banner-medical-health-care-143602912.jpg"),
            //           fit: BoxFit.cover,
            //         )),
            //       ),
            //       Container(
            //         width: Get.width,
            //         decoration: const BoxDecoration(
            //             //borderRadius: BorderRadius.circular(20),
            //             image: DecorationImage(
            //           image: NetworkImage(
            //               "https://media-exp1.licdn.com/dms/image/D4E34AQGMywBoZxE4Hw/ugc-proxy-shrink_1280_800/0/1661875306743?e=1662498000&v=beta&t=h4tA12wAyG358iX3zzkgWaGMhbsDWNjTVYi6Mq9QPcc"),
            //           fit: BoxFit.cover,
            //         )),
            //       ),
            //     ],
            //     ResponsiveWidget.isMediumScreen(context) ? 300 : 500),
            Container(
              height: 300,
              color: Colors.black,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 250,
                        width: 150,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/1/19/Cosmetologist_applying_skincare_treatment.jpg"),
                                fit: BoxFit.contain)),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 250,
                        width: 150,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_520,h_520/rng/md/carousel/production/pneknawbadtvceqzwiep"),
                                fit: BoxFit.contain)),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 250,
                        width: 150,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_520,h_520/rng/md/carousel/production/s5ug2key6e2sptaxku5v"),
                                fit: BoxFit.contain)),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 250,
                        width: 150,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX15482231.jpg"),
                                fit: BoxFit.contain)),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text1(
                      text: "Top Servises Near You...",
                      color: Colors.black54,
                      size: 25),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              //Get.toNamed("${nearYouItem.pageRout}",arguments: "${nearYouItem.image}");
                            },
                            child: Column(
                              children: [
                                Material(
                                  elevation: 3,
                                  shadowColor: const Color(themeColor),
                                  borderRadius: BorderRadius.circular(20),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: ResponsiveWidget.isMediumScreen(
                                                context)
                                            ? 130
                                            : 200,
                                        width: ResponsiveWidget.isMediumScreen(
                                                context)
                                            ? 250
                                            : 350,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                            color: Colors.white,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_520,h_520/rng/md/carousel/production/pneknawbadtvceqzwiep"),
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(
                                        height: 60,
                                        // decoration: const BoxDecoration(
                                        //   color: Colors.white,
                                        // ),
                                        child: Text1(
                                          text: "Demo",
                                          size: 15,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              //Get.toNamed("${nearYouItem.pageRout}",arguments: "${nearYouItem.image}");
                            },
                            child: Column(
                              children: [
                                Material(
                                  elevation: 3,
                                  shadowColor: const Color(themeColor),
                                  borderRadius: BorderRadius.circular(20),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: ResponsiveWidget.isMediumScreen(
                                                context)
                                            ? 130
                                            : 200,
                                        width: ResponsiveWidget.isMediumScreen(
                                                context)
                                            ? 250
                                            : 350,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                            color: Colors.white,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_520,h_520/rng/md/carousel/production/pneknawbadtvceqzwiep"),
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(
                                        height: 60,
                                        // decoration: const BoxDecoration(
                                        //   color: Colors.white,
                                        // ),
                                        child: Text1(
                                          text: "Demo",
                                          size: 15,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              //Get.toNamed("${nearYouItem.pageRout}",arguments: "${nearYouItem.image}");
                            },
                            child: Column(
                              children: [
                                Material(
                                  elevation: 3,
                                  shadowColor: const Color(themeColor),
                                  borderRadius: BorderRadius.circular(20),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: ResponsiveWidget.isMediumScreen(
                                                context)
                                            ? 130
                                            : 200,
                                        width: ResponsiveWidget.isMediumScreen(
                                                context)
                                            ? 250
                                            : 350,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                            color: Colors.white,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_520,h_520/rng/md/carousel/production/pneknawbadtvceqzwiep"),
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(
                                        height: 60,
                                        // decoration: const BoxDecoration(
                                        //   color: Colors.white,
                                        // ),
                                        child: Text1(
                                          text: "Demo",
                                          size: 15,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text1(
                      text: "Other Servises Which We Provide...",
                      color: Colors.black54,
                      size: 25),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 500,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              ResponsiveWidget.isMediumScreen(context) ? 3 : 4,
                          childAspectRatio: 1.4,
                          crossAxisSpacing:
                              ResponsiveWidget.isMediumScreen(context)
                                  ? 40
                                  : 50,
                          mainAxisSpacing: 30,
                        ),
                        itemBuilder: (context, index) => Material(
                          elevation: 3,
                          shadowColor: const Color(themeColor),
                          borderRadius: BorderRadius.circular(20),
                          child: Column(
                            children: [
                              Container(
                                height: ResponsiveWidget.isMediumScreen(context)
                                    ? 120
                                    : 160,
                                width: 400,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_520,h_520/rng/md/carousel/production/pneknawbadtvceqzwiep"),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                height: 50,
                                // decoration: const BoxDecoration(
                                //   color: Colors.white,
                                // ),
                                child: Text1(
                                  text: "Demo",
                                  size: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text1(
                      text: "Why to use HealthCare?",
                      color: Colors.black54,
                      size: 25),
                  Text3(
                    weigth: false,
                    size: 18,
                    text: "  Best way for all your Health Concerns..",
                    color: Colors.black54,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: const BoxDecoration(
                                        color: Color(themeColor2),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/no_doctor_image.png"))),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text1(
                                          text: "Book doctors near You",
                                          color: Colors.black87,
                                          size: 18),
                                      Text3(
                                          weigth: false,
                                          size: 14,
                                          text:
                                              "  You will get security form the google for consultation",
                                          color: Colors.black54)
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: const BoxDecoration(
                                        color: Color(themeColor2),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/no_doctor_image.png"))),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text1(
                                          text: "Inter-Connective Technology",
                                          color: Colors.black87,
                                          size: 18),
                                      Text3(
                                          weigth: false,
                                          size: 14,
                                          text:
                                              "  All the services are inter-connective which make it most effective",
                                          color: Colors.black54)
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: const BoxDecoration(
                                        color: Color(themeColor2),
                                        image: DecorationImage(
                                            image:
                                                AssetImage("assets/49.png"))),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text1(
                                          text:
                                              "Effective Service For Physical Health",
                                          color: Colors.black87,
                                          size: 18),
                                      Text3(
                                          weigth: false,
                                          size: 14,
                                          text:
                                              "  You will get easy access for all the gym and yoga video",
                                          color: Colors.black54)
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: const BoxDecoration(
                                        color: Color(themeColor2),
                                        image: DecorationImage(
                                            image:
                                                AssetImage("assets/49.png"))),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text1(
                                          text: "Book doctors near You",
                                          color: Colors.black87,
                                          size: 18),
                                      Text3(
                                          weigth: false,
                                          size: 14,
                                          text:
                                              "  From Sedans and SUVs to Luxury cars for special occasions",
                                          color: Colors.black54)
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ResponsiveWidget.isSmallScreen(context)
                ? SizedBox()
                : Container(
                    width: Get.width,
                    padding: EdgeInsets.only(
                        left: Get.width * 0.1, right: Get.width * 0.1),
                    //color: Color(0xfff8f8f8),
                    color: const Color(themeColor2),
                    child: NewBottomBar())
          ]),
        ));
  }

  CarouselSlider commonCarousel(
      double width, List<Widget> widgets, double height) {
    return CarouselSlider(
        items: widgets,
        options: CarouselOptions(
          height: height,
          aspectRatio: 16 / 9,
          viewportFraction: 1.2,
          initialPage: 0,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 6),
          autoPlayAnimationDuration: Duration(seconds: 4),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          //onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ));
  }
}
