import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:salvatara/app/modules/Profile/controllers/profile_controller.dart';
import 'package:salvatara/app/services/CommonSnackBar.dart';
import 'package:salvatara/app/services/dio/api_service.dart';
import 'package:salvatara/app/services/upload_class.dart';

import '../../PersonalInformation/views/upload.dart';

class EditProfileController extends GetxController {
  //TODO: Implement EditProfileController
  var NameTextEditingController = TextEditingController().obs;
  var LastNameTextEditingController = TextEditingController().obs;
  var CorTextEditingController = TextEditingController().obs;
  var BirthDayTextEditingController = TextEditingController().obs;
  var BirthDayPostTextEditingController = TextEditingController().obs;
  var BioEditingController = TextEditingController().obs;
  var EmailController = TextEditingController().obs;
  var imageLink = ''.obs;

  final count = 0.obs;
  ProfileController profileController = Get.find<ProfileController>();

  initalDetails() {
    ProfileImageUploadLink.value = profileController.userdetials.value.data?.selfie == null ? "": profileController.userdetials.value.data!.selfie!.toString();
    NameTextEditingController.value.text = profileController.userdetials.value.data?.firstname == null ? "" : profileController.userdetials.value.data!.firstname.toString();
    LastNameTextEditingController.value.text = profileController.userdetials.value.data?.lastname == null ? "" : profileController.userdetials.value.data!.lastname.toString();
    CorTextEditingController.value.text = profileController.userdetials.value.data?.cor == null ?  "": profileController.userdetials.value.data!.cor.toString();
    EmailController.value.text = profileController.userdetials.value.data?.email == null ? "": profileController.userdetials.value.data!.email.toString();
    BirthDayTextEditingController.value.text =profileController.userdetials.value.data?.dob == null ? "": profileController.userdetials.value.data!.dob.toString();
    BirthDayTextEditingController.value.text = (BirthDayTextEditingController.value.text == null || BirthDayTextEditingController.value.text == "") ? BirthDayTextEditingController.value.text : DateFormat('yMd').format( DateTime.parse('${BirthDayTextEditingController.value.text}')).toString();
    
  }

  var ProfileImageFileLink = ''.obs;
  Future uploadClassProfile() async {
    ProfileImageFileLink.value = (await uploadImageClass().getImage(gallery: true))!;
    print(ProfileImageFileLink.value);
  }
  var ProfileImageUploadLink = ''.obs;

  Future<void> UpdateUserWithImage() async {
    if(ProfileImageFileLink.value == ''){
      await updateUser(imageLink: "${ProfileImageUploadLink.value}");
    }else{

      ProfileImageUploadLink.value = await uploadClassMain().postReqUpload(ImageLink: ProfileImageFileLink.value);
      await updateUser(imageLink: "${ProfileImageUploadLink.value}");

    }

  }

  Future<void> updateUser({required String imageLink}) async {
    print("${BirthDayTextEditingController.value.text.toString()}");
    var response = await APIManager.postupdateUser(body: {
      "firstname": "${NameTextEditingController.value.text.trim()}",
      "lastname": "${LastNameTextEditingController.value.text.trim()}",
      "selfie": "${imageLink}",
      "dob": "${BirthDayTextEditingController.value.text.toString()}",
      "cor": "${CorTextEditingController.value.text.toString()}"
    });
    print(response);
    var data = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(await response.data);
      await Get.find<ProfileController>().getUserDetails();
      Get.back();
      snackBarClass("Profile updated").SuccesSnackBar;
    } else {

    }
  }
  @override
  void onInit() {
    initalDetails();
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
