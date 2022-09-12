import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


import 'auth_controller.dart';

class LocationController extends GetxController {
  static LocationController locationInstance = Get.find();
  var location = "Please set the location".obs;
  final uuid = AuthController.authInstance.firebaseUser.value?.uid;

  // void onReady() {
  //   super.onReady();
  //   location=="Please set the location"?Get.snackbar("Location Error", "Please Set your location by clicking on the location button"):null;
  // }

  final isUploadingLocation = true.obs;
  getUserLocation(String userType) async {
    //return Get.bottomSheet();
    //isUploadingLocation.value=true;
    // update();
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location Not Available');
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          forceAndroidLocationManager: true);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark placemark = placemarks[0];
      String address =
          "${placemark.locality}, ${placemark.postalCode}, ${placemark.country}";
      print(address);
      location.value = address;
      print(location);

      userType != "Hospital or Clinic"
          ? await FirebaseFirestore.instance
              .collection('users')
              .doc("HCID${uuid}")
              .update({"location": address})
          : null;

      userType == "Patient"
          ? await FirebaseFirestore.instance
              .collection("patients")
              .doc("HCID${uuid}")
              .collection("PublicProfile")
              .doc(uuid)
              .update({
              "location": address,
            }).whenComplete(() => print("patient"))
          : userType == "Doctor"
              ? await FirebaseFirestore.instance
                  .collection("doctor")
                  .doc("HCID${uuid}")
                  .update({
                  "doctor_location": address,
                })
              : userType == "Lab Tester"
                  ? await FirebaseFirestore.instance
                      .collection("lab_tester")
                      .doc("HCID${uuid}")
                      .update({
                      "lab_location": address,
                    })
                  : userType == "Medical Store"
                      ? await FirebaseFirestore.instance
                          .collection("medical_store")
                          .doc("HCID${uuid}")
                          .update({
                          "trainer_location": address,
                        }).whenComplete(() => print("h"))
                      : userType == "Hospital or Clinic"
                          ? await FirebaseFirestore.instance
                              .collection('doctor')
                              .doc("HCID${uuid}")
                              .update({"hospital_or_clinic_location": address})
                          : null;

      isUploadingLocation.value = false;
      Get.snackbar("Location Set", "Your location has been set successfully");
      // _locationController.text=address;
      // print(_locationController.text);
    } catch (e) {
      Get.snackbar("Some Error occured", "$e");
      print("$e");
      //showAlertDialog(context, "$e");
    }
    isUploadingLocation.value = false;
  }
}
