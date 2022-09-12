import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_web/controller/location_controller.dart';
import 'package:healthcare_web/utils/constants.dart';
import 'package:healthcare_web/views/home.dart';
import 'package:healthcare_web/widgets/text.dart';

import '../firease_constants.dart';
import '../views/landing_page/blanding.dart';
import '../widgets/reusable_widgets.dart';

class AuthController extends GetxController {
  var image = "".obs;
  var name = "".obs;
  var bio = "".obs;
  var mobile = "".obs;
  var location = "Please select the location".obs;
  var selectUserType = "Select User Type".obs;

  static AuthController authInstance = Get.find();
  var isLoading = true.obs;
  late Rx<User?> firebaseUser;
  final TextEditingController _name = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  getUser() async {
    print(firebaseUser.value?.uid);
    await FirebaseFirestore.instance
        .collection("patients/HCID${firebaseUser.value?.uid}/PublicProfile")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        image.value = doc["image"];
        // name=doc["name"];
        // bio=doc["bio"];
        //mobile=doc["mobile"];
      });
    });
  }

  getLoaction() {
    final uuid = AuthController.authInstance.firebaseUser.value?.uid;
    return Get.bottomSheet(
      Center(
        child: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .where("id", isEqualTo: "HCID${uuid}")
                  .snapshots(),
              builder: (context, snapshot) {
                LocationController locationController =
                    Get.put(LocationController());

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Color(themeColor),
                  ));
                }

                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      children: snapshot.data!.docs.map<Widget>((element) {
                    print("location:${element['location']}");
                    TextEditingController _location2 = TextEditingController(
                        text: element['location'] == ""
                            ? ""
                            : "${element['location']}");
                    return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: Color(themeColor2)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Icon(
                                          Icons.my_location,
                                          color: Colors.black54,
                                        ),
                                        Text2(
                                            weigth: true,
                                            size: 0.02,
                                            text: "Current Location",
                                            color: Colors.black54),
                                        GestureDetector(
                                          onTap: () {
                                            locationController.getUserLocation(
                                                element["user_type"]);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: const Color(themeColor),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text1(
                                                text: "Grant",
                                                color: Colors.white,
                                                size: 20),
                                          ),
                                        )
                                      ],
                                    ),
                                    // Text2(
                                    //     weigth: false,
                                    //     size: 0.015,
                                    //     text:
                                    //         "Granting permission will ensure accurate location and hassle free delivery",
                                    //     color: Colors.black54),
                                  ],
                                ),
                              ),
                            ),
                            Text1(
                                text: "Enter Location Manually",
                                color: Colors.black54,
                                size: Get.height * 0.02),
                            IconTextForm(
                              iconName: const Icon(Icons.location_on),
                              name: "Location (city,pincode,state)",
                              controller: _location2,
                              max: 2,
                              min: 1,
                            ),
                            Text1(
                                text: "Have you filled your Profile Details?",
                                color: Colors.black54,
                                size: Get.height * 0.02),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () async {
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc("HCID${uuid}")
                                      .update(
                                          {"location": _location2.text.trim()});

                                  element["user_type"] == "Patient"
                                      ? await FirebaseFirestore.instance
                                          .collection("patients")
                                          .doc("HCID${firebaseUser.value?.uid}")
                                          .collection("PublicProfile")
                                          .doc(firebaseUser.value?.uid)
                                          .update({
                                          "location": _location2.text.trim(),
                                        })
                                      : element["user_type"] == "Doctor"
                                          ? await FirebaseFirestore.instance
                                              .collection("doctor")
                                              .doc(
                                                  "HCID${firebaseUser.value?.uid}")
                                              .update({
                                              "doctor_location":
                                                  _location2.text.trim(),
                                            })
                                          : element["user_type"] == "Lab Tester"
                                              ? await FirebaseFirestore.instance
                                                  .collection("lab_tester")
                                                  .doc(
                                                      "HCID${firebaseUser.value?.uid}")
                                                  .update({
                                                  "lab_location":
                                                      _location2.text.trim(),
                                                })
                                              : element["user_type"] ==
                                                      "Medical Store"
                                                  ? await FirebaseFirestore
                                                      .instance
                                                      .collection(
                                                          "medical_store")
                                                      .doc(
                                                          "HCID${firebaseUser.value?.uid}")
                                                      .update({
                                                      "medical_location_location":
                                                          _location2.text
                                                              .trim(),
                                                    })
                                                  : null;

                                  Get.back();
                                  print(image);
                                  print(name);
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xFF0C9869),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Center(
                                        child: Text1(
                                            text: "Yes,Proceed",
                                            color: Colors.white,
                                            size: Get.height * 0.02)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                  Get.snackbar("Instruction",
                                      "Please fill the Personal,Public and Details in Profile Section",
                                      duration: const Duration(seconds: 3));
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xFF0C9869),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Center(
                                        child: Text1(
                                            text: "No",
                                            color: Colors.white,
                                            size: Get.height * 0.02)),
                                  ),
                                ),
                              ),
                            ),
                            //SizedBox(height: MediaQuery. of(context). size. height*0.1,)
                          ],
                        ));
                  }).toList()),
                );
              }),
        ),
      ),
      //barrierColor: Colors.red[50],
      isDismissible: true,
    );
  }

  _setInitialScreen(User? user) async {
    if (user != null) {
      // user is logged in
      await FirebaseFirestore.instance
          .collection('users')
          .where("id", isEqualTo: "HCID${firebaseUser.value?.uid}")
          .get()
          .then((value) {
        print(value);
        Get.offAll(() => value.docs[0]["user_type"] == "Patient"
            ? HomePage()





            
            : value.docs[0]["user_type"] == "Doctor"
                ? HomePage()
                : value.docs[0]["user_type"] == "Gym Trainer"
                    ? HomePage()
                    : value.docs[0]["user_type"] == "Lab Tester"
                        ? HomePage()
                        : value.docs[0]["user_type"] == "Medical Store"
                            ? HomePage()
                            : HomePage());
        value.docs[0]["location"] == "" ? getLoaction() : null;
      });
    } else {
      // user is null as in user is not available or not logged in
      Get.offAll(() =>LandingPage());
    }
  }

  changeUserType(String getType) {
    update();
    selectUserType.value = getType;
    update();
  }

  void register(String name, String email, String password, String phone,
      String userType) async {
    try {
      //isLoading.value=true;
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value?.updateDisplayName(name);
      isLoading.value = false;
      print("user type is :$userType");

      //initializing the overall users in database
      await FirebaseFirestore.instance
          .collection("users")
          .doc("HCID${firebaseUser.value?.uid}")
          .set({
        "name": name,
        "email": email,
        "status": "avaiable",
        "user_type": userType,
        "token": await FirebaseMessaging.instance.getToken(),
        "location": "",
        "image": "",
        "phone_number": phone,
        "last_chat_time": '',
        "id": "HCID${firebaseUser.value?.uid}"
      });

      //initializing the particular User Type
      userType == "Patient"
          ? await FirebaseFirestore.instance
              .collection("patients")
              .doc("HCID${firebaseUser.value?.uid}")
              .set({
              "name": name,
              "email": email,
              "status": "avaiable",
              "id": "HCID${firebaseUser.value?.uid}",
              "patient_joining_date": FieldValue.serverTimestamp(),
              "token": await FirebaseMessaging.instance.getToken(),
              "phone_number": phone,
            })
          : userType == "Doctor"
              ? await FirebaseFirestore.instance
                  .collection("doctor")
                  .doc("HCID${firebaseUser.value?.uid}")
                  .set({
                  "doctor_name": name,
                  "doctor_email": email,
                  "doctor_status": "avaiable",
                  "doctor_verified": false,
                  "doctor_joining_date": FieldValue.serverTimestamp(),
                  "id": "HCID${firebaseUser.value?.uid}",
                  "doctor_gender": "",
                  "doctor_image": "",
                  "doctor_experience": "",
                  "about_you": "",
                  "doctor_contact_number": phone,
                  "instituion_name": "",
                  "medicail_degree_year": "",
                  "doctor_certificate": "",
                  "doctor_id_proof_front": "",
                  "doctor_id_proof_back": "",
                  "doctor_specialization": "",
                  "doctor_fees": "",
                  "online_practice_time": "",
                  "offline_practice_time": "",
                  "consulting_duration": "",
                  "other_services": "",
                  "doctor_awards": "",
                  "doctor_location": "",
                  "related_hospital_or_clinic": "",
                  "doctor_related_to": "",
                  "doctor_related_to_hospital_department": "",
                  "image_hospital_or_clinic": '',
                  "hospital_or_clinic_location": "",
                  "token": await FirebaseMessaging.instance.getToken(),
                })
              : userType == "Lab Tester"
                  ? await FirebaseFirestore.instance
                      .collection("lab_tester")
                      .doc("HCID${firebaseUser.value?.uid}")
                      .set({
                      "name": name,
                      "email": email,
                      "status": "avaiable",
                      "lab_verified": false,
                      "lab_joining_date": FieldValue.serverTimestamp(),
                      "id": "HCID${firebaseUser.value?.uid}",
                      "lab_logo": "",
                      "about_you": "",
                      "lab_certificate": "",
                      "lab_phone_number": phone,
                      "lab_id_proof_front": "",
                      "lab_id_proof_back": "",
                      "payment_mode": "",
                      "lab_practice_hour": "",
                      "lab_location": "",
                      "lab_image": "",
                      "services": "",
                      "specialisation": "",
                      "lab_awards": "",
                      "lab_facilities": "",
                      "token": await FirebaseMessaging.instance.getToken(),
                    })
                  : userType == "Gym Trainer"
                      ? await FirebaseFirestore.instance
                          .collection("gym_trainer")
                          .doc("HCID${firebaseUser.value?.uid}")
                          .set({
                          "name": name,
                          "email": email,
                          "trainer_status": "avaiable",
                          "trainer_verified": false,
                          "trainer_joining_date": FieldValue.serverTimestamp(),
                          "id": "HCID${firebaseUser.value?.uid}",
                          "trainer_gender": "",
                          "trainer_image": "",
                          "trainer_experience": "",
                          "about_you": "",
                          "trainer_contact_number": phone,
                          "gym_name": "",
                          "training_degree_year": "",
                          "trainer_certificate": "",
                          "trainer_id_proof_front": "",
                          "trainer_id_proof_back": "",
                          "trainer_fees": "",
                          "services_provided": "",
                          "trainer_awards": "",
                          "trainer_location": "",
                          "related_gym": "",
                          "image_gym": '',
                          "gym_location": "",
                        })
                      : userType == "Medical Store"
                          ? await FirebaseFirestore.instance
                              .collection("medical_store")
                              .doc("HCID${firebaseUser.value?.uid}")
                              .set({
                              "name": name,
                              "email": email,
                              "status": "avaiable",
                              "medical_store_verified": false,
                              "medical_store_joining_date":
                                  FieldValue.serverTimestamp(),
                              "id": "HCID${firebaseUser.value?.uid}",
                              "medical_store_logo": "",
                              "about_you": "",
                              "medical_storecertificate": "",
                              "medical_store_phone_number": phone,
                              "medical_store_id_proof": "",
                              "payment_mode": "",
                              "medical_store_practice_hour": "",
                              "medical_store_location": "",
                              "medical_store_image": "",
                              "services": "",
                              "specialisation": "",
                              "medical_store_awards": "",
                              "medical_store_facilities": "",
                            })
                          : null;

      userType == "Patient"
          ? await FirebaseFirestore.instance
              .collection("patients")
              .doc("HCID${firebaseUser.value?.uid}")
              .collection("PublicProfile")
              .doc(firebaseUser.value?.uid)
              .set({
              "name": name,
              "bio": "",
              "location": "",
              "image": "",
              "age": "",
              "gender": "",
              "phone_number": phone,
              "id": "HCID${firebaseUser.value?.uid}"
            })
          : null;

      userType == "Patient"
          ? await FirebaseFirestore.instance
              .collection("patients")
              .doc("HCID${firebaseUser.value?.uid}")
              .collection("PersonalProfile")
              .doc(firebaseUser.value?.uid)
              .set({
              "mobile_number": "",
              "gender": "",
              "blood_group": "",
              "height": "",
              "weight": "",
              "id": "HCID${firebaseUser.value?.uid}",
              "emergency_contact": "",
            })
          : userType == "Doctor"
              ? await FirebaseFirestore.instance
                  .collection("doctor")
                  .doc("HCID${firebaseUser.value?.uid}")
                  .collection("Appointments")
              : userType == "Lab Tester"
                  ? await FirebaseFirestore.instance
                      .collection("lab_tester")
                      .doc("HCID${firebaseUser.value?.uid}")
                      .collection("Appointments")
                  : userType == "Hospital Management"
                      ? await FirebaseFirestore.instance
                          .collection("hospital_management")
                          .doc("HCID${firebaseUser.value?.uid}")
                          .collection("Connections")
                      : userType == "Clinic"
                          ? await FirebaseFirestore.instance
                              .collection("hospital_management")
                              .doc("HCID${firebaseUser.value?.uid}")
                              .collection("Connections")
                          : null;

      userType == "Patient"
          ? await FirebaseFirestore.instance
              .collection("patients")
              .doc("HCID${firebaseUser.value?.uid}")
              .collection("MedicalProfile")
              .doc(firebaseUser.value?.uid)
              .set({
              "allergies": "",
              "current_medications": "",
              "past_medication": "",
              "chronic_diseases": "",
              "injuries": "",
              "surgeries": "",
              "id": "HCID${firebaseUser.value?.uid}"
            })
          : null;
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      Get.back();
      Get.snackbar("Error", e.message!);
      // Get.snackbar(
      //   "Error",
      //   e.message!,
      //   snackPosition: SnackPosition.BOTTOM,
      // );
    } catch (e) {
      // this is temporary. you can handle different kinds of activities
      //such as dialogue to indicate what's wrong
      print(e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      //isLoading.value=false;
      //print(firebaseUser.value?.uid);
      await auth.signInWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance
          .collection('users')
          .doc("HCID${firebaseUser.value?.uid}")
          .update({"token": await FirebaseMessaging.instance.getToken()});
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      Get.back();
      Get.snackbar("Errror", "${e.message}");
      //print(e);
    } catch (e) {
      print(e.toString());
    }
  }

  void signOut() {
    try {
      auth.signOut();
      isLoading.value = false;
    } catch (e) {
      print(e.toString());
    }
  }
}
