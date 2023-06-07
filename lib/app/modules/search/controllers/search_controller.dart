import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/NFT_List_model.dart';
import '../../../services/dio/api_service.dart';

class SearchController extends GetxController {
  //TODO: Implement SearchController

  final count = 0.obs;
  final genreMap = {}.obs;
  final genre = [].obs ;
  final selectedgenrelist =<String>[].obs;
  final selectedlanguage_tiles = [].obs;
  var selectedGeneregetedFromApi = [].obs;

  var nftData = NFTLIST().obs;
  var searchQuery = TextEditingController().obs;

var Loader  = false.obs;

  Future<void> getNFTList()async{
    Loader.value = true;
    var response = await APIManager.getSearchNFT_List(SearchQuery: searchQuery.value.text);
    print(response);
    var data  = jsonDecode(response.toString());
    nftData.value = NFTLIST.fromJson(data);
    Loader.value = false;

  }

  @override
  void onInit() async{
    await getNFTList();
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
