// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// import '../Utils/firebase_constants.dart';

// class LocationController extends GetxController{
//   var location="Please set the location".obs ;
//   void onReady() {
//     super.onReady();
//     location=="Please set the location"?Get.snackbar("Location Error", "Please Set your location by clicking on the location button"):null;
//   }

//   final isUploadingLocation=false.obs ;
//     getUserLocation() async{
//       isUploadingLocation.value=true;
//       LocationPermission permission;
//       permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//       }
//       if (permission == LocationPermission.deniedForever) {
//         return Future.error('Location Not Available');
//       }
//       try {
//         Position position=await Geolocator.getCurrentPosition(
//             desiredAccuracy: LocationAccuracy.high,forceAndroidLocationManager: true);
//         List<Placemark> placemarks = await placemarkFromCoordinates(
//             position.latitude,position.longitude
//         );
//         Placemark placemark =placemarks[0];
//         String address="${placemark.locality}, ${placemark.postalCode}, ${placemark.country}";
//         print(address);
//         location.value=address;
//         print(location);
//         var collection = FirebaseFirestore.instance.collection('users').doc(perId).collection("PersonalProfile").doc(user?.uid);
//         await collection.update({"location":location.value});
//         // for (var doc in querySnapshots.docs) {
//         //   await doc.reference.update({
//         //     'single_field': 'newValue',
//         //   });
//         // }
//         Get.snackbar("Location Set", "Your location has been set successfully");
//         // _locationController.text=address;
//         // print(_locationController.text);
//       }
//       catch (e){
//         Get.snackbar("Some Error occured", "$e");
//         print("$e");
//         //showAlertDialog(context, "$e");
//       }
//       isUploadingLocation.value=false;
//     }
// }