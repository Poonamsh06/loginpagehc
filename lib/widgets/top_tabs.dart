import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_web/Responsive.dart';
import 'package:healthcare_web/utils/constants.dart';
import 'package:healthcare_web/widgets/text.dart';
import 'package:line_icons/line_icons.dart';

class TopTabs extends StatelessWidget {
  final VoidCallback? signIn;
  final String? route;
  final VoidCallback? home;
  final VoidCallback? locationCall;
  // AuthenticationController authController = Get.find();
  // // UserController userController = Get.put(UserController());
  // LoginController loginController = Get.put(LoginController());

  TopTabs({super.key, this.signIn, this.route, this.home, this.locationCall});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          //color: Color(0xffFFFAF3),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      width: width,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      home != null ? home!() : Get.toNamed('/home');
                    },
                    child: Image.asset(
                      'assets/logo1.png',
                      fit: BoxFit.fill,
                      height: ResponsiveWidget.isSmallScreen(context) ? 40 : 60,
                      width: ResponsiveWidget.isSmallScreen(context) ? 40 : 60,
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {
                      //locationCall!();
                    },
                    child: Row(
                      children: [
                        Text("Malout, 152107, Punjab"),
                        Icon(
                          Icons.location_on,
                          color: Colors.orangeAccent,
                          size:
                              ResponsiveWidget.isSmallScreen(context) ? 12 : 16,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () {
                        //locationCall!();
                      },
                      child: Row(
                        children: [
                          Text1(
                              text: "Search", color: Colors.black54, size: 18),
                          Icon(
                            Icons.search,
                            color: Colors.black54,
                            size: ResponsiveWidget.isSmallScreen(context)
                                ? 12
                                : 25,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () {
                        //locationCall!();
                      },
                      child: Row(
                        children: [
                          Text1(text: "Help", color: Colors.black54, size: 18),
                          Icon(
                            Icons.help,
                            color: Colors.black54,
                            size: ResponsiveWidget.isSmallScreen(context)
                                ? 12
                                : 25,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () {
                        //locationCall!();
                      },
                      child: Row(
                        children: [
                          Text1(
                              text: "Support Chat",
                              color: Colors.black54,
                              size: 18),
                          Icon(
                            Icons.support_agent,
                            color: Colors.black54,
                            size: ResponsiveWidget.isSmallScreen(context)
                                ? 12
                                : 25,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () {
                        //locationCall!();
                      },
                      child: Row(
                        children: [
                          Text1(
                              text: "Account", color: Colors.black54, size: 18),
                          Icon(
                            LineIcons.user,
                            color: Colors.black54,
                            size: ResponsiveWidget.isSmallScreen(context)
                                ? 12
                                : 25,
                          )
                        ],
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
