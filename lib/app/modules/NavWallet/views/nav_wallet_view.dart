import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/constants/constantSize.dart';
import 'package:salvatara/app/services/responsiveSize.dart';

import '../../../widgets/BaseAppBar.dart';
import '../controllers/nav_wallet_controller.dart';

class NavWalletView extends GetView<NavWalletController> {
  const NavWalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
          leading: false,
          title: Text(
            "Wallet",
            style: TextStyleUtil.k24(),
          ),
          appBar: AppBar(),
          widgets: [],
          ontap: () {}),
      backgroundColor: ColorUtil.kWhite,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Current Value",style: TextStyleUtil.k14(
              fontWeight: FontWeight.normal,
              color: ColorUtil.neutral4
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("\$2,388.5",style: TextStyleUtil.k32(),),
                SizedBox(
                  width: Size_8,
                ),
                Text("+15.23%",style: TextStyleUtil.k16(
                  color: ColorUtil.green700
                ),),
              ],
            ),
            SizedBox(
              height: Size_20,
            ),
            Text("Invested Value",style: TextStyleUtil.k14(
                fontWeight: FontWeight.normal,
                color: ColorUtil.neutral4
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("\$2,150.12",style: TextStyleUtil.k18(),),
                SizedBox(
                  width: Size_120,
                ),
                Text("+\$238.38",style: TextStyleUtil.k16(
                    color: ColorUtil.green700
                ),),
              ],
            ),
            SizedBox(
              height: Size_40,
            ),
            Text('Portfolio Graph',style: TextStyleUtil.k14(
                fontWeight: FontWeight.normal,
                color: ColorUtil.neutral4
            ),),
            SizedBox(
              height: Size_40,
            ),
            Text('Portfolio Holdings',style: TextStyleUtil.k14(
                fontWeight: FontWeight.normal,
                color: ColorUtil.neutral4
            ),),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage("assets/images/ApeSwap.png"),
                              height: 44.kh,
                              width: 44.kw,
                            ),
                            SizedBox(
                              width: 8.kw,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  "ApeSwap",
                                  style: TextStyleUtil.k16(),
                                ),
                                SizedBox(
                                  height: 4.kh,
                                ),
                                Text(
                                  "BTC",
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
                                  "ApeSwap",
                                  style: TextStyleUtil.k16(
                                    color: ColorUtil.neutral4,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.kh,
                                ),
                                Text(
                                  "+5.46%",
                                  style: TextStyleUtil.k14(
                                      color: ColorUtil.success,
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
                    );
                  }),
            ),

          ],
        ),
      ),
    );
  }
}
