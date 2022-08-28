import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_web/utils/constants.dart';
import 'package:healthcare_web/widgets/text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageUplaodButton extends StatelessWidget {
  const ImageUplaodButton(
      {Key? key,
      required this.imageController,
      required this.text,
      required this.color,
      required this.uploadType})
      : super(key: key);

  final imageController;
  final String text;
  final Color color;
  final String uploadType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          Container(
            height: 150,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: ,
              children: [
                GestureDetector(
                  onTap: () {
                    uploadType == "IdProofBack"
                        ? imageController.pickImageIdBack(ImageSource.camera)
                        : uploadType == "IdProofFront"
                            ? imageController
                                .pickImageIdFront(ImageSource.camera)
                            : imageController.pickImage(ImageSource.camera);
                    Get.back();
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                      ),
                      Text1(
                          text: "Camera",
                          color: const Color(themeColor),
                          size: 25)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    uploadType == "IdProofBack"
                        ? imageController.pickImageIdBack(ImageSource.gallery)
                        : uploadType == "IdProofFront"
                            ? imageController
                                .pickImageIdFront(ImageSource.gallery)
                            : imageController.pickImage(ImageSource.gallery);
                    Get.back();
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.image,
                        color: Colors.grey,
                      ),
                      Text1(
                          text: "Gallery",
                          color: const Color(themeColor),
                          size: 25)
                    ],
                  ),
                ),
              ],
            ),
          ),
          isDismissible: true,
        );
      },
      child: Text2(weigth: true, size: 0.02, text: text, color: color),
    );
  }
}

