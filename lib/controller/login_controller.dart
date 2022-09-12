import 'package:get/get.dart';

class LogInController extends GetxController {
  var see = true.obs;
  void change(typeChange) => see.value = typeChange;
}