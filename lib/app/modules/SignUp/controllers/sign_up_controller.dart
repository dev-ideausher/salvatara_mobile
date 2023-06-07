import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {

  var EmailController = TextEditingController().obs;
  var PasswordController = TextEditingController().obs;
  var PasswordControllerConfirm = TextEditingController().obs;
  var ObsecureStatus = true.obs;
  final count = 0.obs;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
