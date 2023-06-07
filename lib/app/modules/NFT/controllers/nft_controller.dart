import 'dart:convert';

import 'package:get/get.dart';
import 'package:salvatara/app/data/NFT_List_model.dart';
import 'package:salvatara/app/data/OneDetailsCollection.dart';
import 'package:salvatara/app/data/Trending_NFT.dart';
import 'package:salvatara/app/data/UserModel.dart';
import 'package:salvatara/app/services/notification_utils.dart';

import '../../../data/Collection_model.dart';
import '../../../services/dio/api_service.dart';

class NftController extends GetxController {
  //TODO: Implement NftController

  final count = 0.obs;

  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String? selectedValue;

  var nftData = NFTLIST().obs;
  var TreadingNftData = TrendingNft().obs;
  var userdetials = UserModel().obs;

  Future<void> getUserDetails() async {
    var response = await APIManager.getUserDetails();
    print(response);
    var data = jsonDecode(response.toString());
    userdetials.value = UserModel.fromJson(data);

    FirebaseMessagingUtils.firebaseMessagingUtils.subFcm("${userdetials.value.data?.Id}");
    print("Yaman ${userdetials.value.data?.Id}");
  }

  Future<void> getNFTList()async{
    var response = await APIManager.getApiNFT_List();
    print(response);
    var data  = jsonDecode(response.toString());
    nftData.value = NFTLIST.fromJson(data);

  }
  Future<void> getTreadingNFTList()async{
    var response = await APIManager.getApiTreading_NFT_List();
    print(response);
    var data  = jsonDecode(response.toString());
    TreadingNftData.value = TrendingNft.fromJson(data);
  }


  var collectionDetails = Collection().obs;
  Future<void> getCollections()async{
    var response = await APIManager.getCollectionDetail();
    print(response);
    var data  = jsonDecode(response.toString());
    collectionDetails.value = Collection.fromJson(data);

  }

  //
  // var collectionOneDetail = OneCollectionModel().obs;
  // Future<void> getCollectionsDetail()async{
  //   var response = await APIManager.getOneCollectionDetail();
  //   print(response);
  //   var data  = jsonDecode(response.toString());
  //   collectionOneDetail.value = OneCollectionModel.fromJson(data);
  //   print(response);
  //
  // }
  
  @override
  Future onInit() async{
   await getNFTList();
   await getTreadingNFTList();
   await getCollections();
   getUserDetails();
   //await getCollectionsDetail();
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
