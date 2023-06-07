import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:salvatara/app/modules/NFT/views/AllCollections.dart';
import 'package:salvatara/app/modules/NFT/views/New.dart';
import 'package:salvatara/app/modules/NFT/views/Trending.dart';
import 'package:salvatara/app/modules/Navbar/views/CollectionDetails.dart';
import 'package:salvatara/app/modules/Profile/controllers/profile_controller.dart';
import 'package:salvatara/app/modules/web3/wallet_connect/wallect_connect_class.dart';
import 'package:salvatara/app/routes/app_pages.dart';
import 'package:salvatara/app/services/CustomButton.dart';
import 'package:salvatara/app/services/Send_notification.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/notification_utils.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../services/constants/constantSize.dart';
import '../controllers/nft_controller.dart';

class NftView extends GetView<NftController> {
  NftView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NftController());

  //  FirebaseMessagingUtils.firebaseMessagingUtils.subFcm("${controller.userdetials.value.data?.Id}");
    return Scaffold(
      backgroundColor: ColorUtil.kWhite,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: ColorUtil.kWhite,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.SEARCH);
              },
              icon: Icon(
                Icons.search,
                color: ColorUtil.k6,
              )),
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.NOTIFICATIONS);
              },
              icon: Icon(
                Icons.notifications,
                color: ColorUtil.k6,
              )),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              style: TextStyleUtil.k14(
                  fontWeight: FontWeight.normal, color: ColorUtil.neutral4),
            ),
            SizedBox(
              height: 4.kh,
            ),
            Obx(
              () => Text(
                controller
                            .userdetials
                            .value
                            .data
                            ?.firstname ==
                        null
                    ? " "
                    : "${controller.userdetials.value.data?.firstname}",
                style: TextStyleUtil.k24(),
              ),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        displacement: 150,
        backgroundColor: Colors.white,
        color: ColorUtil.k6,
        strokeWidth: 3,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          await Future.delayed(Duration(milliseconds: 1500));
          return controller.onInit();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Size_16),
            child: Obx(
              () => Column(
                children: [
                  HeadingTile(
                    Name: "Trending",
                    ontap: () {
                      Get.to(TrendingNFTView());
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 300.kh,
                    child: (controller.TreadingNftData.value.data?.length ==
                                null ||
                            controller.TreadingNftData.value.data?.isEmpty ==
                                true)
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "No Trending NFT yet",
                                  style: TextStyleUtil.k20(),
                                ),
                                SizedBox(
                                  height: 5.kh,
                                ),
                                Text(
                                  "Start liking NFTs",
                                  style: TextStyleUtil.k14(
                                      fontWeight: FontWeight.normal,
                                      color: ColorUtil.k6),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                controller.TreadingNftData.value.data?.length ==
                                        null
                                    ? 0
                                    : controller.TreadingNftData.value.data!
                                                .length <
                                            3
                                        ? controller
                                            .TreadingNftData.value.data?.length
                                        : 3,
                            itemBuilder: (context, index) {
                              return NFTCover(
                                Name:
                                    "${controller.TreadingNftData.value.data![index]?.title}",
                                Description:
                                    "@${controller.TreadingNftData.value.data![index]?.collectionId?.user?.firstname}",
                                fontstyle: TextStyleUtil.k16(),
                                fontstyleSmall: TextStyleUtil.k14(
                                    fontWeight: FontWeight.normal,
                                    color: ColorUtil.neutral4),
                                imgLink:
                                    "${controller.TreadingNftData.value.data![index]?.imageURL}",
                                OnTap: () {
                                  Get.toNamed(Routes.NFT_DETAILS, arguments: [
                                    controller
                                        .TreadingNftData.value.data![index]!.Id
                                        .toString(),
                                    false
                                  ]);
                                },
                              );
                            },
                          ),
                  ),
                  SizedBox(
                    height: Size_40,
                  ),
                  HeadingTile(
                      Name: "New",
                      ontap: () {
                        Get.to(NewNFTView());
                      }),
                  Obx(
                    () => SizedBox(
                      width: double.infinity,
                      height: 300.kh,
                      child:
                      (controller.nftData.value.nft?.length ==
                          null ||
                          controller.nftData.value.nft?.isEmpty ==
                              true)
                          ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "No new NFT yet",
                              style: TextStyleUtil.k20(),
                            ),
                            SizedBox(
                              height: 5.kh,
                            ),
                            Text(
                              "Start uploading new NFTs",
                              style: TextStyleUtil.k14(
                                  fontWeight: FontWeight.normal,
                                  color: ColorUtil.k6),
                            ),
                          ],
                        ),
                      ):
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              controller.nftData.value.nft?.length,
                          itemBuilder: (context, index) {
                            return

                              NFTCover(
                              Name:
                                  "${controller.nftData.value.nft?[index]?.title}",
                              Description:
                              controller.nftData.value.nft?[index]?.collectionId?.user?.firstname == null ? "-" :  "@${controller.nftData.value.nft?[index]?.collectionId?.user?.firstname}",
                              fontstyle: TextStyleUtil.k16(),
                              fontstyleSmall: TextStyleUtil.k14(
                                  fontWeight: FontWeight.normal,
                                  color: ColorUtil.neutral4),
                              imgLink:
                                  "${controller.nftData.value.nft?[index]?.imageURL}",
                              OnTap: () async {
                                // await launchUrl(
                                //     Uri.parse(
                                //         Get.find<Web3Connect>()
                                //             .connector
                                //             .session
                                //             .toUri()),
                                //     mode: LaunchMode
                                //     .externalApplication);

                                // await launchUrl(
                                //     Uri.parse(
                                //         Get.find<Web3Connect>()
                                //             .connector
                                //             .session
                                //             .toUri()),
                                //     mode: LaunchMode
                                //     .externalApplication);
                                // Get.find<Web3Connect>().contractCallSellNFT(amount:0.01, tokenID: 7, isMatic: true);

                                // var isMatic = await Get.find<Web3Connect>().getNFTDetails(TokenID: "${controller.nftData.value.nft?[index]?.tokenId}");
                                // if(isMatic == true){
                                //    await launchUrl(
                                //        Uri.parse(
                                //            Get.find<Web3Connect>()
                                //                .connector
                                //                .session
                                //                .toUri()),
                                //        mode: LaunchMode
                                //        .externalApplication);
                                //    Get.find<Web3Connect>().contractCallBuyNFT(amount:1, tokenID:controller.nftData.value.nft?[index]?.tokenId);
                                //  }else{
                                //    await launchUrl(
                                //        Uri.parse(
                                //            Get.find<Web3Connect>()
                                //                .connector
                                //                .session
                                //                .toUri()),
                                //        mode: LaunchMode
                                //            .externalApplication);
                                //  var signature = await Get.find<Web3Connect>().contractSalvaCoin();
                                //
                                //
                                //  if(signature == ""){
                                //
                                //  }else{
                                //    // await launchUrl(
                                //    //     Uri.parse(
                                //    //         Get.find<Web3Connect>()
                                //    //             .connector
                                //    //             .session
                                //    //             .toUri()),
                                //    //     mode: LaunchMode
                                //    //         .externalApplication);
                                //   await Get.find<Web3Connect>().contractCallBuyNFT(amount: controller.nftData.value.nft?[index]?.price, tokenID: controller.nftData.value.nft?[index]?.tokenId);
                                //  }
                                //
                                //  }
                                Get.toNamed(Routes.NFT_DETAILS, arguments: [
                                  "${controller.nftData.value.nft?[index]?.Id}",
                                  false
                                ]);
                              },
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: Size_40,
                  ),
                  HeadingTile(
                    Name: "Collections",
                    ontap: () {
                      Get.to(AllCollection());
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 181.kh,
                    child:(controller.collectionDetails.value.date?.length ==
                        null ||
                        controller.collectionDetails.value.date?.isEmpty ==
                            true)
                        ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "No NFT collection yet",
                            style: TextStyleUtil.k20(),
                          ),
                          SizedBox(
                            height: 5.kh,
                          ),
                          Text(
                            "Start making new NFT collections",
                            style: TextStyleUtil.k14(
                                fontWeight: FontWeight.normal,
                                color: ColorUtil.k6),
                          ),
                        ],
                      ),
                    ) : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            controller.collectionDetails.value.date?.length,
                        itemBuilder: (context, index) {
                          var data =
                              controller.collectionDetails.value.date?[index];
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.COLLECTION_DETAILS,
                                  arguments: [data?.Id]);
                            },
                            child: CollectionCover(
                              Name: '${data?.title}',
                              Volume: "${data?.volume}",
                              FloorPrice: data?.price == null ? "-":"${data?.price}",
                              CoverImage: "${data?.cover}",
                              Profile: "${data?.profile}",
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NFTCover extends StatelessWidget {
  final height;
  final width;
  final TextStyle fontstyle;
  final TextStyle fontstyleSmall;
  final String Name;
  final String Description;
  final String imgLink;
  final Function() OnTap;

  NFTCover(
      {Key? key,
      this.height,
      this.width,
      required this.fontstyle,
      required this.fontstyleSmall,
      required this.Name,
      required this.Description,
      required this.imgLink,
      required this.OnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: OnTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: CachedNetworkImage(
          imageUrl: "${imgLink}",
          imageBuilder: (context, imageProvider) => Container(
            height: height ?? 300.kh,
            width: width ?? 240.kw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: ColorUtil.neutral2),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
            // radius: ImageSize,

            // backgroundColor: ColorUtil.kWhite,
            // backgroundImage: imageProvider,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 60.kh,
                    width: 240.kw,
                    decoration: BoxDecoration(
                        color: ColorUtil.kWhite,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8))),
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 12),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${Name}",
                                  style: fontstyle,
                                ),
                                Text(
                                  "${Description}",
                                  style: fontstyleSmall,
                                ),
                              ],
                            ),
                            Spacer(),
                            SizedBox(
                                height: 28.kh,
                                width: 50.kw,
                                child: CustomButton(
                                  title: "Buy",
                                  borderRadius: 4,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: height ?? 300.kh,
              width: width ?? 240.kw,
            ),
          ),
          errorWidget: (context, url, error) => SizedBox(
              height: height ?? 300.kh,
              width: width ?? 240.kw,
              child: Icon(Icons.broken_image)),
        ),
      ),

      // Padding(
      //   padding: EdgeInsets.only(right: 16.0),
      //   child: Container(
      //     height: height ?? 300.kh,
      //     width: width ?? 240.kw,
      //     decoration: BoxDecoration(
      //       borderRadius:  BorderRadius.all(Radius.circular(8)),
      //       border: Border.all(color: ColorUtil.neutral2),
      //       image: DecorationImage(
      //         image: NetworkImage("${imgLink}"),
      //         fit: BoxFit.cover,
      //       ),
      //     ),
      //     child:
      //
      //     Center(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.end,
      //         mainAxisAlignment: MainAxisAlignment.end,
      //         children: [
      //           Container(
      //             height: 60.kh,
      //             width: 240.kw,
      //             decoration: BoxDecoration(
      //                 color: ColorUtil.kWhite,
      //                 borderRadius: BorderRadius.only(
      //                     bottomLeft: Radius.circular(8),
      //                     bottomRight: Radius.circular(8))),
      //             child: Padding(
      //               padding:  EdgeInsets.only(left: 12.0, right: 12),
      //               child: Center(
      //                 child: Row(
      //                   crossAxisAlignment: CrossAxisAlignment.center,
      //                   children: [
      //                     Column(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Text(
      //                           "${Name}",
      //                           style: fontstyle,
      //                         ),
      //                         Text(
      //                           "${Description}",
      //                           style: fontstyleSmall,
      //                         ),
      //                       ],
      //                     ),
      //                     Spacer(),
      //                     SizedBox(
      //                         height: 28.kh,
      //                         width: 50.kw,
      //                         child: CustomButton(
      //                           title: "Buy",
      //                           borderRadius: 4,
      //                         )),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

