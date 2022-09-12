import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_web/controller/login_controller.dart';
import 'package:healthcare_web/utils/constants.dart';
import 'package:healthcare_web/views/home.dart';
import 'package:healthcare_web/widgets/bottom_bar.dart';
import '../../Responsive.dart';
import '../../controller/auth_controller.dart';
import '../../widgets/text.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //final _formkey = GlobalKey<FormState>();

  //final TextEditingController phoneNumber = TextEditingController();
  final uuid = AuthController.authInstance.firebaseUser.value?.uid;
  bool isSecurePassword = true;
  LogInController logInController = Get.put(LogInController());
  @override
  Widget build(BuildContext context) {
       String? validatorEmail(String value) {
      if (value.isEmpty && !(value.contains("@"))) {
        return "Enter a valid Email";
      }
      return null;
    }

    String? validatePassword(String value) {
      //Added the regular expression which contains all the possible values for the condition of password
      if ((value.length < 8)) {
        return 'Please enter password of 8 character';
      }
      if (value.isEmpty) {
        return 'Please enter password';
      }
      if ((!value.contains(RegExp(r"[a-z]"))) ||
          (!value.contains(RegExp(r"[A-Z]"))) ||
          (!value.contains(RegExp(r"[0-9]"))) ||
          (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')))) {
        return "Please enter a valid password";
      }
      return null;
    }
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
                                            onTap: () {
                                              Get.defaultDialog(
                                                  title: "Login",
                                                  backgroundColor:
                                                      Color(themeColor2),
                                                  content: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          right: 10,
                                                          left: 10,
                                                        ),
                                                        child: SizedBox(
                                                          width:MediaQuery.of(context).size.width*0.21  ,
                                                          child: TextFormField(
                                                             keyboardType: TextInputType.emailAddress,
                                                              key: const ValueKey("Email"),
                  controller: emailController,
                                                            cursorColor: Color(
                                                                themeColor),
                                                            decoration: InputDecoration(
                                                                prefixIcon: Icon(
                                                                  Icons
                                                                      .text_fields,
                                                                  color: Color(
                                                                      themeColor),
                                                                ),
                                                                hintStyle: GoogleFonts.aBeeZee(color: Colors.black54, fontSize: 15),
                                                                hintText: "Email",
                                                                // labelText: "Name",
                                                                 

                                                                focusColor: Color(themeColor),
                                                                // labelStyle: TextStyle(color: Colors.black),

                                                                focusedBorder: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.all(
                                                                      Radius.circular(
                                                                          10.0),
                                                                    ),
                                                                    borderSide: BorderSide(color: Color(themeColor), style: BorderStyle.solid)),
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.all(
                                                                      Radius.circular(
                                                                          10.0),
                                                                    ),
                                                                    borderSide: BorderSide(color: Color(themeColor), style: BorderStyle.solid)),
                                                                border: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.all(
                                                                      Radius.circular(
                                                                          10.0),
                                                                    ),
                                                                    borderSide: BorderSide(color: Color(themeColor), style: BorderStyle.solid))),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          right: 10,
                                                          left: 10,
                                                        ),
                                                        child: SizedBox(
                                                        

                                                            width:MediaQuery.of(context).size.width*0.21  ,

                                                          child: TextFormField(
                                                             key: const ValueKey("Password"),
                  controller: passwordController,
                                                            cursorColor: Color(
                                                                themeColor),
                                                            decoration: InputDecoration(
                                                                prefixIcon: Icon(
                                                                  Icons
                                                                      .password,
                                                                  color: Color(
                                                                      themeColor),
                                                                ),
                                                                hintStyle: GoogleFonts.aBeeZee(color: Colors.black54, fontSize: 15),
                                                                hintText: "Password",
                                                                // labelText: "Name",

                                                                focusColor: Color(themeColor),
                                                                suffixIcon: IconButton(
                                                                    icon: const Icon(Icons.remove_red_eye,color: Color(themeColor),),
                                                                    onPressed: () {
                                                                      bool canSee=!logInController.see.value;
                                                                      logInController.change(canSee);
                                                                      print("eye");
                                                                      setState(() {
                                                                        isSecurePassword = !isSecurePassword;
                                                                      });
                                                                    }),

                                                                // labelStyle: TextStyle(color: Colors.black),

                                                                focusedBorder: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.all(
                                                                      Radius.circular(
                                                                          10.0),
                                                                    ),
                                                                    borderSide: BorderSide(color: Color(themeColor), style: BorderStyle.solid)),
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.all(
                                                                      Radius.circular(
                                                                          10.0),
                                                                    ),
                                                                    borderSide: BorderSide(color: Color(themeColor), style: BorderStyle.solid)),
                                                                border: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.all(
                                                                      Radius.circular(
                                                                          10.0),
                                                                    ),
                                                                    borderSide: BorderSide(color: Color(themeColor), style: BorderStyle.solid))),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {},
                                                            child: Text1(
                                                                text:
                                                                    "Forget Password",
                                                                color: const Color(
                                                                    themeColor),
                                                                size: 16),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: GestureDetector(
                                                          onTap: () async {
                                                             Get.bottomSheet(
                                                            Obx(() =>
                                                                AuthController.authInstance.isLoading.value == false
                                                                    ? Container(
                                                                        child: Text(""),
                                                                      )
                                                                    : const Center(
                                                                        child: CircularProgressIndicator(
                                                                        color: Colors.white,
                                                                      ))),
                                                            );
                                                            AuthController.authInstance.login(
                                                              emailController.text.trim(),
                                                              passwordController.text.trim(),
                                                            );
                                                            await FirebaseFirestore.instance
                                                                .collection("users")
                                                                .doc("HCID${uuid}")
                                                                .update({
                                                              "token": await FirebaseMessaging.instance.getToken(),
                                                            });
                                                            Get.to(HomePage());
                                                          },
                                                          child: Container(
                                                            //width: double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: const Color(
                                                                  0xFF0C9869),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      12.0),
                                                              child: Center(
                                                                child: Text(
                                                                  "    Log In    ",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headline4!
                                                                      .copyWith(
                                                                          fontSize: MediaQuery.of(context).size.height < 800
                                                                              ? 15
                                                                              : 20,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color: Colors
                                                                              .white,
                                                                          letterSpacing:
                                                                              1),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          const Text(
                                                            "Don't have an Account?",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          ClickableText(
                                                            text: "Sign Up",
                                                            size: 15,
                                                            pageName:
                                                                "/newAccount",
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ));
                                            },
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
                                            onTap: () {
                                              Get.toNamed("/home");
                                            },
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
                                            child: Text(
                                              "We Provide Serives Like...",
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
                                                  height: ResponsiveWidget
                                                          .isMediumScreen(
                                                              context)
                                                      ? MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.17
                                                      : MediaQuery.of(context)
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
                                                        height: 8,
                                                      ),
                                                      textMethod(
                                                          "Get The Services In Your Location"),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Expanded(
                                                        child: Row(
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
                              ? MediaQuery.of(context).size.height * 0.56
                              : MediaQuery.of(context).size.height * 0.66,
                          child: Image.asset(
                            "assets/landing.png",
                            fit: BoxFit.contain,
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/48.png",
                                  height:
                                      ResponsiveWidget.isMediumScreen(context)
                                          ? 120
                                          : 156,
                                ),
                                SizedBox(
                                  height:
                                      ResponsiveWidget.isMediumScreen(context)
                                          ? MediaQuery.of(context).size.height *
                                              0.03
                                          : MediaQuery.of(context).size.height *
                                              0.05,
                                ),
                                Center(
                                  child: SelectableText1(
                                    data: "NOW BOOK DOCTOR ONLINE",
                                    max:
                                        ResponsiveWidget.isMediumScreen(context)
                                            ? 9
                                            : 14,
                                    clr: Colors.black,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      ResponsiveWidget.isMediumScreen(context)
                                          ? MediaQuery.of(context).size.height *
                                              0.01
                                          : MediaQuery.of(context).size.height *
                                              0.02,
                                ),
                                Center(
                                  child: SelectableText1(
                                    data:
                                        "BOOK APPOINTMENT FROM VERIFIED DOCTORS",
                                    max:
                                        ResponsiveWidget.isMediumScreen(context)
                                            ? 9
                                            : 14,
                                    clr: Colors.black,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/49.png",
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
                                      data: "GET LAB TESTING AT YOUR PLACE ",
                                      max: ResponsiveWidget.isMediumScreen(
                                              context)
                                          ? 9
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
                                          "BOOK LAB TESTER NEAR YOU FOR LAB TESTING",
                                      max: ResponsiveWidget.isMediumScreen(
                                              context)
                                          ? 9
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
                                  "assets/gym.png",
                                  height:
                                      ResponsiveWidget.isMediumScreen(context)
                                          ? 120
                                          : 156,
                                ),
                                SizedBox(
                                  height:
                                      ResponsiveWidget.isMediumScreen(context)
                                          ? MediaQuery.of(context).size.height *
                                              0.03
                                          : MediaQuery.of(context).size.height *
                                              0.05,
                                ),
                                Center(
                                  child: SelectableText1(
                                    data: "GET ALL EXCERCISE VIDEOS",
                                    max:
                                        ResponsiveWidget.isMediumScreen(context)
                                            ? 9
                                            : 14,
                                    clr: Colors.black,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      ResponsiveWidget.isMediumScreen(context)
                                          ? MediaQuery.of(context).size.height *
                                              0.01
                                          : MediaQuery.of(context).size.height *
                                              0.02,
                                ),
                                Center(
                                  child: SelectableText1(
                                    data:
                                        "LOOK OUT ANYTHING FOR THE PHYSICAL HEALTH",
                                    max:
                                        ResponsiveWidget.isMediumScreen(context)
                                            ? 9
                                            : 14,
                                    clr: Colors.black,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/47.png",
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
                                      data: "MEDICINE AND OTHER PRODUCTS",
                                      max: ResponsiveWidget.isMediumScreen(
                                              context)
                                          ? 9
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
                                          "GET ITEMS WITH THE LIGHTNING FAST DELIVERY",
                                      max: ResponsiveWidget.isMediumScreen(
                                              context)
                                          ? 9
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
                      //height: 200,
                      color: Color(0xfffcfcfc),
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Center(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SelectableText(
                                            "Health Services\nin your pocket",
                                            style: GoogleFonts.openSans(
                                                fontSize: 34,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SelectableText(
                                          "Get Appointment from your required HealthCare Professional\n& other services on the go, with the all-new HealthCare app.",
                                          style: GoogleFonts.aBeeZee(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              letterSpacing: 1.5,
                                              wordSpacing: 2.0),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ]),
                                )),
                            Expanded(
                                flex: 2,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Image.network(
                                        "https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_768,h_978/pixel_wbdy4n",
                                        height: Get.height * 0.4,
                                        width: Get.width * 0.2,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Image.network(
                                        "https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_768,h_978/iPhone_wgconp_j0d1fn",
                                        height: Get.height * 0.4,
                                        width: Get.width * 0.2,
                                      ),
                                    )
                                  ],
                                ))
                          ])),
                  ResponsiveWidget.isSmallScreen(context)
                      ? SizedBox()
                      : Container(
                          width: Get.width,
                          padding: EdgeInsets.only(
                              left: Get.width * 0.1, right: Get.width * 0.1),
                          //color: Color(0xfff8f8f8),
                          color: const Color(themeColor2),
                          child: NewBottomBar())
                ])));
  }

  // SelectableText selectableTabText(text) {
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
