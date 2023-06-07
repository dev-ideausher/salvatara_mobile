import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:salvatara/app/modules/NFT/views/nft_view.dart';
import 'package:salvatara/app/routes/app_pages.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/make_input.dart';
import 'package:salvatara/app/services/responsiveSize.dart';

import '../controllers/collection_details_controller.dart';

class CollectionDetailsView extends GetView<CollectionDetailsController> {
  const CollectionDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CollectionDetailsController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 195.kh,
                  child: Stack(
                    children: [
                      (controller.collectionOneDetail.value.date?.cover == null || controller.collectionOneDetail.value.date?.cover == '' ) ?Text("") :   SizedBox(
                        height: 160.kh,
                        width: double.infinity,
                        child: Image(
                          image: NetworkImage(
                            "${controller.collectionOneDetail.value.date?.cover}",
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 16,
                        child: CircleAvatar(
                          radius: 40.kh,
                          backgroundImage: NetworkImage(
                              "${controller.collectionOneDetail.value.date?.profile}"),
                        ),
                      ),
                      Positioned(
                        top: 14,
                        left: 20,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 45.kh,
                            width: 45.kh,
                            decoration: BoxDecoration(
                              color: ColorUtil.kWhite,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(Icons.arrow_back),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.collectionOneDetail.value.date?.title}",
                        style: TextStyleUtil.k24(),
                      ),
                      SizedBox(
                        height: 12.kh,
                      ),
                      Text(
                        "${controller.collectionOneDetail.value.date?.description}",
                        style: TextStyleUtil.k14(fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 24.kh,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CollectionTile(
                            Name: "Floor Price",
                            Price:
                                "${controller.collectionOneDetail.value.date?.floorprice?.toStringAsFixed(2)}",
                            Currency: true,
                          ),
                          CollectionTile(
                            Name: "Latest Price",
                            Price:
                                "${controller.collectionOneDetail.value.date?.latestPrice?.toStringAsFixed(2)}",
                            Currency: true,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.kh,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CollectionTile(
                            Name: "Total Volume",
                            Price:
                                "${controller.collectionOneDetail.value.date?.volume?.toStringAsFixed(2)}",
                            Currency: true,
                          ),
                          CollectionTile(
                            Name: "Total Items",
                            Price:
                                "${controller.collectionOneDetail.value.date?.noOfItems?.toStringAsFixed(2)}",
                            Currency: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                        height: 340.kw,
                        width: 500.kw,
                        padding: EdgeInsets.all(12.0),
                        child: Center(
                          child: (controller.collectionOneDetail.value.date?.nft
                                          ?.length ==
                                      null ||
                                  controller.collectionOneDetail.value.date?.nft
                                          ?.length ==
                                      0)
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Image(
                                        height: 40,
                                        width: 40,
                                        image: AssetImage(
                                            "assets/images/NoMinted.png"),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.kh,
                                    ),
                                    Text(
                                      "No NFTs minted at this time",
                                      style: TextStyleUtil.k24(),
                                    ),
                                    SizedBox(
                                      height: 10.kh,
                                    ),
                                    Text(
                                      "Create a new NFT, and start\nminting your unique digital asset",
                                      textAlign: TextAlign.center,
                                      style: TextStyleUtil.k12(
                                          fontWeight: FontWeight.normal,
                                          color: ColorUtil.neutral4),
                                    )
                                  ],
                                )
                              : GridView.builder(
                                  itemCount: controller.collectionOneDetail
                                              .value.date?.nft?.length ==
                                          null
                                      ? 0
                                      : controller.collectionOneDetail.value
                                          .date?.nft?.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 0.7,
                                          mainAxisSpacing: 10.0),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: NFTCoverSmall(
                                        isBuy: true,
                                        fontstyle: TextStyle(),
                                        fontstyleSmall: TextStyle(),
                                        Name:
                                            "${controller.collectionOneDetail.value.date?.nft?[index]?.title}",
                                        Description: "",
                                        imgLink:
                                            "${controller.collectionOneDetail.value.date?.nft?[index]?.imageURL}",
                                        OnTap: () async {
                                           Get.toNamed(Routes.NFT_DETAILS,arguments: [controller.collectionOneDetail.value.date?.nft?[index]?.Id,false]);

                                          // await launchUrl(
                                          //     Uri.parse(Get.find<
                                          //             Web3Connect>()
                                          //         .connector
                                          //         .session
                                          //         .toUri()),
                                          //     mode: LaunchMode
                                          //         .externalApplication);
                                          // var signature = await Get
                                          //         .find<Web3Connect>()
                                          //     .contractCallSellNFT(
                                          //         amount: 1,
                                          //         tokenID: controller
                                          //             .MintedNFTdata
                                          //             .value
                                          //             .arr?[index]
                                          //             ?.tokenId,
                                          //         isMatic: true);
                                          // print(signature);
                                          // if (signature != "") {
                                          //   await controller.postListNFT(
                                          //       nftId:
                                          //           "${controller.MintedNFTdata.value.arr?[index]?.Id}",
                                          //       txnHash:
                                          //           "${signature}");
                                          //
                                          //   Get.snackbar("Message",
                                          //       "NFT listed");
                                          // }
                                          // Get.toNamed(Routes.NFT_DETAILS, arguments: [
                                          //   controller.MintedNFTdata.value.arr?[index]?.Id
                                          //       .toString()
                                          // ]);
                                        },
                                      ),
                                    );
                                  },
                                ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CollectionTile extends StatelessWidget {
  final String Name;
  final String Price;
  final bool Currency;

  CollectionTile(
      {Key? key,
      required this.Name,
      required this.Price,
      required this.Currency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66.kh,
      width: 165.kw,
      decoration: BoxDecoration(
          border: Border.all(color: ColorUtil.neutral2),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${Name}",
            style: TextStyleUtil.k12(
              fontWeight: FontWeight.normal,
              color: ColorUtil.neutral4,
            ),
          ),
          SizedBox(
            height: 6.kh,
          ),
          Currency == true
              ? Text(
                  "${Price} USD",
                  style: TextStyleUtil.k14(color: ColorUtil.neutral6),
                )
              : Text(
                  "${Price}",
                  style: TextStyleUtil.k14(color: ColorUtil.neutral6),
                ),
        ],
      ),
    );
  }
}