class HeadingTile extends StatelessWidget {
  final String Name;
  final Function() ontap;

  HeadingTile({Key? key, required this.Name, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${Name}",
          style: TextStyleUtil.k20(),
        ),
        Spacer(),
        TextButton(
            onPressed: ontap,
            child: Text(
              "View all",
              style: TextStyleUtil.k16(),
            )),
      ],
    );
  }
}

class CollectionCover extends StatelessWidget {
  final String Name;

  final String Volume;
  final String FloorPrice;
  final String Profile;
  final String CoverImage;

  CollectionCover(
      {Key? key,
      required this.Name,
      required this.Volume,
      required this.FloorPrice,
      required this.Profile,
      required this.CoverImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: Container(
        height: 181.kh,
        width: 176.kw,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: ColorUtil.neutral2),
          image: DecorationImage(
              image: NetworkImage("${CoverImage}"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 48.kh,
                    width: 240.kw,
                    decoration: BoxDecoration(
                      color: ColorUtil.kWhite,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 12),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "${Name}",
                              style: TextStyleUtil.k14(),
                            ),
                            SizedBox(
                              height: Size_4,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1.kh,
                    color: ColorUtil.neutral2,
                    thickness: 1,
                  ),
                  Container(
                    height: 62.kh,
                    width: 240.kw,
                    decoration: BoxDecoration(
                        color: ColorUtil.kWhite,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8))),
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 12, top: 12),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Volume",
                                  style: TextStyleUtil.k12(
                                      fontWeight: FontWeight.normal,
                                      color: ColorUtil.neutral4),
                                ),
                                Text(
                                  "\$${Volume}",
                                  style: TextStyleUtil.k18(),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Floor Price",
                                  style: TextStyleUtil.k12(
                                      fontWeight: FontWeight.normal,
                                      color: ColorUtil.neutral4),
                                ),
                                Text(
                                  "\$${FloorPrice}",
                                  style: TextStyleUtil.k18(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 45.kh,
                left: 50.kw,
                right: 50.kw,
                child: CachedNetworkImage(
                  imageUrl: "${Profile}",
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: 24,
                    backgroundColor: ColorUtil.kWhite,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.transparent,
                      backgroundImage: imageProvider,
                    ),
                  ),
                  placeholder: (context, url) => SizedBox(
                      height: 20.kh,
                      width: 20.kw,
                      child: Center(
                          child: SizedBox(
                        width: 200.0,
                        height: 100.0,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          child: CircleAvatar(
                            radius: 40,
                          ),
                        ),
                      ))),
                  errorWidget: (context, url, error) => SizedBox(
                      height: 20.kh,
                      width: 20.kw,
                      child: Center(
                          child: Icon(
                        Icons.image,
                        color: ColorUtil.neutral3,
                      ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CollectionCoverSmall extends StatelessWidget {
  final String Name;
  final bool OverLay;
  final String Volume;
  final String FloorPrice;
  final String Profile;
  final String CoverImage;

  CollectionCoverSmall(
      {Key? key,
      required this.Name,
      required this.Volume,
      required this.FloorPrice,
      required this.Profile,
      required this.CoverImage,
      required this.OverLay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: Stack(
        children: [
          Container(
            height: 170.kh,
            width: 164.kh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              border: Border.all(color: ColorUtil.neutral2),
              image: DecorationImage(
                  image: NetworkImage("${CoverImage}"), fit: BoxFit.cover),
            ),
            child: Center(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 68.kh,
                        width: 164.kw,
                        decoration: BoxDecoration(
                          color: ColorUtil.kWhite,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 12.0, right: 12),
                          child: Center(
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 35.kh,
                                ),
                                Text(
                                  "${Name}",
                                  style: TextStyleUtil.k14(),
                                ),
                                SizedBox(
                                  height: Size_4,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 1.kh,
                        color: ColorUtil.neutral2,
                        thickness: 1,
                      ),
                      // Container(
                      //   height: 68.kh,
                      //   width: 164.kw,
                      //   decoration: BoxDecoration(
                      //       color: ColorUtil.kWhite,
                      //       borderRadius: BorderRadius.only(
                      //           bottomLeft: Radius.circular(8),
                      //           bottomRight: Radius.circular(8))),
                      //   child: Padding(
                      //     padding: EdgeInsets.only(left: 12.0, right: 12, top: 12),
                      //     child: Center(
                      //       child: Row(
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //           Column(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 "Volume",
                      //                 style: TextStyleUtil.k12(
                      //                     fontWeight: FontWeight.normal,
                      //                     color: ColorUtil.neutral4),
                      //               ),
                      //               Text(
                      //                 "\$${Volume}",
                      //                 style: TextStyleUtil.k18(),
                      //               ),
                      //             ],
                      //           ),
                      //           Spacer(),
                      //           Column(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 "Floor Price",
                      //                 style: TextStyleUtil.k12(
                      //                     fontWeight: FontWeight.normal,
                      //                     color: ColorUtil.neutral4),
                      //               ),
                      //               Text(
                      //                 "\$${FloorPrice}",
                      //                 style: TextStyleUtil.k18(),
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  Positioned(
                    top: 75.kh,
                    left: 50.kw,
                    right: 50.kw,
                    child: CachedNetworkImage(
                      imageUrl: "${Profile}",
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        radius: 24,
                        backgroundColor: ColorUtil.kWhite,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.transparent,
                          backgroundImage: imageProvider,
                        ),
                      ),
                      placeholder: (context, url) => SizedBox(
                          height: 20.kh,
                          width: 20.kw,
                          child: Center(
                              child: SizedBox(
                            width: 200.0,
                            height: 100.0,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: Colors.white,
                              child: CircleAvatar(
                                radius: 40,
                              ),
                            ),
                          ))),
                      errorWidget: (context, url, error) => SizedBox(
                          height: 20.kh,
                          width: 20.kw,
                          child: Center(
                              child: Icon(
                            Icons.image,
                            color: ColorUtil.neutral3,
                          ))),
                    ),
                  ),
                ],
              ),
            ),
          ),
          OverLay == true
              ? Container(
                  height: 172.kh,
                  width: 164.kw,
                  decoration:
                      BoxDecoration(color: ColorUtil.k4.withOpacity(0.2)),
                )
              : Container(),
        ],
      ),
    );
  }
}

