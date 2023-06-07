import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salvatara/app/modules/NFT/controllers/nft_controller.dart';
import 'package:salvatara/app/modules/NFT/views/nft_view.dart';
import 'package:salvatara/app/routes/app_pages.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:salvatara/app/widgets/BaseAppBar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../services/TextStyleUtil.dart';
import '../../../services/colors.dart';
import '../../web3/wallet_connect/wallect_connect_class.dart';

class TrendingNFTView extends StatelessWidget {
   TrendingNFTView({Key? key}) : super(key: key);

  NftController nftController = Get.find<NftController>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorUtil.kWhite,
      appBar: BaseAppBar(
          title: Text(
            "Trending NFT",
            style: TextStyleUtil.k24(),
          ),
          appBar: AppBar(),
          widgets: [],
          ontap: () {
            Get.back();
          },
          leading: true),
      body: (nftController.TreadingNftData.value.data?.isEmpty == null ||
          nftController.TreadingNftData.value.data?.length == 0)
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage("assets/images/noNFT.png"),
            ),
          ),
          Text(
            "No trending NFT yet",
            style: TextStyleUtil.k20(),
          ),
          SizedBox(
            height: 200.kh,
          ),
        ],
      )
          : Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: GridView.builder(
                itemCount: nftController.TreadingNftData.value.data?.length ==
                    null
                    ? 0
                    : nftController.TreadingNftData.value.data?.length,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.5,
                    mainAxisSpacing: 1.0),
                itemBuilder: (BuildContext context,
                    int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: NFTCoverSmall(
                      isBuy: true,
                      fontstyle: TextStyle(),
                      fontstyleSmall: TextStyle(),
                      Name:
                      "${nftController.TreadingNftData.value.data?[index]?.title}",
                      Description: "",
                      imgLink:
                      "${nftController.TreadingNftData.value.data?[index]?.imageURL}",
                      OnTap: () async {
                        Get.toNamed(Routes.NFT_DETAILS, arguments: [
                          nftController.TreadingNftData.value.data![index]!.Id
                              .toString(),
                          false
                        ]);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