class ImageTextButton extends StatelessWidget {
  const ImageTextButton({
    required this.image,
    required this.name,
    Key? key,
  }) : super(key: key);

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(
              MediaQuery.of(context).size.height < 800 ? 8 : 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: MediaQuery.of(context).size.height < 700 ? 10 : 15,
                    child: Image.asset(image)),
              ),
              Text(
                name,
                style: const TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class TextFormsEdited extends StatelessWidget {
//   const TextFormsEdited({
//     required this.text,
//     required this.labelText,
//     Key? key,
//   }) : super(key: key);
//   final String text;
//   final String labelText;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             text,
//             style: const TextStyle(
//                 color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           Container(
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(color: Colors.grey, width: 2),
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(10),
//                 )),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 hintText: labelText,
//                 suffixIcon: text != "Email"
//                     ? GestureDetector(
//                         child: const Icon(
//                           Icons.remove_red_eye,
//                           color: Color(themeColor),
//                         ),
//                       )
//                     : null,
//                 prefixIcon: Container(
//                   width: 10,
//                   child: text == "Email"
//                       ? const Icon(Icons.email_outlined)
//                       : Icon(Icons.password),
//                 ),
//                 hintStyle: TextStyle(
//                     color: Colors.black54,
//                     fontSize: ResponsiveWidget.isDesktop(context)
//                         ? 20
//                         : ResponsiveWidget.isTablet(context)
//                             ? 15
//                             : 0),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TextFormsEdited2 extends StatelessWidget {
//   TextFormsEdited2({
//     required this.text,
//     required this.obsecure,
//     required this.labelText,
//     required this.con,
//     //this.needValidator=false,
//     Key? key,
//   }) : super(key: key);
//   final String text;
//   final String labelText;
//   bool obsecure = false;
//   late TextEditingController con;
//   //bool needValidator;

//   @override
//   Widget build(BuildContext context) {
//     String? validatorEmail(String value) {
//       if (AuthController.authInstance.firebaseUser.value == null) {
//         if (value.isEmpty && !(value.contains("@"))) {
//           return "Enter a valid Email";
//         }
//       }
//       return null;
//     }

//     String? validatePassword(String value) {
//       //Added the regular expression which contains all the possible values for the condition of password
//       if (AuthController.authInstance.firebaseUser.value == null) {
//         if ((value.length < 8)) {
//           return 'Please enter password of 8 character';
//         }
//         if (value.isEmpty) {
//           return 'Please enter password';
//         }
//         if ((!value.contains(RegExp(r"[a-z]"))) ||
//             (!value.contains(RegExp(r"[A-Z]"))) ||
//             (!value.contains(RegExp(r"[0-9]"))) ||
//             (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')))) {
//           return "Please enter a valid password";
//         }
//       }
//       return null;
//     }

//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             text,
//             style: const TextStyle(
//                 color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             //focusNode: FocusNode(),
//             obscureText: obsecure,
//             controller: con,
//             keyboardType: text == "Email"
//                 ? TextInputType.emailAddress
//                 : text == "Password"
//                     ? TextInputType.visiblePassword
//                     : TextInputType.text,
//             decoration: InputDecoration(
//               //errorText: text=="Email"?validatorEmail(con.text):text=="Password"?validatePassword(con.text):null,
//               hintText: labelText,
//               errorText: text == "Password"
//                   ? validatePassword(text.trim())
//                   : text == "Email"
//                       ? validatorEmail(text.trim())
//                       : null,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),

//               suffixIcon: text == "Password"
//                   ? GestureDetector(
//                       onTap: () {
//                         obsecure == true ? obsecure = false : null;
//                       },
//                       child: const Icon(
//                         Icons.remove_red_eye,
//                         color: Color(themeColor),
//                       ),
//                     )
//                   : null,
//               prefixIcon: Container(
//                 width: 10,
//                 child: text == "Email"
//                     ? const Icon(Icons.email_outlined)
//                     : text == "Name"
//                         ? const Icon(Icons.text_fields)
//                         : const Icon(Icons.password),
//               ),
//               hintStyle: TextStyle(
//                   color: Colors.black54,
//                   fontSize: ResponsiveWidget.isDesktop(context)
//                       ? 20
//                       : ResponsiveWidget.isTablet(context)
//                           ? 15
//                           : 0),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ContainerButton extends StatelessWidget {
  ContainerButton({
    required this.text,
    required this.padding,
    required this.page,
    required this.boxColor,
    required this.textColor,
    Key? key,
  }) : super(key: key);
  final String text;
  var padding;
  final String page;
  final Color textColor;
  final Color boxColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Get.toNamed("$page");
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: boxColor,
              border: Border.all(color: const Color(themeColor))),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.saira(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    letterSpacing: 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IconTextForm extends StatelessWidget {
  const IconTextForm({
    required this.iconName,
    required this.name,
    required this.max,
    required this.min,
    required this.controller,
    //required this.initial,
    Key? key,
  }) : super(key: key);
  final Icon iconName;
  final String name;
  final int max;
  final int min;
  final TextEditingController controller;
  //final initial ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        //initialValue: initial,
        textCapitalization: name == "Practice Name" || name == "Name"
            ? TextCapitalization.words
            : TextCapitalization.none,
        controller: controller,
        maxLines: max,
        minLines: min,
        decoration: InputDecoration(
          icon: iconName,
          hoverColor: Color(themeColor),
          label: Text(
            "$name",
            style: TextStyle(color: Color(themeColor)),
          ),
        ),
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  Color color;
  CustomBackButton({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: color,
      ),
    );
  }
}

class AddsBanner extends StatelessWidget {
  const AddsBanner({
    this.image = "assets/Hospital.png",
    Key? key,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('inventory/post_folder/post')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(themeColor),
              ),
            );
          }
          //List<Widget> imageSliders = imgList.map((item) => Container(height:200,width:100,child: Image.network(item, fit: BoxFit.cover,)),).toList();
          List<Widget> sliders = [];
          for (var i in snapshot.data!.docs) {
            final imageData = slideroffers(context, Get.height, Get.width,
                i.get('image'), i.get("nick"), i.get("name"), i.get("route"));
            sliders.add(imageData);
          }

          return CarouselSlider(
            options: CarouselOptions(
              height: Get.height * 0.23,
              pauseAutoPlayInFiniteScroll: true,
              autoPlay: true,
              enlargeCenterPage: true,
              // autoPlayCurve: Curves.easeInCirc,
              autoPlayInterval: Duration(seconds: 5),
            ),
            items: sliders,
          );
        });
  }

  Widget slideroffers(BuildContext context, double height, double width,
      String link, String key, String name, String route) {
    return InkWell(
      onTap: () {
        Get.toNamed(route);
      },
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ProgressiveImage(
            placeholder: const AssetImage('assets/chat_background.png'),
            thumbnail: const AssetImage('assets/chat_background.png'),
            image: NetworkImage('$link'),
            height: height * 0.25,
            width: width * 0.9,
          ),
        ),
      ),
    );
  }
}

class InsideTopBar extends StatelessWidget {
  InsideTopBar({
    required this.hint_text,
    required this.type,
    Key? key,
  }) : super(key: key);

  final String hint_text;
  final String type;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(color: Color(themeColor2)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                Text1(text: hint_text, color: Colors.black, size: 22),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                type == "Medicine"
                    ? Get.toNamed("/searchMedicine")
                    : Get.toNamed("/searchPage");
              },
              child: Container(
                height: height * 0.05,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    //border: Border.all(color: Colors.grey,width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.01,
                    ),
                    const Icon(
                      Icons.search,
                      color: Color(themeColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text2(
                          weigth: false,
                          size: 0.017,
                          text: hint_text,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CenterImage extends StatelessWidget {
  CenterImage({
    Key? key,
    required this.name,
  }) : super(key: key);
  String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/$name.png"), fit: BoxFit.fitHeight)),
      ),
    );
  }
}

class CustomIconText extends StatelessWidget {
  const CustomIconText({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          icon,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text2(
                weigth: true,
                size: 0.025,
                text: text,
                color: Color(themeColor)),
          )
        ],
      ),
    );
  }
}