class NFTCoverShimmer extends StatelessWidget {
  final height;
  final width;
  final TextStyle fontstyle;
  final TextStyle fontstyleSmall;
  final String Name;
  final String Description;
  final String imageLink;

  NFTCoverShimmer(
      {Key? key,
      this.height,
      this.width,
      required this.fontstyle,
      required this.fontstyleSmall,
      required this.Name,
      required this.Description,
      required this.imageLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0),
      child: CachedNetworkImage(
        imageUrl: "${imageLink}",
        imageBuilder: (context, imageProvider) => Container(
          height: height ?? 300.kh,
          width: width ?? 240.kw,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: ColorUtil.neutral2),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 60.kh,
                  width: 240.kw,
                  decoration: BoxDecoration(
                      color: ColorUtil.kWhite,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${Name}",
                                style: fontstyle,
                              ),
                              Text(
                                "${Description}",
                                style: fontstyleSmall,
                              ),
                            ],
                          ),
                          Spacer(),
                          SizedBox(
                              height: 28.kh,
                              width: 50.kw,
                              child: CustomButton(
                                title: "Buy",
                                borderRadius: 4,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
            height: 120.kh,
            width: 120.kw,
            child: Center(
                child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 120.kh,
                width: 120.kw,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Colors.black12),
                child: Center(
                  child: SizedBox(
                      height: 50.kh,
                      width: 50.kw,
                      child: SvgPicture.asset(
                        "assets/SVG/musicNote.svg",
                        color: Colors.black,
                      )),
                ),
              ),
            )

//CircularLoader()

                )),
        errorWidget: (context, url, error) => SizedBox(
            height: 120.kh,
            width: 120.kw,
            child: Icon(
              Icons.broken_image,
              color: Colors.grey,
            )),
      ),
    );
  }
}

