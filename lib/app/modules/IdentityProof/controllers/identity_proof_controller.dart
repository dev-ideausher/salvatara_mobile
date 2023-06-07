import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:salvatara/app/modules/PersonalInformation/views/upload.dart';
import 'package:salvatara/app/services/dio/api_service.dart';
import 'package:salvatara/app/services/upload_class.dart';
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';

import '../../KYC/controllers/kyc_controller.dart';

class IdentityProofController extends GetxController {
  var FrontimageLink = ''.obs;
  var BackimageLink = ''.obs;

  var uploadURLFront = ''.obs;
  var uploadURLBack = ''.obs;

  Future uploadClassesFront() async {
    FrontimageLink.value = (await uploadImageClass().getImage(gallery: true))!;
    print(FrontimageLink.value);
  }

  Future uploadClasseBack() async {
    BackimageLink.value = (await uploadImageClass().getImage(gallery: true))!;
    print(BackimageLink.value);
  }



  Future<void> SubmitDocuments() async {
    uploadURLFront.value = await uploadClassMain().postReqUpload(ImageLink: FrontimageLink.value);
    uploadURLBack.value = await uploadClassMain().postReqUpload(ImageLink: BackimageLink.value);
    await updateUserPersonalDetails(
        Front: "${uploadURLFront.value}", Back: "${uploadURLBack.value}");
    // await Ge;
  }

  Future<void> updateUserPersonalDetails({required String Front, required String Back}) async {
    var response = await APIManager.postupdateUser(body: {
      "kyc": {
        "documentType": "document",
        "front": "${Front}",
        "back": "${Back}"
      }
    });
    print(response);
    var data = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      await Get.find<KycController>().getuserKYCDetails();
      Get.back();
      print(response.statusCode);
      print(await response.data);
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
}
