import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/constants/constantSize.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:salvatara/app/widgets/BaseAppBar.dart';

import '../controllers/trade_controller.dart';

class TradeView extends GetView<TradeController> {
  const TradeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.kWhite,
      appBar: BaseAppBar(
          leading: false,
          title: Text(
            "Buy/Sell Token",
            style: TextStyleUtil.k24(),
          ),
          appBar: AppBar(),
          widgets: [],
          ontap: () {}),
      body: ContainedTabBarView(
        tabBarProperties: TabBarProperties(
            indicatorColor: ColorUtil.accent4,
            unselectedLabelStyle: TextStyleUtil.k14(color: ColorUtil.neutral2)),
        views: [
          Column(
            children: [
              SizedBox(
                height: Size_40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16.kw,
                  ),
                  Icon(
                    Icons.question_mark_sharp,
                    color: ColorUtil.accent4,
                  ),
                  SizedBox(
                    width: 14.kw,
                  ),
                  Text(
                    "How this works?",
                    style: TextStyleUtil.k14(color: ColorUtil.accent4),
                  ),
                ],
              ),
              SizedBox(
                height: Size_20,
              ),
              Center(
                child: Container(
                  height: 304.kh,
                  width: 343.kw,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(color: ColorUtil.neutral2)),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 44.kh,
                          decoration: BoxDecoration(
                              color: ColorUtil.neutral1,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 16.kw,
                              ),
                              Text(
                                "1 BTC = 22,124.99 USDT",
                                style: TextStyleUtil.k16(
                                    color: ColorUtil.neutral4),
                              ),
                              Spacer(),
                              Icon(
                                Icons.auto_graph_rounded,
                                color: ColorUtil.neutral4,
                              ),
                              SizedBox(
                                width: 16.kw,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 106.kh,
                          decoration: BoxDecoration(
                            color: ColorUtil.kWhite,
                            //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8))
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 16.kw,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Send",
                                    style: TextStyleUtil.k12(
                                        color: ColorUtil.neutral6,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    "35,641.20",
                                    style: TextStyleUtil.k18(),
                                  )
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 44.kh,
                                width: 128.kw,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: ColorUtil.neutral2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                              ),
                              SizedBox(
                                width: 16.kw,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: ColorUtil.neutral2,
                          thickness: 1,
                          height: 1.kh,
                        ),
                        Container(
                          height: 106.kh,
                          decoration: BoxDecoration(
                            color: ColorUtil.kWhite,
                            //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8))
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 16.kw,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Send",
                                    style: TextStyleUtil.k12(
                                        color: ColorUtil.neutral6,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    "35,641.20",
                                    style: TextStyleUtil.k18(),
                                  )
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 44.kh,
                                width: 128.kw,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: ColorUtil.neutral2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                              ),
                              SizedBox(
                                width: 16.kw,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 44.kh,
                          decoration: BoxDecoration(
                              color: ColorUtil.k4,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8))),
                          child: Center(
                            child: Text(
                              "Proceed",
                              style: TextStyleUtil.k16(color: ColorUtil.kWhite),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Size_24,
              ),
              Container(
                height: 48.kh,
                width: 343.kw,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: ColorUtil.neutral2)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16.kw,
                    ),
                    Icon(
                      Icons.timelapse_rounded,
                      color: ColorUtil.accent4,
                    ),
                    SizedBox(
                      width: 14.kw,
                    ),
                    Text(
                      "View Transaction History",
                      style: TextStyleUtil.k16(
                          color: ColorUtil.kBlack,
                          fontWeight: FontWeight.normal),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: ColorUtil.neutral3,
                    ),
                    SizedBox(
                      width: 16.kw,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: Size_40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16.kw,
                  ),
                  Icon(
                    Icons.question_mark_sharp,
                    color: ColorUtil.accent4,
                  ),
                  SizedBox(
                    width: 14.kw,
                  ),
                  Text(
                    "How this works?",
                    style: TextStyleUtil.k14(color: ColorUtil.accent4),
                  ),
                ],
              ),
              SizedBox(
                height: Size_20,
              ),
              Center(
                child: Container(
                  height: 304.kh,
                  width: 343.kw,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(color: ColorUtil.neutral2)),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 44.kh,
                          decoration: BoxDecoration(
                              color: ColorUtil.neutral1,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 16.kw,
                              ),
                              Text(
                                "1 BTC = 22,124.99 USDT",
                                style: TextStyleUtil.k16(
                                    color: ColorUtil.neutral4),
                              ),
                              Spacer(),
                              Icon(
                                Icons.auto_graph_rounded,
                                color: ColorUtil.neutral4,
                              ),
                              SizedBox(
                                width: 16.kw,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 106.kh,
                          decoration: BoxDecoration(
                            color: ColorUtil.kWhite,
                            //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8))
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 16.kw,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Send",
                                    style: TextStyleUtil.k12(
                                        color: ColorUtil.neutral6,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    "35,641.20",
                                    style: TextStyleUtil.k18(),
                                  )
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 44.kh,
                                width: 128.kw,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: ColorUtil.neutral2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                              ),
                              SizedBox(
                                width: 16.kw,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: ColorUtil.neutral2,
                          thickness: 1,
                          height: 1.kh,
                        ),
                        Container(
                          height: 106.kh,
                          decoration: BoxDecoration(
                            color: ColorUtil.kWhite,
                            //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8))
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 16.kw,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Send",
                                    style: TextStyleUtil.k12(
                                        color: ColorUtil.neutral6,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    "35,641.20",
                                    style: TextStyleUtil.k18(),
                                  )
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 44.kh,
                                width: 128.kw,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: ColorUtil.neutral2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                              ),
                              SizedBox(
                                width: 16.kw,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 44.kh,
                          decoration: BoxDecoration(
                              color: ColorUtil.k4,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8))),
                          child: Center(
                            child: Text(
                              "Proceed",
                              style: TextStyleUtil.k16(color: ColorUtil.kWhite),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Size_24,
              ),
              Container(
                height: 48.kh,
                width: 343.kw,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: ColorUtil.neutral2)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16.kw,
                    ),
                    Icon(
                      Icons.timelapse_rounded,
                      color: ColorUtil.accent4,
                    ),
                    SizedBox(
                      width: 14.kw,
                    ),
                    Text(
                      "View Transaction History",
                      style: TextStyleUtil.k16(
                          color: ColorUtil.kBlack,
                          fontWeight: FontWeight.normal),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: ColorUtil.neutral3,
                    ),
                    SizedBox(
                      width: 16.kw,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
        tabs: [
          Text('Buy', style: TextStyleUtil.k16()),
          Text('Sell', style: TextStyleUtil.k16()),
        ],
      ),
    );
  }
}