class NFTCoverSmall extends StatelessWidget {
  final height;
  final width;
  final TextStyle fontstyle;
  final TextStyle fontstyleSmall;
  final String Name;
  final String Description;
  final String imgLink;
  final Function() OnTap;
  final bool isBuy;

  NFTCoverSmall(
      {Key? key,
      this.height,
      this.width,
      required this.fontstyle,
      required this.fontstyleSmall,
      required this.Name,
      required this.Description,
      required this.imgLink,
      required this.OnTap,
      required this.isBuy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: OnTap,
      child: Center(
        child: Container(
          height: height ?? 240.kh,
          width: width ?? 164.kw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: ColorUtil.neutral2),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CachedNetworkImage(
                  imageUrl: "${imgLink}",
                  imageBuilder: (context, imageProvider) => Container(
                    height: height ?? 113.kh,
                    width: width ?? 164.kw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(color: ColorUtil.neutral2),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => SizedBox(
                      height: height ?? 117.kh,
                      width: width ?? 164.kw,
                      child: Center(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: height ?? 117.kh,
                            width: width ?? 164.kw,
                          ),
                        ),
                      )),
                  errorWidget: (context, url, error) => SizedBox(
                      height: height ?? 117.kh,
                      width: width ?? 164.kw,
                      child: Center(
                          child: Icon(
                        Icons.image,
                        color: ColorUtil.neutral3,
                      ))),
                ),
                Container(
                  height: 40.kh,
                  width: 500.kw,
                  decoration: BoxDecoration(
                      color: ColorUtil.kWhite,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 12),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 70.kw,
                                child: Text(
                                  "${Name}",
                                  style: fontstyle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                "${Description}",
                                style: fontstyleSmall,
                              ),
                            ],
                          ),
                          Spacer(),
                          SizedBox(
                            height: 20.kh,
                            width: 40.kw,
                            child: CustomButton(
                              color: isBuy == true ? ColorUtil.k5 : Colors.red,
                              title: isBuy == true ? "Buy" : "Sell",
                              borderRadius: 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
