import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:salvatara/app/routes/app_pages.dart';
import 'package:salvatara/app/services/CustomButton.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/constants/constantText.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:salvatara/app/widgets/BaseAppBar.dart';

import '../../../services/constants/constantSize.dart';
import '../../web3/wallet_connect/wallect_connect_class.dart';

class WalletConnectProfile extends StatelessWidget {
  WalletConnectProfile({Key? key}) : super(key: key);

  Web3Connect web3connectController = Get.find<Web3Connect>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.kWhite,
      appBar: BaseAppBar(
          leading: true,
          title: Text(""),
          appBar: AppBar(),
          widgets: [],
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: EdgeInsets.all(Size_16),
        child: Obx(() =>
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _CONNECT_YOUR_WALLET(),
                  Spacer(),
                  CircleAvatar(
                    radius: 10.kh,
                    backgroundColor: web3connectController.account.value == ''
                        ? Colors.redAccent
                        : Colors.green,
                  ),
                  SizedBox(
                    width: 10.kw,
                  ),
                ],
              ),
              SizedBox(
                height: Size_10,
              ),
              Text(
                'Add your wallet to show the data.',
                style: TextStyleUtil.k14(
                    fontWeight: FontWeight.normal, color: ColorUtil.neutral4),
              ),
              SizedBox(
                height: Size_65,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset("assets/SVG/SalvaLogo.svg"),
                  SvgPicture.asset("assets/SVG/Connection.svg"),
                  SvgPicture.asset("assets/SVG/Metamask.svg"),
                ],
              ),
              SizedBox(
                height: Size_24,
              ),
              Container(
                height: 72.kh,
                width: 343.kw,
                decoration: BoxDecoration(
                    border: Border.all(color: ColorUtil.neutral2),
                    borderRadius: BorderRadius.all(Radius.circular(Size_8))),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(
                            () => SizedBox(
                              width: 300.kw,
                              child: Text(
                                "${web3connectController.account.value == '' ? "Account Address" : web3connectController.account.value}",
                                style: TextStyleUtil.k16(),
                              ),
                            ),
                          ),
                          // Text(
                          //   "Balance: \$120 (0.04 ETH)",
                          //   style: TextStyleUtil.k14(
                          //       color: ColorUtil.neutral4,
                          //       fontWeight: FontWeight.normal),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              web3connectController.sessionStatus.value == true
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 165.kw,
                    height: 48.kh,
                    child: CustomButton(
                      title: "Re - Connect",
                      borderRadius: 8,
                      onTap: () {
                        web3connectController.connect();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 165.kw,
                    height: 48.kh,
                    child: CustomButton(
                      color: Colors.redAccent,
                      title: "Disconnect",
                      borderRadius: 8,
                      onTap: () async{
                        await web3connectController.disconnect();

                      },
                    ),
                  ),
                ],
              )
                  : SizedBox(),
              SizedBox(
                height: 10.kh,
              ),


              Obx(
                () => Center(
                  child: SizedBox(
                    width: 300.kw,
                    child: CustomButton(
                      title: web3connectController.sessionStatus.value == true
                          ? "Continue"
                          : "Connect",
                      borderRadius: 8,
                      onTap: () {
                        web3connectController.sessionStatus.value == true
                            ? Get.back()
                            : web3connectController.connect();
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.kh,
              ),

              // Center(
              //   child: TextButton(
              //       onPressed: () {
              //         Get.toNamed(Routes.NAVBAR);
              //       },
              //       child: Text(
              //         "I’ll update later",
              //         style: TextStyleUtil.k16(color: ColorUtil.k4),
              //       )),
              // ),
              SizedBox(
                height: 38.kh,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _CONNECT_YOUR_WALLET() {
  return Text(
    ConstantText.CONNECT_YOUR_WALLET,
    style: TextStyleUtil.k24(
      color: ColorUtil.neutral6,
    ),
  );
}
