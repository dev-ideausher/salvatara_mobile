import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:salvatara/app/modules/KYC/controllers/kyc_controller.dart';
import 'package:salvatara/app/services/CommonSnackBar.dart';
import 'package:salvatara/app/services/dio/api_service.dart';

class PersonalInformationController extends GetxController {
  //TODO: Implement PersonalInformationController
  var FirstNameTextEditingController = TextEditingController().obs;
  var LastNameTextEditingController = TextEditingController().obs;
  var CorTextEditingController = TextEditingController().obs;
  var BirthDayTextEditingController = TextEditingController().obs;
  var BirthDayPostTextEditingController = TextEditingController().obs;

  final count = 0.obs;

  Future<void> updateUserPersonalDetails(
      {required String firstName,
      required String lastName,
      required String cor,
      required String dob}) async {
    var response = await APIManager.postupdateUser(body: {
      "firstname": "${firstName}",
      "lastname": "${lastName}",
      "dob": "${dob}",
      "cor": "${cor}"
    });

    print(response);
    var data = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      await Get.find<KycController>().getuserKYCDetails();
      Get.back();
      snackBarClass("Personal details added").SuccesSnackBar;
      FirstNameTextEditingController.value.clear();
      LastNameTextEditingController.value.clear();
      CorTextEditingController.value.clear();
      BirthDayTextEditingController.value.clear();
      BirthDayPostTextEditingController.value.clear();
    } else {}
  }

  Future<void> uploadImage() async {
    var response = await APIManager.postupdateUser(body: {});

    if (response.statusCode == 200) {
    } else {}
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
