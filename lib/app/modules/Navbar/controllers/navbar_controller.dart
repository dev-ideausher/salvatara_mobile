import 'dart:convert';

import 'package:get/get.dart';
import 'package:salvatara/app/data/UserModel.dart';
import 'package:salvatara/app/services/dio/api_service.dart';

class NavbarController extends GetxController {
  //TODO: Implement NavbarController
  var tabIndex = 0.obs;
  final count = 0.obs;
  void changeTabIndex(int index){
    tabIndex.value = index;
    //update();
  }



  var userdetials = UserModel().obs;

  Future<void> getUserDetails() async {
    var response = await APIManager.getUserDetails();
    print(response);
    var data = jsonDecode(response.toString());
    userdetials.value = UserModel.fromJson(data);
  }
  @override
  void onInit()async {
    await getUserDetails();
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
