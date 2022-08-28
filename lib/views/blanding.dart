import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_web/utils/constants.dart';

import '../Responsive.dart';
import '../widgets/text.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(
                        flex: 3,
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: ResponsiveWidget.isMediumScreen(context)
                                    ? MediaQuery.of(context).size.height * 0.07
                                    : MediaQuery.of(context).size.height * 0.1),
                            child: Column(children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: ResponsiveWidget.isMediumScreen(
                                                  context)
                                              ? 40
                                              : 55,
                                          right:
                                              ResponsiveWidget.isMediumScreen(
                                                      context)
                                                  ? 20
                                                  : 40),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            "assets/logo1.png",
                                            height:
                                                ResponsiveWidget.isMediumScreen(
                                                        context)
                                                    ? 85
                                                    : 100,
                                            width:
                                                ResponsiveWidget.isMediumScreen(
                                                        context)
                                                    ? 95
                                                    : 100,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20, left: 8),
                                                  child: Text2(
                                                      weigth: true,
                                                      size: ResponsiveWidget
                                                              .isMediumScreen(
                                                                  context)
                                                          ? 0.035
                                                          : 0.045,
                                                      text: "HealthCare",
                                                      color: const Color(
                                                          themeColor))),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8),
                                                  child: Text2(
                                                      weigth: true,
                                                      size: ResponsiveWidget
                                                              .isMediumScreen(
                                                                  context)
                                                          ? 0.018
                                                          : 0.023,
                                                      text:
                                                          "We Care You, We Serve You",
                                                      color: const Color(
                                                          themeBlue))),
                                            ],
                                          ),
                                          Spacer(),
                                          InkWell(
                                            hoverColor: Colors.white,
                                            onTap: () {},
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  top: ResponsiveWidget
                                                          .isMediumScreen(
                                                              context)
                                                      ? 20
                                                      : 40),
                                              color: Colors.white,
                                              padding: EdgeInsets.only(
                                                  left: ResponsiveWidget
                                                          .isMediumScreen(
                                                              context)
                                                      ? 15
                                                      : 25,
                                                  right: ResponsiveWidget
                                                          .isMediumScreen(
                                                              context)
                                                      ? 15
                                                      : 25,
                                                  top: ResponsiveWidget
                                                          .isMediumScreen(
                                                              context)
                                                      ? 5
                                                      : 10,
                                                  bottom: ResponsiveWidget
                                                          .isMediumScreen(
                                                              context)
                                                      ? 5
                                                      : 10),
                                              alignment: Alignment.center,
                                              child: AutoSizeText1(
                                                data: "Login",
                                                max: ResponsiveWidget
                                                        .isMediumScreen(context)
                                                    ? 18
                                                    : 16,
                                                min: 16,
                                                clr: const Color(themeColor),
                                                weight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            hoverColor: Colors.white,
                                            onTap: () {},
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  top: ResponsiveWidget
                                                          .isMediumScreen(
                                                              context)
                                                      ? 20
                                                      : 40),
                                              color: const Color(themeColor),
                                              padding: EdgeInsets.only(
                                                  left: ResponsiveWidget
                                                          .isMediumScreen(
                                                              context)
                                                      ? 15
                                                      : 25,
                                                  right: ResponsiveWidget
                                                          .isMediumScreen(
                                                              context)
                                                      ? 15
                                                      : 25,
                                                  top: ResponsiveWidget
                                                          .isMediumScreen(
                                                              context)
                                                      ? 5
                                                      : 10,
                                                  bottom: ResponsiveWidget
                                                          .isMediumScreen(
                                                              context)
                                                      ? 5
                                                      : 10),
                                              alignment: Alignment.center,
                                              child: AutoSizeText1(
                                                data: "Sign Up",
                                                max: ResponsiveWidget
                                                        .isMediumScreen(context)
                                                    ? 18
                                                    : 16,
                                                min: 16,
                                                clr: Colors.white,
                                                weight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: ResponsiveWidget.isMediumScreen(
                                              context)
                                          ? MediaQuery.of(context).size.height *
                                              0.05
                                          : MediaQuery.of(context).size.height *
                                              0.1,
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        //    mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: ResponsiveWidget
                                                        .isMediumScreen(context)
                                                    ? 40
                                                    : 55.0,
                                                right: ResponsiveWidget
                                                        .isMediumScreen(context)
                                                    ? 20
                                                    : 40),
                                            child: SizedBox(
                                              height: 57,
                                              child: CarouselSlider(
                                                options: CarouselOptions(
                                                  height: 50,
                                                  pauseAutoPlayInFiniteScroll:
                                                      true,
                                                  autoPlay: true,
                                                  enlargeCenterPage: false,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  autoPlayInterval:
                                                      Duration(seconds: 3),
                                                ),
                                                items: [
                                                  selectableTabText(
                                                      text:
                                                          "Doctor Appointment"),
                                                  selectableTabText(
                                                      text:
                                                          "In Home Lab Testing"),
                                                  selectableTabText(
                                                      text: "Online Pharmacy"),
                                                  selectableTabText(
                                                      text: "Gym Service"),
                                                  selectableTabText(
                                                      text:
                                                          "And Many More......."),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: ResponsiveWidget
                                                        .isMediumScreen(context)
                                                    ? 40
                                                    : 55.0,
                                                right: ResponsiveWidget
                                                        .isMediumScreen(context)
                                                    ? 20
                                                    : 40),
                                            child: Text(
                                              "We Care You, We Serve You",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: ResponsiveWidget
                                                        .isMediumScreen(context)
                                                    ? 18
                                                    : 22,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                ResponsiveWidget.isMediumScreen(
                                                        context)
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.02
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.05,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: ResponsiveWidget
                                                        .isMediumScreen(context)
                                                    ? 40
                                                    : 55.0,
                                                right: ResponsiveWidget
                                                        .isMediumScreen(context)
                                                    ? 20
                                                    : 55),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.15,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextFormField(
                                                        cursorColor:
                                                            const Color(
                                                                0x0072bc),
                                                        decoration:
                                                            const InputDecoration(
                                                                suffixIcon: Icon(Icons
                                                                    .location_on),
                                                                suffixIconColor:
                                                                    Color(
                                                                        0x0072bc),

                                                                //suffixText: "Locate Me",
                                                                hintText:
                                                                    "Enter your Location",
                                                                // labelText: "Name",
                                                                focusColor: Color(
                                                                    0xFF0C9869),
                                                                // labelS 0xFF0C9869tyle: TextStyle(color: Colors.black),
                                                                fillColor: Color(
                                                                    0xFF0C9869),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius
                                                                            .zero),
                                                                    borderSide: BorderSide(
                                                                        color: Color(
                                                                            0xFF0C9869),
                                                                        style: BorderStyle
                                                                            .solid)),
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius
                                                                            .zero),
                                                                    borderSide: BorderSide(
                                                                        width: 2,
                                                                        color: Color(0xFF0C9869),
                                                                        style: BorderStyle.solid)),
                                                                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero), borderSide: BorderSide(color: Color(0xffffbd59), style: BorderStyle.solid))),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      textMethod(
                                                          "Get The Services In Your Location"),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          textMethod1(
                                                              "Malout  "),
                                                          textMethod2(
                                                              "Bhatinda  "),
                                                          textMethod1(
                                                              "Dabwali  "),
                                                          textMethod2("&  "),
                                                          textMethod1(
                                                              "more..."),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                ElevatedButton(
                                                    onPressed: () {},
                                                    style: ButtonStyle(
                                                        padding: MaterialStateProperty
                                                            .all<EdgeInsets>(
                                                                const EdgeInsets.all(
                                                                    26)),
                                                        backgroundColor:
                                                            MaterialStateProperty.all<Color>(
                                                                const Color(
                                                                    themeColor)),
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.zero,
                                                        ))),
                                                    child: Text2(
                                                        weigth: false,
                                                        size: 0.015,
                                                        text: 'Locate Me',
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),

                                          // Row(
                                          //   children: [
                                          //     textMethod1("Ahmedabad"),

                                          // textMethod("Bangalore"),
                                          //  textMethod1("Chennai"),
                                          // textMethod("Delhi"),
                                          //  textMethod1("Gurgaon"),
                                          // textMethod(" Hyderabad"),
                                          //  textMethod1(" Kolkata"),
                                          // textMethod(" Mumbai"),
                                          //  textMethod1("Pune"),
                                          //   textMethod(" & "),
                                          //   textMethod1("more."),
                                          //     ],
                                          // ),
                                          //
                                          //         Container(
                                          //           height: MediaQuery.of(context).size.height*0.1,
                                          //           width: MediaQuery.of(context).size.width*0.5,
                                          //           decoration: BoxDecoration(border: Border.all (color: Color.fromARGB(255, 38, 122, 190), width: 3),),
                                          //         ),
                                        ]),
                                  ]),
                            ]))),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    Expanded(
                      flex: 2,
                      child: Container(
                          width: MediaQuery.of(context).size.height * 0.37,
                          height: ResponsiveWidget.isMediumScreen(context)
                              ? MediaQuery.of(context).size.height * 0.5
                              : MediaQuery.of(context).size.height * 0.66,
                          child: Image.asset(
                            "assets/c78de67c6d0c83cf380fccdb0a2b167e.jpg",
                            fit: BoxFit.cover,
                          )),
                    ),
                  ]),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height:
                    //     ResponsiveWidget.isMediumScreen(context) ? 250 : 500,
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    color: const Color(themeColor2),
                    child: Column(children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                "assets/Group 7.png",
                                height: ResponsiveWidget.isMediumScreen(context)
                                    ? 120
                                    : 156,
                              ),
                              SizedBox(
                                height: ResponsiveWidget.isMediumScreen(context)
                                    ? MediaQuery.of(context).size.height * 0.03
                                    : MediaQuery.of(context).size.height * 0.05,
                              ),
                              Center(
                                child: SelectableText1(
                                  data: "NOW BOOK DOCTOR ONLINE",
                                  max: ResponsiveWidget.isMediumScreen(context)
                                      ? 11
                                      : 14,
                                  clr: Colors.black,
                                  weight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: ResponsiveWidget.isMediumScreen(context)
                                    ? MediaQuery.of(context).size.height * 0.01
                                    : MediaQuery.of(context).size.height * 0.02,
                              ),
                              Center(
                                child: SelectableText1(
                                  data: "BOOK APPOINMENT FOR YOURSELF ",
                                  max: ResponsiveWidget.isMediumScreen(context)
                                      ? 11
                                      : 14,
                                  clr: Colors.black,
                                  weight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/Group 7.png",
                                    height:
                                        ResponsiveWidget.isMediumScreen(context)
                                            ? 120
                                            : 156,
                                  ),
                                  SizedBox(
                                    height: ResponsiveWidget.isMediumScreen(
                                            context)
                                        ? MediaQuery.of(context).size.height *
                                            0.03
                                        : MediaQuery.of(context).size.height *
                                            0.05,
                                  ),
                                  Center(
                                    child: SelectableText1(
                                      data: "GET DOCTOR NEARBY YOU ",
                                      max: ResponsiveWidget.isMediumScreen(
                                              context)
                                          ? 11
                                          : 14,
                                      clr: Colors.black,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: ResponsiveWidget.isMediumScreen(
                                            context)
                                        ? MediaQuery.of(context).size.height *
                                            0.01
                                        : MediaQuery.of(context).size.height *
                                            0.02,
                                  ),
                                  Center(
                                    child: SelectableText1(
                                      data:
                                          "TRACK YOUR SURROUNDING DOCTOR WITH OUR LATEST ETA SYSTEM",
                                      max: ResponsiveWidget.isMediumScreen(
                                              context)
                                          ? 11
                                          : 14,
                                      clr: Colors.black,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/Group 7.png",
                                    height:
                                        ResponsiveWidget.isMediumScreen(context)
                                            ? 120
                                            : 156,
                                  ),
                                  SizedBox(
                                    height: ResponsiveWidget.isMediumScreen(
                                            context)
                                        ? MediaQuery.of(context).size.height *
                                            0.03
                                        : MediaQuery.of(context).size.height *
                                            0.05,
                                  ),
                                  Center(
                                    child: SelectableText1(
                                      data: "FAST DELIVERY",
                                      max: ResponsiveWidget.isMediumScreen(
                                              context)
                                          ? 11
                                          : 14,
                                      clr: Colors.black,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: ResponsiveWidget.isMediumScreen(
                                            context)
                                        ? MediaQuery.of(context).size.height *
                                            0.01
                                        : MediaQuery.of(context).size.height *
                                            0.02,
                                  ),
                                  Center(
                                    child: SelectableText1(
                                      data:
                                          "GET MEDICINES AND PRODUCTS WITH THE LIGHTNING FAST DELIVERY",
                                      max: ResponsiveWidget.isMediumScreen(
                                              context)
                                          ? 11
                                          : 14,
                                      clr: Colors.black,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ]),
                  ),
                  Container(
                      height: 200,
                      color: Color(0xfffcfcfc),
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SelectableText(
                                          "Health Services\nin your pocket",
                                          style: GoogleFonts.aBeeZee(
                                              fontSize: ResponsiveWidget
                                                      .isMediumScreen(context)
                                                  ? 24
                                                  : 34,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SelectableText(
                                        "Get Appointment from your required HealthCare Professional\n& other services on the go, with the all-new HealthCare app.",
                                        style: GoogleFonts.aBeeZee(
                                            fontSize:
                                                ResponsiveWidget.isMediumScreen(
                                                        context)
                                                    ? 10
                                                    : 14,
                                            color: Colors.black54,
                                            letterSpacing: 1.5,
                                            wordSpacing: 2.0),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ])),
                          ]))
                ])));
  }

  // SelectableText selectableTabText(text) {
  //   return selectableTabText();
  // }

  Text textMethod1(text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 17),
    );
  }

  Text textMethod2(text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.lightGreen, fontWeight: FontWeight.bold, fontSize: 17),
    );
  }

  Text textMethod(text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 15),
    );
  }
}

class selectableTabText extends StatelessWidget {
  String text;
  selectableTabText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      textAlign: TextAlign.start,
      style: GoogleFonts.firaSans(
          fontSize: ResponsiveWidget.isMediumScreen(context) ? 17 : 25,
          fontWeight: FontWeight.w700,
          color: Colors.black87),
    );
  }
}
// 36a03d green
// #0072bc blue
