import 'dart:convert';

import 'package:get/get.dart';
import 'package:salvatara/app/modules/Profile/controllers/profile_controller.dart';
import 'package:salvatara/app/services/CommonSnackBar.dart';
import 'package:salvatara/app/services/dio/api_service.dart';

import '../../../data/NFT_details.dart';
import '../../../services/dynamicLinks.dart';

class NftDetailsController extends GetxController {
  var NFTdetails = nftDetails().obs;
  var NFTID = ''.obs;
  var favStatus = false.obs;
  var OwnerStatus = false.obs;

  Future getNFTDetails(String ID) async {
    var response = await APIManager.getNFTDetails(NFTID: "${ID}");
    print(response.data);
    var data = jsonDecode(response.toString());
    NFTdetails.value = nftDetails.fromJson(data);
    if (NFTdetails.value.data?.userfavourite == true) {

      favStatus.value = true;
    } else {
      favStatus.value = false;
    }
    if("${NFTdetails.value.data?.owner?.Id}" == "${Get.find<ProfileController>().userdetials.value.data?.Id}".trim()){
      OwnerStatus.value = true;
    }else{
      OwnerStatus.value = false;
    }
  }


  Future postCancelListing(
      {
        required String hash,
      }) async {
    var response = await APIManager.cancelListing(body: {
      "nftId": "${NFTdetails.value.data?.Id}",
      "txnHash": "${hash}"
    });
    if(response.statusCode == 200){
      Get.back();
      snackBarClass("NFT listing canceled").SuccesSnackBar;
    }
    print(response);
  }

  Future postBuyNFT(
      {required String nft,
      required String buyer,
      required String hash,
      required String tokenId,
      }) async {
    var response = await APIManager.postBuyNFT(body: {
      "nft": "${nft}",
      "buyer": "${buyer}",
      "seller": "${Get.find<ProfileController>().userdetials.value.data?.Id}",
      "walletAddressFrom": "ddsds",
      "walletAddressTo": "dsfef",
      "transactionType": "Transferred",
      "hash": "${hash}",
      "tokenId": "${tokenId}",
      "typeOfPayment": "matic",
      "price": 1,
      "contractAddress": ""
    });
    print(response);
  }

  Future getAddToFavourite(String ID) async {
    favStatus.value = true;
    var response = await APIManager.getAddFavourite(NFTID: "${ID}");
    var data = jsonDecode(response.toString());
    print(data);
    await Get.find<ProfileController>().getUserFavourite();
    print(response.data);
  }

  Future getRemoveFavourite(String ID) async {
    favStatus.value = false;
    var response = await APIManager.getRemoveFavourite(NFTID: "${ID}");
    var data = jsonDecode(response.toString());
    await Get.find<ProfileController>().getUserFavourite();
    print(data);
    print(response.data);
  }




  var link = ''.obs;
Future GenrateDynamicLink() async {
    link.value = await createDynamicLink(short: true, nftID: "${NFTID.value}");
    print(link.value);
    return link.value;
  }




var NFTSell = false.obs;
  @override
  void onInit() async {
    NFTID.value = Get.arguments[0];
    NFTSell.value =  Get.arguments[1];
    await getNFTDetails(NFTID.value);
    await GenrateDynamicLink();
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
