import 'dart:convert';

import 'package:get/get.dart';
import 'package:salvatara/app/data/getUserKycDetails.dart';
import 'package:salvatara/app/modules/Login/controllers/login_controller.dart';

import '../../../services/dio/api_service.dart';

class KycController extends GetxController {


  var userKycDetails = getUserKycDetails().obs;

  Future getuserKYCDetails() async{
    var response = await APIManager.getUserKyCDetails();
    print(response);
    var data  = jsonDecode(response.toString());
    userKycDetails.value = getUserKycDetails.fromJson(data);
  }




  var ButtonStatus = false.obs;
  @override
  void onInit() async{
    ButtonStatus.value = Get.arguments[0];
    await getuserKYCDetails();

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
