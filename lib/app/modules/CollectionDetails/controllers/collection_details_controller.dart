import 'dart:convert';

import 'package:get/get.dart';
import 'package:salvatara/app/data/OneDetailsCollection.dart';
import 'package:salvatara/app/services/dio/api_service.dart';

class CollectionDetailsController extends GetxController {
  //TODO: Implement CollectionDetailsController

var CollectionID = ''.obs;
  var collectionOneDetail = OneCollectionModel().obs;
  Future<void> getCollectionsDetail()async{
    var response = await APIManager.getOneCollectionDetail(CollectionID: "${CollectionID.value}");
    print(response);
    var data  = jsonDecode(response.toString());
    collectionOneDetail.value = OneCollectionModel.fromJson(data);
    print(response);

  }
  @override
  void onInit()async {
    CollectionID.value = Get.arguments[0];
    await getCollectionsDetail();
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
