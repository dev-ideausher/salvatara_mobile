import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salvatara/app/services/dio/api_service.dart';

import '../../KYC/controllers/kyc_controller.dart';
class LoginController extends GetxController {

  //TODO: Implement LoginController
var checkBoxStatus = false.obs;
  var EmailController = TextEditingController().obs;
  var PasswordController = TextEditingController().obs;
  var ObsecureStatus = true.obs;
  final count = 0.obs;


  Future<void> updateUserPersonalDetails(
      {required String firstName,
        required String lastName,
        required String cor,
        required String dob,
      required String selfie
      }) async {
    var response = await APIManager.postupdateUser(body: {
      "firstname": "${firstName}",
      "lastname": "${lastName}",
      "dob": "${dob}",
      "cor": "${cor}",
      "selfie":"${selfie}",

    });
    print(response);
    var data = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      await Get.find<KycController>().getuserKYCDetails();
  //    Get.back();
    } else {

    }
  }

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

  void increment() => count.value++;
}
