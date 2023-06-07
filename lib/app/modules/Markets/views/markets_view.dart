import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:salvatara/app/widgets/BaseAppBar.dart';
import '../../../routes/app_pages.dart';
import '../../../services/make_input.dart';
import '../controllers/markets_controller.dart';


class MarketsView extends GetView<MarketsController> {
  const MarketsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.kWhite,
      appBar: BaseAppBar(
        title: Text(
          "Market",
          style: TextStyleUtil.k24(),
        ),
        appBar: AppBar(),
        widgets: [],
        ontap: () {},
        leading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Obx(() =>
        Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  MakeInputCustomIcon(
                    controllerID:controller.searchQuery.value,
                    hintText: "Search items or creators",
                    label: "label",
                    obscureText: false,
                    width: 340.kw,
                    prefixIcon: Icon(Icons.search),
                    SuffixIcon: false,
                    onChanged: (String value)  =>
                      controller.getCoinDetails()
                    // },
                  ),

                  // Spacer(),
                  //
                  // Container(
                  //   height: 44.kh,
                  //   width: 44.kw,
                  //   decoration: BoxDecoration(
                  //       color: ColorUtil.neutral1,
                  //       borderRadius: BorderRadius.all(Radius.circular(4)),
                  //       border: Border.all(color: ColorUtil.neutral2)),
                  //   child: Center(
                  //     child: SvgPicture.asset("assets/SVG/filterIcon.svg"),
                  //   ),
                  // ),

                ],
              ),
              SizedBox(
                height: 20.kh,
              ),

// Instance "GetStorageService" has been created

              Expanded(
                child: Obx(() =>
                    ListView.builder(
                        itemCount: controller.coinData.value.Cryptos?.length,
                        itemBuilder: (context, index) {
                          var data = controller.coinData.value.Cryptos?[index];
                          return GestureDetector(
                            onTap: () {
                              print("yyyy ${controller.coinData.value.Cryptos![index]}");
                              Get.toNamed(Routes.COIN_DETAILS, arguments: [
                                controller.coinData.value.Cryptos![index]
                              ]);
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                          "${controller.coinData.value
                                              .Cryptos?[index]?.image}"),
                                      height: 44.kh,
                                      width: 44.kw,
                                    ),

                                    SizedBox(
                                      width: 8.kw,
                                    ),

                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
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
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "\$ ${data?.priceUsd!.toStringAsFixed(2)}",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyleUtil.k16(
                                            color: ColorUtil.neutral4,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.kh,
                                        ),
                                        Text(
                           "${data?.priceChangePercentage_24h!.toStringAsFixed(2)}",
                                          style: TextStyleUtil.k14(
                                              color: "${data?.priceChangePercentage_24h!}".contains("-") ? Colors.red
                                                  : Colors.green,
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
            ],
          ),
        ),
      ),
    );
  }
}
