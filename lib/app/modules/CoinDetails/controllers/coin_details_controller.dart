import 'dart:convert';
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:salvatara/app/data/candle_Chart_data.dart';
import 'package:salvatara/app/data/coin_news.dart';
import 'package:salvatara/app/data/coins_model.dart';
import 'package:salvatara/app/modules/CoinDetails/views/coinData.dart';
import 'package:salvatara/app/modules/CoinDetails/views/graphData.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../services/dio/api_service.dart';

class CoinDetailsController extends GetxController {
  ScrollController scrollController = ScrollController();

  var coinDataOne = CoinsModelCryptos().obs;
  var candles     = <Candle>[].obs;
  var candlesData = <ChartSampleData>[].obs;
  var gdata       = <CandleModel>[].obs;
  var coinnews    = coinNews().obs;
  String formatNumber(var numberToFormat){
    var _formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 2,
      locale: 'en_US',
      symbol: '',
    ).format(numberToFormat);
    print('Formatted Number is: $_formattedNumber');
    return _formattedNumber;
  }

  Future<void> launchInBrowser(String url) async {
    if (!await launch(
      url,
    )) {
      throw 'Could not launch $url';
    }
  }


    // String changeDateFormat(String? Date){
    // String date = "2019-07-14T18:30:00.000Z";
    // SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    // SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a");
    // Date parsedDate = inputFormat.parse(date);
    // String formattedDate = outputFormat.format(parsedDate);
    // System.out.println(formattedDate);
    //  return inputDate.toString();
  //  }


  var graphData = CandleGraph().obs;
  Future<void> getGraphData() async {
    var response = await APIManager.getGraphData(coinName: "?coin=${coinDataOne.value.name?.toLowerCase()}");

    try{

      print(response);
      var data = jsonDecode(response.toString());
      graphData.value = CandleGraph.fromJson(data);
      for (int i = 0; i < graphData.value.data!.length; i++) {
        candlesData.add(ChartSampleData(
            x: DateTime.fromMicrosecondsSinceEpoch(graphData.value.data?[i]?.time as int),
            open: graphData.value.data![i]!.open!.toDouble(),
            high: graphData.value.data![i]!.high!.toDouble(),
            low: graphData.value.data![i]!.low!.toDouble(),
            close: graphData.value.data![i]!.close!.toDouble()
        ));
        print(gdata.length);
      }
    }catch(e){
      print(e);
    }


  }

  Future<void> getCoinNews() async {
    var response = await APIManager.getCoinNews();
    print(response);
    var data = jsonDecode(response.toString());
    coinnews.value = coinNews.fromJson(data);
  }

  var coinData = CoinsModel().obs;
  Future<void> getCoinDetails() async {
    var response = await APIManager.getCoinDetails(SearchQuery: "");
    var data = jsonDecode(response.toString());
    coinData.value = CoinsModel.fromJson(data);
  }



  @override
  void onInit() async {
    coinDataOne.value = Get.arguments[0];

    getCoinNews();
     getCoinDetails();
    getGraphData();
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