class ShowImage extends StatelessWidget {
  final String imageUrl;
  final String name;

  const ShowImage({required this.imageUrl, required this.name, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: Row(
          children: [
            Text2(weigth: true, size: 0.02, text: name, color: Colors.black),
          ],
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: ProgressiveImage(
        placeholder: const AssetImage('assets/chat_background.png'),
        thumbnail: const AssetImage('assets/chat_background.png'),
        image: NetworkImage(imageUrl),
        fit: BoxFit.contain,
        height: size.height,
        width: size.width,
      ),
      // Container(
      //   height: size.height,
      //   width: size.width,
      //   color: Colors.black,
      //   child: CachedNetworkImage(
      //     imageUrl: imageUrl,
      //     placeholder: (context, url) => const Center(
      //         child: CircularProgressIndicator(
      //       color: Color(themeColor),
      //     )),
      //     errorWidget: (context, url, error) => const Icon(Icons.error),
      //   ),
      // ),
    );
  }
}

class LabCallUs extends StatelessWidget {
  const LabCallUs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("assets/no_doctor_image.png"),
                    fit: BoxFit.contain,
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text1(
                    text: "Talk to HealthCare experts to book tests",
                    color: Colors.black,
                    size: 14),
                Text1(
                    text:
                        "You will be able to connect with the HealthCare experts",
                    color: Colors.grey,
                    size: 10),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            launch("tel:${"9478748983"}!");
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(themeColor),
                border: Border.all(color: const Color(themeColor))),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  Text(
                    "Call us to book tests",
                    style: GoogleFonts.saira(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomeListTile extends StatelessWidget {
  String text1;
  String text2;
  String route;
  Icon icon;
  CustomeListTile({
    required this.text1,
    required this.text2,
    required this.route,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text2(
        weigth: true,
        color: Colors.black,
        size: 0.018,
        text: text1,
      ),
      subtitle: Text2(
        weigth: true,
        color: Colors.grey,
        size: 0.015,
        text: text2,
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Get.toNamed(route)!;
      },
    );
  }
}

Widget studioSlider(
    String thumbnail, String title, bool live, String videoId, String about) {
  return InkWell(
      onTap: () {
        Get.toNamed("/player/$videoId", arguments: "$about");
      },
      child: SizedBox(
        //margin: EdgeInsets.only(left: 8, right: 8),
        //height: Get.height * 0.29,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //margin: EdgeInsets.only(left: 8,right: 8),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(10),
                  //borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20) ),
                  image: DecorationImage(
                      image: NetworkImage("$thumbnail"), fit: BoxFit.fill)),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 50,
                  width: 50,
                  child: Image.asset("assets/logo1.png"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15,
                            )),
                        Text("Video Recomended by HeaalthCare",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.aBeeZee(
                              //fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 13,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            //Text1(text: "$title", size: Get.height*0.017,color:Colors.black)
          ],
        ),
      )
      // Stack(
      //   children: [
      //     Align(
      //       alignment: Alignment.bottomCenter,
      //       child: Container(
      //         // decoration: const BoxDecoration(
      //         //     borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20) ),
      //         //     //image: DecorationImage(image: NetworkImage("$thumbnail"),fit: BoxFit.fill)
      //         // ),
      //         alignment: Alignment.bottomCenter,
      //         height: Get.height*0.09,
      //         padding: EdgeInsets.all(5),
      //         color: Color(themeColor2),
      //         child: Row(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             // Container(
      //             //   height: 50,
      //             //   width: 50,
      //             //   padding: EdgeInsets.all(5),
      //             //   decoration: BoxDecoration(
      //             //       color: Colors.white,
      //             //       shape: BoxShape.circle,
      //             //       image: DecorationImage(image: NetworkImage("$channelLogo"),
      //             //           fit: BoxFit.fill
      //             //       )
      //             //   ),
      //             //
      //             // ),
      //             SizedBox(width: 5,),
      //
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Wrap(
      //                   children: [
      //                     SizedBox(
      //                         width: Get.width*0.72,
      //                         child: Text1(text: "$title", size: Get.height*0.017,color:Colors.white)),
      //                   ],
      //                 ),
      //                 //SizedBox(height: 2,),
      //               ],
      //             ),
      //
      //           ],
      //         ),
      //       ),
      //     ),
      //     // live?Padding(
      //     //     padding: const EdgeInsets.only(left: 10,top:8.0),
      //     //     child: ElevatedButton(
      //     //       style: ElevatedButton.styleFrom(primary: Colors.red,shape: StadiumBorder(),elevation: 20),
      //     //       onPressed: (){},
      //     //       child: Text1(data: "Live",max: 12,min: 12,clr: Colors.white,),
      //     //     )
      //     // ):SizedBox(),
      //   ],
      // ),
      );
}
