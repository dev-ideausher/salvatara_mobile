import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salvatara/app/data/Minted_NFT.dart';
import 'package:salvatara/app/modules/KYC/controllers/kyc_controller.dart';
import 'package:salvatara/app/routes/app_pages.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:salvatara/app/services/storage.dart';

import '../../../data/CollectedNFT.dart';
import '../../../data/UserCollection.dart';
import '../../../data/UserModel.dart';
import '../../../data/getUserFav.dart';
import '../../../services/CommonSnackBar.dart';
import '../../../services/CustomButton.dart';
import '../../../services/colors.dart';
import '../../../services/dio/api_service.dart';

class ProfileController extends GetxController {
  var optionsBool = false.obs;
  var tabIndex = 0.obs;
  final count = 0.obs;
  var userdetials = UserModel().obs;
  var NFTSellingAmountController = TextEditingController().obs;
  var MintedNFTdata = MintedNFT().obs;
  var CollectedNFTdata = CollectedNFT().obs;
  var IsMatic = false.obs;
  var IsMaticString = "salvacoin".obs;

  var UserCollection = userCollection().obs;

  Future<void> getUserDetails() async {
    var response = await APIManager.getUserDetails();
    print(response);
    var data = jsonDecode(response.toString());
    userdetials.value = UserModel.fromJson(data);
  }
  Future<void> deleteUser() async {
    var response = await APIManager.deleteUserAccount();
    print(response);
    if(response.statusCode == 200){
      Get.find<GetStorageService>().logout();
      Get.delete();
      Get.offAllNamed(Routes.LOGIN);
      snackBarClass("User deleted").SuccesSnackBar;
    }else{
      snackBarClass("Not able to delete your account please try again later").WarningSnackBar;
    }


    // var data = jsonDecode(response.toString());
    // userdetials.value = UserModel.fromJson(data);
  }

  Future<void> getMintedNFTDetails() async {
    var response = await APIManager.getMintedNFTDetails();
    print(response);
    var data = jsonDecode(response.toString());
    MintedNFTdata.value = MintedNFT.fromJson(data);
  }

  Future<void> getUserCollection() async {
    var response = await APIManager.getUserCollection();
    print(response);
    var data = jsonDecode(response.toString());
    UserCollection.value = userCollection.fromJson(data);
  }

  Future<void> getCollectedNFTDetails() async {
    var response = await APIManager.getCollectedNFTDetails();
    print(response);
    var data = jsonDecode(response.toString());
    CollectedNFTdata.value = CollectedNFT.fromJson(data);
  }

  Future postListNFT({
    required String nftId,
    required String txnHash,
    required var Price,
  }) async {
    var response = await APIManager.postListNFT(body: {
      "nftId": "${nftId}",
      "txnHash": "${txnHash}",
      "price": Price,
      "contractAddress": "0x81eaeC135cF1D9b3eE82bCB63Ac65766843076C0",
      "typeOfPayment":"${IsMaticString.value}"
    });
    print("${response}");
  }

  var userFavourite = getUserFav().obs;

  Future getUserFavourite() async {
    var response = await APIManager.getUserFav();
    var data = jsonDecode(response.toString());
    userFavourite.value = getUserFav.fromJson(data);
  }
var ShowKYC = false.obs;
  Future KYCSetting() async {
    if (Get.find<KycController>().userKycDetails.value.data?.selfie == false ||
        Get.find<KycController>().userKycDetails.value.data?.selfie == false ||
        Get.find<KycController>().userKycDetails.value.data?.selfie == false) {
      ShowKYC.value = true;
    }else
      {
        ShowKYC.value = false;
      }
  }

  @override
  void onInit() async {
    await KYCSetting();
    await getUserDetails();
    await getCollectedNFTDetails();
     getMintedNFTDetails();
     getUserFavourite();
     getUserCollection();

    super.onInit();
  }

  Future refrehjh()async{
    await getMintedNFTDetails();
    await getCollectedNFTDetails();
 //   await getUserFavourite();
  //  await getUserCollection();
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
