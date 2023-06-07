import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../data/coins_model.dart';
import '../../../services/dio/api_service.dart';

class MarketsController extends GetxController {

  var coinData = CoinsModel().obs;
 var searchQuery = TextEditingController().obs;
 getCoinDetails() async {
    var response = await APIManager.getCoinDetails(SearchQuery: "${searchQuery.value.text}");
    var data = jsonDecode(response.toString());
    coinData.value = CoinsModel.fromJson(data);
    print(coinData.value);
  }


  @override
  void onInit() async {
    searchQuery.value.text = '';
    await getCoinDetails();
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
