import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salvatara/app/modules/NFT/views/nft_view.dart';
import 'package:salvatara/app/routes/app_pages.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:salvatara/app/widgets/BaseAppBar.dart';

import '../controllers/nft_controller.dart';

class NewNFTView extends StatelessWidget {
  NewNFTView({Key? key}) : super(key: key);

  NftController nftController = Get.find<NftController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.kWhite,
      appBar: BaseAppBar(
          title: Text(
            "New NFT",
            style: TextStyleUtil.k24(),
          ),
          appBar: AppBar(),
          widgets: [],
          ontap: () {
            Get.back();
          },
          leading: true),
      body: (nftController.nftData.value.nft?.isEmpty == null ||
              nftController.nftData.value.nft?.length == 0)
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
                  "No new NFT yet",
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
                      itemCount: nftController.nftData.value.nft?.length == null
                          ? 0
                          : nftController.nftData.value.nft?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 10.0),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            print("object");
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8, left: 8),
                            child: NFTCoverSmall(
                              isBuy: true,
                              fontstyle: TextStyle(),
                              fontstyleSmall: TextStyle(),
                              Name:
                                  "${nftController.nftData.value.nft?[index]?.title}",
                              Description: "",
                              imgLink:
                                  "${nftController.nftData.value.nft?[index]?.imageURL}",
                              OnTap: () async {
                                Get.toNamed(Routes.NFT_DETAILS, arguments: [
                                  nftController.nftData.value.nft![index]!.Id
                                      .toString(),
                                  false
                                ]);
                              },
                            ),
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
