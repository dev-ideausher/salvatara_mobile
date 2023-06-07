import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salvatara/app/modules/NFT/controllers/nft_controller.dart';
import 'package:salvatara/app/modules/NFT/views/nft_view.dart';
import 'package:salvatara/app/modules/Profile/views/WalletConnect.dart';
import 'package:salvatara/app/modules/nftDetails/views/nft_details_view.dart';
import 'package:salvatara/app/services/CommonImage.dart';
import 'package:salvatara/app/services/CommonSnackBar.dart';
import 'package:salvatara/app/services/CustomButton.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/make_input.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/app_pages.dart';
import '../../../services/storage.dart';
import '../../web3/wallet_connect/wallect_connect_class.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController()).refrehjh();
    return Scaffold(
      floatingActionButton: Material(
        child: Obx(
          () => controller.tabIndex.value == 1
              ? ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.CREATE_COLLECTION, arguments: [
                      "${controller.userdetials.value.data?.Id}"
                    ]);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => ColorUtil.k4),
                  ),
                  child: SizedBox(
                    width: 140.kw,
                    height: 44.kh,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: ColorUtil.kWhite,
                        ),
                        SizedBox(
                          width: 8.17.kw,
                        ),
                        Text(
                          "Create New",
                          style: TextStyleUtil.k16(color: ColorUtil.kWhite),
                        ),
                      ],
                    ),
                  ),
                )
              : ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.MINT_N_F_T);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => ColorUtil.k4),
                  ),
                  child: SizedBox(
                    width: 140.kw,
                    height: 44.kh,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: ColorUtil.kWhite,
                        ),
                        SizedBox(
                          width: 8.17.kw,
                        ),
                        Text(
                          "Create New",
                          style: TextStyleUtil.k16(color: ColorUtil.kWhite),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
        // Container(
        //   width: 140.kw,
        //   height: 44.kh,
        //   decoration: BoxDecoration(
        //       color: ColorUtil.k4,
        //       borderRadius: BorderRadius.all(Radius.circular(8))),
        //   child: Center(
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         SizedBox(
        //           width: 2.kw,
        //         ),
        //         Icon(
        //           Icons.add,
        //           color: ColorUtil.kWhite,
        //         ),
        //
        //         Text(
        //           "Create New",
        //           style: TextStyleUtil.k16(color: ColorUtil.kWhite),
        //         ),
        //         SizedBox(
        //           width: 2.kw,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
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
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Container(
                        height: 195.kh,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Image(image: AssetImage("assets/images/bgImg.png")),
                            Positioned(
                              bottom: 0,
                              left: 16,
                              child: CommonImageCircular(
                                ImageLink:
                                    "${controller.userdetials.value.data?.selfie}",
                                ImageSize: 40.kh,
                              ),
                              // CircleAvatar(
                              //   backgroundColor: ColorUtil.kWhite,
                              //   radius: 40.kh,
                              //   backgroundImage: NetworkImage(
                              //       "${controller.userdetials.value.data?.selfie}"),
                              // ),
                            ),
                            controller.optionsBool.value == true
                                ? Positioned(
                                    top: 14,
                                    right: 20,
                                    child: options(),
                                  )
                                : SizedBox(),
                            Positioned(
                              top: 14,
                              right: 20,
                              child: GestureDetector(
                                onTap: () {
                                  if (controller.optionsBool.value == true) {
                                    controller.optionsBool.value = false;
                                  } else {
                                    controller.optionsBool.value = true;
                                  }
                                  ;
                                },
                                child: Container(
                                  height: 45.kh,
                                  width: 45.kh,
                                  decoration: BoxDecoration(
                                    color: ColorUtil.kWhite,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child:
                                        SvgPicture.asset("assets/SVG/dots.svg"),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${controller.userdetials.value.data?.firstname} ${controller.userdetials.value.data?.lastname}",
                            style: TextStyleUtil.k24(),
                          ),
                          SizedBox(
                            height: 12.kh,
                          ),
                          Row(
                            children: [
                              Text(
                                "${controller.userdetials.value.data?.followersCount}",
                                style: TextStyleUtil.k14(
                                    color: ColorUtil.accent4,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                width: 5.kw,
                              ),
                              Text(
                                "Following",
                                style: TextStyleUtil.k14(
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                width: 24.kw,
                              ),
                              Text(
                                "${controller.userdetials.value.data?.followersCount}",
                                style: TextStyleUtil.k14(
                                    color: ColorUtil.accent4,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                width: 5.kw,
                              ),
                              Text(
                                "Followers",
                                style: TextStyleUtil.k14(
                                    fontWeight: FontWeight.normal),
                              ),
                              Spacer(),
                              SizedBox(
                                height: 28.kh,
                                width: 70.kw,
                                child: CustomButton(
                                  onTap: () {
                                    Get.toNamed(Routes.EDIT_PROFILE);
                                  },
                                  title: "Edit",
                                  borderRadius: 8,
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: 28.kh,
                          //   width: 70.kw,
                          //   child: CustomButton(
                          //     onTap: () {
                          //       // Get.find<GetStorageService>().logout();
                          //       // Get.delete();
                          //       // Get.offAllNamed(Routes.LOGIN);
                          //     },
                          //     title: "Logout",
                          //     borderRadius: 8,
                          //   ),
                          // ),
                          Obx(
                            () => SizedBox(
                              height: 394.kh,
                              child: ContainedTabBarView(
                                onChange: (index) {
                                  controller.tabIndex.value = index;
                                  print(index);
                                },
                                tabBarProperties: TabBarProperties(
                                    indicatorColor: ColorUtil.accent4,
                                    unselectedLabelStyle: TextStyleUtil.k12(
                                        color: ColorUtil.neutral2)),
                                views: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 10.kh,
                                      ),
                                      Expanded(
                                          // height: 340.kw,
                                          // width: 500.kw,
                                          // padding: EdgeInsets.all(12.0),
                                          child: Center(
                                        child:
                                            (controller.MintedNFTdata.value.arr
                                                            ?.length ==
                                                        null ||
                                                    controller
                                                            .MintedNFTdata
                                                            .value
                                                            .arr
                                                            ?.length ==
                                                        0)
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
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
                                                        style:
                                                            TextStyleUtil.k24(),
                                                      ),
                                                      SizedBox(
                                                        height: 10.kh,
                                                      ),
                                                      Text(
                                                        "Create a new NFT, and start\nminting your unique digital asset",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            TextStyleUtil.k12(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: ColorUtil
                                                                    .neutral4),
                                                      )
                                                    ],
                                                  )
                                                : GridView.builder(
                                                    itemCount: controller
                                                                .MintedNFTdata
                                                                .value
                                                                .arr
                                                                ?.length ==
                                                            null
                                                        ? 0
                                                        : controller
                                                            .MintedNFTdata
                                                            .value
                                                            .arr
                                                            ?.length,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            crossAxisSpacing:
                                                                0.7,
                                                            mainAxisSpacing:
                                                                10.0),
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: NFTCoverSmall(
                                                          isBuy: false,
                                                          fontstyle:
                                                              TextStyle(),
                                                          fontstyleSmall:
                                                              TextStyle(),
                                                          Name:
                                                              "${controller.MintedNFTdata.value.arr?[index]?.title}",
                                                          Description: "",
                                                          imgLink:
                                                              "${controller.MintedNFTdata.value.arr?[index]?.imageURL}",
                                                          OnTap: () async {
                                                            // Get.toNamed(Routes.NFT_DETAILS,arguments: [controller.MintedNFTdata.value.arr?[index]?.Id]);
                                                            Get.defaultDialog(
                                                                title: '',
                                                                content: Obx(
                                                                  () =>
                                                                      Container(
                                                                    height:
                                                                        230.kh,
                                                                    width:
                                                                        200.kw,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            color:
                                                                                ColorUtil.kWhite),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Text(
                                                                          "Sell NFT",
                                                                          style:
                                                                              TextStyleUtil.k24(),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              15.kh,
                                                                        ),
                                                                        MakeInput(
                                                                          controllerID: controller
                                                                              .NFTSellingAmountController
                                                                              .value,
                                                                          hintText:
                                                                              "Enter Amount",
                                                                          label:
                                                                              "label",
                                                                          obscureText:
                                                                              false,
                                                                          width:
                                                                              210.kw,
                                                                          passwordField:
                                                                              false,
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10.kh,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Text(
                                                                              "MATIC",
                                                                              style: TextStyleUtil.k16(),
                                                                            ),
                                                                            Spacer(),
                                                                            Switch(
                                                                              value: controller.IsMatic.value,
                                                                              onChanged: (value) {
                                                                                controller.IsMatic.value = value;
                                                                                print(controller.IsMatic.value);
                                                                                if (controller.IsMatic.value == true) {
                                                                                  controller.IsMaticString.value = "matic";
                                                                                } else {
                                                                                  controller.IsMaticString.value = "salvacoin";
                                                                                }
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              15.kh,
                                                                        ),
                                                                        CustomButton(
                                                                          title:
                                                                              "Sell",
                                                                          onTap:
                                                                              () async {
                                                                            if (controller.NFTSellingAmountController.value.text == '' ||
                                                                                controller.NFTSellingAmountController.value.text.isEmpty) {
                                                                              snackBarClass("Please enter the amount.").WarningSnackBar;
                                                                            } else {
                                                                              var ListingFee = await Get.find<Web3Connect>().getListingFee();
                                                                              await launchUrl(Uri.parse(Get.find<Web3Connect>().connector.session.toUri()), mode: LaunchMode.externalApplication);
                                                                              var signature = await Get.find<Web3Connect>().contractCallSellNFT(
                                                                                amount: double.parse("${controller.NFTSellingAmountController.value.text}"),
                                                                                tokenID: controller.MintedNFTdata.value.arr?[index]?.tokenId,
                                                                                isMatic: controller.IsMatic.value,
                                                                                ListingFee: "${ListingFee}",
                                                                              );
                                                                              print(signature);
                                                                              if (signature != "") {
                                                                                await controller.postListNFT(nftId: "${controller.MintedNFTdata.value.arr?[index]?.Id}", txnHash: "${signature}", Price: double.parse(controller.NFTSellingAmountController.value.text.toString()));

                                                                                await controller.getMintedNFTDetails();
                                                                                await Get.find<NftController>().onInit();
                                                                                Get.back();
                                                                                Get.snackbar("Message", "NFT listed");
                                                                              }
                                                                            }
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ));
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  ),
                                      )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 10.kh,
                                      ),
                                      Expanded(
                                          // height: 250.kw,
                                          // width: 500.kw,
                                          // padding: EdgeInsets.all(12.0),
                                          child: Center(
                                        child: (controller.UserCollection.value
                                                        .users?.length ==
                                                    null ||
                                                controller.UserCollection.value
                                                        .users?.length ==
                                                    0)
                                            ? Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: Image(
                                                      height: 40,
                                                      width: 40,
                                                      image: AssetImage(
                                                          "assets/images/NoCollection.png"),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20.kh,
                                                  ),
                                                  Text(
                                                    "No Collection at this time",
                                                    style: TextStyleUtil.k24(),
                                                  ),
                                                  SizedBox(
                                                    height: 10.kh,
                                                  ),
                                                  Text(
                                                    "Create a new NFT Collection",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyleUtil.k12(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            ColorUtil.neutral4),
                                                  )
                                                ],
                                              )
                                            : GridView.builder(
                                                itemCount: controller
                                                            .UserCollection
                                                            .value
                                                            .users
                                                            ?.length ==
                                                        null
                                                    ? 0
                                                    : controller.UserCollection
                                                        .value.users?.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 1,
                                                  mainAxisSpacing: 10,
                                                ),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          Routes
                                                              .COLLECTION_DETAILS,
                                                          arguments: [
                                                            controller
                                                                .UserCollection
                                                                .value
                                                                .users?[index]
                                                                ?.Id
                                                          ]);
                                                    },
                                                    child: CollectionCoverSmall(
                                                      Name:
                                                          "${controller.UserCollection.value.users?[index]?.title}",
                                                      Volume: "{Volume}",
                                                      FloorPrice: "FloorPrice",
                                                      Profile:
                                                          "${controller.UserCollection.value.users?[index]?.profile}",
                                                      CoverImage:
                                                          "${controller.UserCollection.value.users?[index]?.cover}",
                                                      OverLay: false,
                                                    ),
                                                  );
                                                },
                                              ),
                                      )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 10.kh,
                                      ),
                                      Expanded(
                                          // height: 250.kw,
                                          // width: 500.kw,
                                          // padding: EdgeInsets.all(12.0),

                                          child: Center(
                                        child: (controller
                                                        .CollectedNFTdata
                                                        .value
                                                        .data
                                                        ?.nftId
                                                        ?.length ==
                                                    null ||
                                                controller
                                                        .CollectedNFTdata
                                                        .value
                                                        .data
                                                        ?.nftId
                                                        ?.length ==
                                                    0)
                                            ? Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: Image(
                                                      height: 40,
                                                      width: 40,
                                                      image: AssetImage(
                                                          "assets/images/NoCollection.png"),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20.kh,
                                                  ),
                                                  Text(
                                                    "No Collrcted  NFTs at this time",
                                                    style: TextStyleUtil.k24(),
                                                  ),
                                                  SizedBox(
                                                    height: 10.kh,
                                                  ),
                                                  Text(
                                                    "Start buying new NFTs from marketplace",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyleUtil.k12(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            ColorUtil.neutral4),
                                                  )
                                                ],
                                              )
                                            : GridView.builder(
                                                itemCount: controller
                                                            .CollectedNFTdata
                                                            .value
                                                            .data
                                                            ?.nftId
                                                            ?.length ==
                                                        null
                                                    ? 0
                                                    : controller
                                                        .CollectedNFTdata
                                                        .value
                                                        .data
                                                        ?.nftId
                                                        ?.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 1,
                                                  mainAxisSpacing: 10,
                                                ),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return NFTCoverSmall(
                                                    isBuy: false,
                                                    fontstyle:
                                                        TextStyleUtil.k12(),
                                                    fontstyleSmall:
                                                        TextStyleUtil.k12(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color: ColorUtil
                                                                .neutral4),
                                                    Name:
                                                        "${controller.CollectedNFTdata.value.data?.nftId?[index]?.title}",
                                                    Description:
                                                        "${controller.CollectedNFTdata.value.data?.userId?.name}",
                                                    imgLink:
                                                        "${controller.CollectedNFTdata.value.data?.nftId?[index]?.imageURL}",
                                                    OnTap: () async {
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
                                                      //         isMatic: controller
                                                      //             .IsMatic.value);
                                                      // print(signature);
                                                      // if (signature != "") {
                                                      //   await controller.postListNFT(
                                                      //       nftId:
                                                      //           "${controller.CollectedNFTdata.value.data?.nftId?[index]?.Id}",
                                                      //       txnHash:
                                                      //           "${signature}",
                                                      //       Price:
                                                      //           "${controller.NFTSellingAmountController.value.text}");
                                                      //
                                                      //   Get.snackbar("Message",
                                                      //       "NFT listed");
                                                      // }

                                                      Get.toNamed(
                                                          Routes.NFT_DETAILS,
                                                          arguments: [
                                                            controller
                                                                .CollectedNFTdata
                                                                .value
                                                                .data
                                                                ?.nftId?[index]
                                                                ?.Id
                                                                .toString(),
                                                            true
                                                          ]);
                                                    },
                                                  );
                                                },
                                              ),
                                      )),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10.kh,
                                      ),
                                      Expanded(
                                          // height: 250.kw,
                                          // width: 500.kw,
                                          // padding: EdgeInsets.all(12.0),
                                          child: Center(
                                        child: (controller.userFavourite.value
                                                        .favourites?.length ==
                                                    null ||
                                                controller.userFavourite.value
                                                        .favourites?.length ==
                                                    0)
                                            ? Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: Image(
                                                      height: 40,
                                                      width: 40,
                                                      image: AssetImage(
                                                          "assets/images/NoFav.png"),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20.kh,
                                                  ),
                                                  Text(
                                                    "No Favourites at this time",
                                                    style: TextStyleUtil.k24(),
                                                  ),
                                                  SizedBox(
                                                    height: 10.kh,
                                                  ),
                                                  Text(
                                                    "Start liking the NFTs",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyleUtil.k12(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            ColorUtil.neutral4),
                                                  )
                                                ],
                                              )
                                            : GridView.builder(
                                                itemCount: controller
                                                    .userFavourite
                                                    .value
                                                    .favourites
                                                    ?.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        crossAxisSpacing: 2.0,
                                                        mainAxisSpacing: 10.0),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return NFTCoverSmall(
                                                    isBuy: true,
                                                    fontstyle: TextStyle(),
                                                    fontstyleSmall: TextStyle(),
                                                    Name:
                                                        "${controller.userFavourite.value.favourites?[index]?.nftId?.title}",
                                                    Description:
                                                        "${controller.userFavourite.value.favourites?[index]?.nftId?.collectionId?.user?.name}",
                                                    imgLink:
                                                        "${controller.userFavourite.value.favourites?[index]?.nftId?.imageURL}",
                                                    OnTap: () {
                                                      Get.toNamed(
                                                          Routes.NFT_DETAILS,
                                                          arguments: [
                                                            controller
                                                                .userFavourite
                                                                .value
                                                                .favourites?[
                                                                    index]!
                                                                .nftId
                                                                ?.Id
                                                                .toString(),
                                                            false
                                                          ]);
                                                    },
                                                  );
                                                },
                                              ),
                                      )),

                                      // Column(
                                      //                           mainAxisAlignment: MainAxisAlignment.start,
                                      //                           crossAxisAlignment: CrossAxisAlignment.start,
                                      //                           children: [
                                      //                             SizedBox(
                                      //                               height: 20.kh,
                                      //                             ),
                                      //                             NFTCoverSmall(
                                      //                               fontstyle: TextStyle(),
                                      //                               fontstyleSmall: TextStyle(),
                                      //                               Name: "Name",
                                      //                               Description: "Description",
                                      //                               imgLink: "imgLink",
                                      //                               OnTap: () {},
                                      //                             ),
                                      //                           ],
                                      //                         ),
                                    ],
                                  ),
                                ],
                                tabs: [
                                  Text('NFT', style: TextStyleUtil.k14()),
                                  Text('Collection',
                                      style: TextStyleUtil.k14()),
                                  Text('Collected', style: TextStyleUtil.k14()),
                                  Text('Favourites',
                                      style: TextStyleUtil.k14()),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //controller.ShowKYC.value == true ? SizedBox() :

              // Positioned(
              //     top: 50.kh,
              //     right: 0,
              //     left: 0,
              //     child: Center(
              //       child: Container(
              //         height: 800.kh,
              //         width: 343.kw,
              //         decoration: BoxDecoration(
              //           color: ColorUtil.k6,
              //           borderRadius: BorderRadius.all(
              //             Radius.circular(8),
              //           ),
              //           boxShadow: [
              //             BoxShadow(
              //               color: ColorUtil.k6,
              //               blurRadius: 0.0,
              //               offset: Offset(
              //                 0.0,
              //                 0.0,
              //               ),
              //             ),
              //           ],
              //           border:
              //           Border.all(color: ColorUtil.neutral6.withOpacity(0.2)),
              //         ),
              //         child: Center(
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               Image(
              //                   height: 90.kw,
              //                   width: 90.kw,
              //                   image: AssetImage("assets/images/KYCpending.png")),
              //               SizedBox(
              //                 height: 40.kh,
              //               ),
              //               Padding(
              //                 padding: EdgeInsets.only(left: 16.0),
              //                 child: Text(
              //                   "KYC Pending",
              //                   style: TextStyleUtil.k20(
              //                       color: ColorUtil.kWhite),
              //                 ),
              //               ),
              //               // Image(
              //               //   height: 90.kw,
              //               //     width: 90.kw,
              //               //     image: AssetImage("assets/images/KYCpending.png")),
              //               SizedBox(
              //                 height: 10.kh,
              //               ),
              //               SizedBox(
              //                 width: 300,
              //                 child: Padding(
              //                   padding: const EdgeInsets.only(left: 16.0),
              //                   child: Text(
              //                     'As a part of our regulatory compliance requirements, we kindly request you to complete your KYC (Know Your Customer) details.',
              //                     style: TextStyleUtil.k20Poppin(
              //                         fontWeight: FontWeight.normal,
              //                         color: ColorUtil.kWhite),
              //                     textAlign: TextAlign.center,
              //                   ),
              //                 ),
              //               ),
              //               // SizedBox(
              //               //   height: 30.kh,
              //               // ),
              //               SizedBox(
              //                 height: 30.kh,
              //               ),
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   Text(""),
              //                   SizedBox(
              //                       height: 48.kh,
              //                       width: 300.kw,
              //                       child: CustomButton(title: "Complete KYC",
              //                         onTap: (){
              //                         Get.toNamed(Routes.KYC,arguments: [true]);
              //                         },
              //
              //                       )),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}

class options extends StatelessWidget {
  const options({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.kh,
      width: 130.kw,
      decoration: BoxDecoration(
          color: ColorUtil.kWhite,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 10.kh,
          ),
          // Divider(
          //   thickness: 2,
          // ),
          SizedBox(
            height: 10.kh,
          ),
          GestureDetector(
            onTap: () {
              Get.to(WalletConnectProfile());
            },
            child: Text(
              "Wallet",
              style: TextStyleUtil.k14(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10.kh,
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(
            height: 10.kh,
          ),
          GestureDetector(
            onTap: () {
              Get.defaultDialog(title: "",
              content: SelectionBox(boxText: "Do you really want to delete your account?", ontap: (){
                Get.find<ProfileController>().deleteUser();
              })
              );

              // Get.to(WalletConnectProfile());

            },
            child: Text(
              "Delete Account",
              style: TextStyleUtil.k14(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10.kh,
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(
            height: 10.kh,
          ),
          GestureDetector(
            onTap: () {
              Get.find<GetStorageService>().logout();
              Get.delete();
              Get.offAllNamed(Routes.LOGIN);
            },
            child: Text(
              "Logout",
              style: TextStyleUtil.k14(color: Colors.redAccent),
            ),
          ),
          SizedBox(
            height: 20.kh,
          ),
        ],
      ),
    );
  }
}
