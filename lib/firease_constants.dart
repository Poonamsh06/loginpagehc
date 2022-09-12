import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';



FirebaseAuth auth = FirebaseAuth.instance;
final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
//var user = AuthController.authInstance.firebaseUser.value;
//var uuid=Uuid().v1();
//String perId = "HCID${user?.uid}";