import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salvatara/app/modules/NFT/views/nft_view.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:salvatara/app/widgets/BaseAppBar.dart';

import '../../../routes/app_pages.dart';
import '../controllers/nft_controller.dart';

class AllCollection extends StatelessWidget {
  AllCollection({Key? key}) : super(key: key);

  NftController nftController = Get.find<NftController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.kWhite,
      appBar: BaseAppBar(
          title: Text(
            "Collection",
            style: TextStyleUtil.k24(),
          ),
          appBar: AppBar(),
          widgets: [],
          ontap: () {
            Get.back();
          },
          leading: true),
      body:  (nftController.nftData.value.nft?.isEmpty == null ||
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
            "No NFT collections yet",
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
              padding: EdgeInsets.all(16),
              child: GridView.builder(
                itemCount:
                    nftController.collectionDetails.value.date?.length == null
                        ? 0
                        : nftController.collectionDetails.value.date?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 2.0),
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: GestureDetector(
                      onTap: (){
                        Get.toNamed(Routes.COLLECTION_DETAILS,
                            arguments: [nftController.collectionDetails.value.date?[index]?.Id]);
                      },
                      child: CollectionCoverSmall(
                        Name:
                            '${nftController.collectionDetails.value.date?[index]?.title}',
                        Volume:
                            '${nftController.collectionDetails.value.date?[index]?.title}',
                        FloorPrice:
                            '${nftController.collectionDetails.value.date?[index]?.title}',
                        Profile:
                            '${nftController.collectionDetails.value.date?[index]?.profile}',
                        CoverImage:
                            '${nftController.collectionDetails.value.date?[index]?.cover}',
                        OverLay: false,
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
