import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_web/Responsive.dart';
import 'package:healthcare_web/widgets/text.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'dart:html' as html;

class NewBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // const _url =
    //     'https://play.google.com/store/apps/details?id=com.pujapurohit.android.infopujapurohit';
    // Future<void> _launchInBrowser(String url) async {
    //   if (await canLaunch(url)) {
    //     await launch(
    //       url,
    //       forceSafariVC: false,
    //       forceWebView: false,
    //       headers: <String, String>{'my_header_key': 'my_header_value'},
    //     );
    //   } else {
    //     throw 'Could not launch $url';
    //   }
    // }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 0.04,
        ),
        Text(
          'HealthCare',
          style: GoogleFonts.aclonica(
              color: Colors.black54, fontSize: 26, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text1(
                    text: "COMPANY",
                    size: ResponsiveWidget.isMediumScreen(context) ? 18 : 22,
                    color: Colors.black87,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  bottom_tabs(
                      "About us",
                      "",
                      ResponsiveWidget.isMediumScreen(context) ? 18 : 22,
                      ResponsiveWidget.isMediumScreen(context) ? 16 : 20),
                  const SizedBox(
                    height: 10,
                  ),
                  bottom_tabs(
                      "Contact",
                      "",
                      ResponsiveWidget.isMediumScreen(context) ? 18 : 22,
                      ResponsiveWidget.isMediumScreen(context) ? 16 : 20),
                  // SizedBox(height: 10,),
                  // bottom_tabs("Investor Relations"),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text1(
                    text: "FOR PARTNERS",
                    size: ResponsiveWidget.isMediumScreen(context) ? 18 : 22,
                    color: Colors.black87,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  bottom_tabs(
                      "Become Doctor",
                      "",
                      ResponsiveWidget.isMediumScreen(context) ? 18 : 22,
                      ResponsiveWidget.isMediumScreen(context) ? 16 : 20),
                  const SizedBox(
                    height: 10,
                  ),
                  bottom_tabs(
                      "Become Lab Testers",
                      "",
                      ResponsiveWidget.isMediumScreen(context) ? 18 : 22,
                      ResponsiveWidget.isMediumScreen(context) ? 16 : 20),
                  const SizedBox(
                    height: 10,
                  ),
                  bottom_tabs(
                      "Become Medicine Provider",
                      "",
                      ResponsiveWidget.isMediumScreen(context) ? 18 : 22,
                      ResponsiveWidget.isMediumScreen(context) ? 16 : 20),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text1(
                    text: "FOR YOU",
                    size: ResponsiveWidget.isMediumScreen(context) ? 18 : 22,
                    color: Colors.black87,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  bottom_tabs(
                      "Privacy",
                      "",
                      ResponsiveWidget.isMediumScreen(context) ? 18 : 22,
                      ResponsiveWidget.isMediumScreen(context) ? 16 : 20),
                  const SizedBox(
                    height: 10,
                  ),
                  bottom_tabs(
                      "Terms & Conditions",
                      "",
                      ResponsiveWidget.isMediumScreen(context) ? 18 : 22,
                      ResponsiveWidget.isMediumScreen(context) ? 16 : 20),
                  const SizedBox(
                    height: 10,
                  ),
                  bottom_tabs(
                      "Refund & Cancellation",
                      "",
                      ResponsiveWidget.isMediumScreen(context) ? 18 : 22,
                      ResponsiveWidget.isMediumScreen(context) ? 16 : 20),
                  const SizedBox(
                    height: 10,
                  ),
                  bottom_tabs(
                      "Security",
                      "",
                      ResponsiveWidget.isMediumScreen(context) ? 18 : 22,
                      ResponsiveWidget.isMediumScreen(context) ? 16 : 20),
                  const SizedBox(
                    height: 10,
                  ),
                  // bottom_tabs("Payments", "/payments"),
                  // SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text2(
                    text: "Social Links",
                    size: 0.024,
                    color: Colors.black87,
                    weigth: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Link(
                          target: LinkTarget.blank,
                          uri: Uri.parse('https://twitter.com/HealthC79548552'),
                          builder: (_, link) {
                            return InkWell(
                                onTap: link,
                                child: const Icon(LineIcons.twitter));
                          }),
                      Link(
                          target: LinkTarget.blank,
                          uri: Uri.parse(
                              'https://www.instagram.com/healthcare_startup/'),
                          builder: (_, link) {
                            return InkWell(
                                onTap: link,
                                child: const Icon(LineIcons.instagram));
                          }),
                      Link(
                          target: LinkTarget.blank,
                          uri: Uri.parse(
                              'https://www.linkedin.com/in/healthcare-startup-b0596b248/'),
                          builder: (_, link) {
                            return InkWell(
                                onTap: link,
                                child: const Icon(LineIcons.linkedin));
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text2(
                    text: "© 2022 HealthCare",
                    size: 0.024,
                    color: Colors.black87,
                    weigth: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget bottom_tabs(String data, String route, double size1, double size2) {
    return Link(
        uri: Uri.parse("$route"),
        builder: (_, link) {
          return InkWell(
            onTap: link,
            hoverColor: Colors.transparent,
            child: HoverWidget(
                onHover: (event) {},
                hoverChild: Text1(
                  text: "$data",
                  size: size1,
                  color: Colors.black54,
                ),
                child: Text1(
                  text: "$data",
                  size: size2,
                  color: Colors.black54,
                )),
          );
        });
  }
}

class MobileBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // const _url =
    //     'https://play.google.com/store/apps/details?id=com.pujapurohit.android.infopujapurohit';
    // Future<void> _launchInBrowser(String url) async {
    //   if (await canLaunch(url)) {
    //     await launch(
    //       url,
    //       forceSafariVC: false,
    //       forceWebView: false,
    //       headers: <String, String>{'my_header_key': 'my_header_value'},
    //     );
    //   } else {
    //     throw 'Could not launch $url';
    //   }
    // }

    return Column(
      children: [
        Text2(
          text: "Social Links",
          size: 14,
          color: Colors.black87,
          weigth: true,
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Link(
                target: LinkTarget.blank,
                uri: Uri.parse('https://twitter.com/infopujapurohit'),
                builder: (_, link) {
                  return InkWell(onTap: link, child: Icon(LineIcons.twitter));
                }),
            Link(
                target: LinkTarget.blank,
                uri: Uri.parse('https://www.facebook.com/infopujapurohit'),
                builder: (_, link) {
                  return InkWell(onTap: link, child: Icon(LineIcons.facebook));
                }),
            Link(
                target: LinkTarget.blank,
                uri: Uri.parse('https://www.instagram.com/infopujapurohit'),
                builder: (_, link) {
                  return InkWell(onTap: link, child: Icon(LineIcons.instagram));
                }),
            Link(
                target: LinkTarget.blank,
                uri: Uri.parse('https://www.linkedin.com/company/75550525'),
                builder: (_, link) {
                  return InkWell(onTap: link, child: Icon(LineIcons.linkedin));
                }),
            Link(
                target: LinkTarget.blank,
                uri: Uri.parse(
                    'https://www.youtube.com/channel/UCtCe77a3YY6NR3snGPvhlxg'),
                builder: (_, link) {
                  return InkWell(onTap: link, child: Icon(LineIcons.youtube));
                }),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
            onTap: () {
              // _launchInBrowser(_url);
            },
            child: Image.asset(
              "assets/images/google-play-badge.png",
              height: height * 0.07,
            )),
        SizedBox(
          height: 10,
        ),
        Text2(
          text: "© 2022 HealthCare",
          size: 14,
          color: Colors.black87,
          weigth: true,
        ),
      ],
    );
  }
}

class HoverWidget extends StatefulWidget {
  final Widget child;
  final Widget hoverChild;
  final void Function(PointerEnterEvent event) onHover;
  HoverWidget(
      {Key? key,
      required this.child,
      required this.hoverChild,
      required this.onHover})
      : super(key: key);

  @override
  _HoverWidgetState createState() => _HoverWidgetState();
}

class _HoverWidgetState extends State<HoverWidget> {
  bool _isHover = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHover = true;
        });
        widget.onHover(event);
      },
      onExit: (event) {
        setState(() {
          _isHover = false;
        });
      },
      child: _isHover ? widget.hoverChild : widget.child,
    );
  }
}
