import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_candlesticks/flutter_simple_candlesticks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:salvatara/app/modules/CoinDetails/views/all_news.dart';
import 'package:salvatara/app/modules/CoinDetails/views/coinData.dart';
import 'package:salvatara/app/modules/CoinDetails/views/graphData.dart';
import 'package:salvatara/app/routes/app_pages.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import '../../../services/TextStyleUtil.dart';
import '../../../widgets/BaseAppBar.dart';
import '../controllers/coin_details_controller.dart';

class CoinDetailsView extends GetView<CoinDetailsController> {
  const CoinDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: ColorUtil.kWhite,
        appBar: BaseAppBar(
          title: Text(
            "${controller.coinDataOne.value.name}",
            style: TextStyleUtil.k24(),
          ),
          appBar: AppBar(),
          widgets: [],
          ontap: () {
            Get.back();
          },
          leading: true,
        ),
        body: Stack(
          children: [
            Obx(() =>
               SingleChildScrollView(
                 controller:controller.scrollController ,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 28.kw,
                            width: 28.kw,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "${controller.coinDataOne.value.image}"))),
                          ),
                          SizedBox(
                            width: 8.kw,
                          ),
                          Text(
                            "${controller.coinDataOne.value.name}",
                            style: TextStyleUtil.k28(),
                          ),
                          SizedBox(
                            width: 5.kw,
                          ),
                          Text(
                            "${controller.coinDataOne.value.symbol}",
                            style: TextStyleUtil.k18(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7.kh,
                      ),
                      Row(
                        children: [
                          Text(
                            "\$${controller.coinDataOne.value.priceUsd}",
                            style: TextStyleUtil.k18(
                                fontWeight: FontWeight.bold,
                                color: ColorUtil.neutral4),
                          ),
                          SizedBox(
                            width: 5.kw,
                          ),
                          Text(
                            "${controller.coinDataOne.value.priceChangePercentage_24h}",
                            style: TextStyleUtil.k14(color: ColorUtil.success),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40.kh,
                      ),
                      Divider(
                        thickness: 2.kh,
                      ),
                      SizedBox(
                        height: 16.kh,
                      ),
                      Row(
                        children: [
                          Stats(
                              Name: "24H Low",
                              Value:
                                  "\$${controller.formatNumber(controller.coinDataOne.value.onedaylow)}"),
                          SizedBox(
                            width: 100.kw,
                          ),
                          Stats(
                              Name: "24H High",
                              Value:
                                  "\$${controller.formatNumber(controller.coinDataOne.value.onedayhigh)}"),
                        ],
                      ),
                      SizedBox(
                        height: 16.kh,
                      ),
                      Row(
                        children: [
                          Stats(
                              Name: "24h volume",
                              Value:
                                  "\$${controller.formatNumber(controller.coinDataOne.value.volume)}"),
                          SizedBox(
                            width: 85.kw,
                          ),
                          Stats(
                              Name: "Market Cap",
                              Value:
                                  "\$${controller.formatNumber(controller.coinDataOne.value.marketCap)}"),
                        ],
                      ),
                      SizedBox(
                        height: 16.kh,
                      ),
                      Row(
                        children: [
                          Stats(
                              Name: "Available coins",
                              Value:
                                  "${controller.formatNumber(controller.coinDataOne.value.availableCoins)}"),
                          SizedBox(
                            width: 70.kw,
                          ),
                          Stats(
                              Name: "Total coins",
                              Value:
                                  "${controller.formatNumber(controller.coinDataOne.value.totalCoins)}"),
                        ],
                      ),
                      SizedBox(
                        height: 20.kh,
                      ),
                      SizedBox(
                        height: 400.kh,
                        width: double.infinity,
                        child: GraghDataCandle(),
                      ),

                      // CandlesticksChart<CandleModel>(
                      //   height: 343.kh,
                      //   data: controller.gdata.value,
                      //   style: CandlestickChartStyle(
                      //     yLegendStyle: CandlestickChartYLegendStyle(
                      //       textStyle: TextStyle(color: Colors.white),
                      //       numberOfLabels: 6,
                      //       lineStyle: CandlestickChartDashedLineStyle(
                      //           width: 1, color: Colors.white),
                      //     ),
                      //     candlestickStyle: CandlestickStyle(
                      //       bullishColor: Color(0xFF0B9943),
                      //       bearishColor: Color(0xFFE5194C),
                      //     ),
                      //     candlestickSelectedStyle: CandlestickStyle(
                      //       bullishColor: Color(0xFF0B9943),
                      //       bearishColor: Color(0xFFE5194C),
                      //     ),
                      //   ),
                      //   options: CandlestickChartOptions(isScrollable: true),
                      //   getHightCallback: (e) => e.hight,
                      //   getCloseCallback: (e) => e.close,
                      //   getLowCallback: (e) => e.low,
                      //   getOpenCallback: (e) => e.open,
                      //   getTimeCallback: (e) => e.date,
                      // ),
                      // SizedBox(
                      //   height: 357.kh,
                      //   width: 357.kw,
                      //   child: SimpleCandlestickChart(
                      //     data: controller.data,
                      //     increaseColor: Colors.teal,
                      //     decreaseColor: Colors.redAccent,
                      //   ),
                      // ),
                      SizedBox(
                        height: 42.kh,
                      ),
                      Text(
                        "About ${controller.coinDataOne.value.name}",
                        style: TextStyleUtil.k14(
                            color: ColorUtil.neutral4,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 8.kh,
                      ),
                      Text(
                        "${controller.coinDataOne.value.description}",
                         style: TextStyleUtil.k16(
                            fontWeight: FontWeight.normal,
                            color: ColorUtil.neutral6),
                      ),
                      SizedBox(
                        height: 42.kh,
                      ),
                      Text(
                        "Resources",
                        style: TextStyleUtil.k14(
                            color: ColorUtil.neutral4,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 16.kh,
                      ),
                      DetailTile(
                          SvgIcon: "coinButton.svg",
                          text: "${controller.coinDataOne.value.name} website",
                          ONTAP: () async {
                            print(
                                "${'${controller.coinDataOne.value.explorer}'}");
                            //final Uri toLaunch = Uri(host: '${controller.coinDataOne.value.explorer}');
                            await controller.launchInBrowser(
                                "${controller.coinDataOne.value.explorer}");
                          }),
                      SizedBox(
                        height: 22.kh,
                      ),
                      Row(
                        children: [
                          Text(
                            "Latest news",
                            style: TextStyleUtil.k14(
                                color: ColorUtil.neutral4,
                                fontWeight: FontWeight.normal),
                          ),
                          Spacer(),
                          TextButton(
                              onPressed: () {
                                Get.to(AllNews());
                              },
                              child: Text(
                                "See All",
                                style:
                                    TextStyleUtil.k14(color: ColorUtil.accent4),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 8.kh,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.coinnews.value.data == null
                              ? 0
                              : controller.coinnews.value.data!.length <= 2
                                  ? controller.coinnews.value.data?.length
                                  : 4,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                await controller.launchInBrowser(
                                    "${controller.coinnews.value.data?[index]?.url}");
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 74.kh,
                                      width: 92.kw,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(8)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${controller.coinnews.value.data?[index]?.urlToImage}"),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      height: 70.kh,
                                      width: 200.kw,
                                      child: Text(
                                        "${controller.coinnews.value.data?[index]?.title}",
                                        style: TextStyleUtil.k18(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                      SizedBox(
                        height: 20.kh,
                      ),
                      Text(
                        "Similar",
                        style: TextStyleUtil.k14(
                            color: ColorUtil.neutral4,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 20.kh,
                      ),
                      Obx(() =>SizedBox(
                          height: 200.kh,
                          child:controller.coinData.value.Cryptos == null ? Center(child: SizedBox(
                              height: 30.kw,
                              width: 30.kw,
                              child: CircularProgressIndicator(color: ColorUtil.k4,))): ListView.builder(

                              shrinkWrap: false,
                              itemCount: controller.coinData.value.Cryptos?.isEmpty == true
                                  ? 0
                                  : controller.coinData.value.Cryptos?.length == 3
                                      ? controller.coinData.value.Cryptos?.length
                                      : 3,
                              itemBuilder: (context, index) {
                                var data = controller.coinData.value.Cryptos?[index];
                                return
                                  GestureDetector(
                                    onTap: () {
                                      controller.coinDataOne.value = data! ;
                                      controller.getGraphData();
                                      controller.getCoinNews();
                                      controller.getCoinDetails();
                                      controller.scrollController.animateTo(0,
                                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                                      // try{
                                      //   Get.toNamed(Routes.COIN_DETAILS, arguments: [
                                      //     controller.coinData.value.Cryptos![index]
                                      //   ]);
                                      // }catch(e){
                                      //   print(e);
                                      // }

                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Image(
                                              image: NetworkImage("${data?.image}"),
                                              height: 44.kh,
                                              width: 44.kw,
                                            ),
                                            SizedBox(
                                              width: 8.kw,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${data?.name}",
                                                  style: TextStyleUtil.k16(),
                                                ),
                                                SizedBox(
                                                  height: 4.kh,
                                                ),
                                                Text(
                                                  "${data?.symbol}",
                                                  style: TextStyleUtil.k14(
                                                      color: ColorUtil.neutral4,
                                                      fontWeight: FontWeight.normal),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "${data?.priceUsd?.toStringAsFixed(2)}",
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyleUtil.k16(
                                                    color: ColorUtil.neutral4,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4.kh,
                                                ),
                                                Text(
                                                  "${data?.priceChangePercentage_24h?.toStringAsFixed(2)}",
                                                  style: TextStyleUtil.k14(
                                                      color:
                                                               Colors.grey,
                                                      fontWeight: FontWeight.normal),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 1.kh,
                                          color: ColorUtil.neutral2,
                                        ),
                                      ],
                                    ),
                                  );

                              }),
                        ),
                      ),
                      SizedBox(
                        height: 90.kh,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   child: Container(
            //     height: 80.kh,
            //     width: 385.kw,
            //     decoration: BoxDecoration(
            //         color: ColorUtil.kWhite,
            //         border: Border.all(color: ColorUtil.neutral2)),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         Container(
            //           height: 44.kh,
            //           width: 164.kw,
            //           color: ColorUtil.danger4,
            //           child: Center(
            //             child: Text(
            //               "Sell",
            //               style: TextStyleUtil.k14(color: ColorUtil.kWhite),
            //             ),
            //           ),
            //         ),
            //         Container(
            //           height: 44.kh,
            //           width: 164.kw,
            //           color: ColorUtil.success,
            //           child: Center(
            //             child: Text("Buy",
            //                 style: TextStyleUtil.k14(color: ColorUtil.kWhite)),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class Stats extends StatelessWidget {
  final String Name;
  final String Value;

  const Stats({Key? key, required this.Name, required this.Value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${Name}",
          style: TextStyleUtil.k14(
              fontWeight: FontWeight.normal, color: ColorUtil.neutral4),
        ),
        SizedBox(
          height: 6.kh,
        ),
        Text(
          "${Value}",
          style: TextStyleUtil.k18(),
        ),
      ],
    );
  }
}

class DetailTile extends StatelessWidget {
  final String SvgIcon;
  final String text;
  final Function() ONTAP;

  DetailTile(
      {Key? key,
      required this.SvgIcon,
      required this.text,
      required this.ONTAP})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ONTAP,
      child: Container(
        height: 48.kh,
        width: 343.kw,
        decoration: BoxDecoration(
            border: Border.all(color: ColorUtil.neutral2),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 16.kw,
              ),
              SvgPicture.asset("assets/SVG/${SvgIcon}"),
              SizedBox(
                width: 14.kw,
              ),
              Text(
                "${text}",
                style: TextStyleUtil.k14(
                  fontWeight: FontWeight.normal,
                  color: ColorUtil.neutral6,
                ),
              ),
              Spacer(),
              SvgPicture.asset("assets/SVG/sideArrow.svg"),
              SizedBox(
                width: 16.kw,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
