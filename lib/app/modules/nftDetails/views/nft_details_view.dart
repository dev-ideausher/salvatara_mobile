import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salvatara/app/modules/web3/wallet_connect/wallect_connect_class.dart';
import 'package:salvatara/app/services/CommonSnackBar.dart';
import 'package:salvatara/app/services/CustomButton.dart';
import 'package:salvatara/app/services/Send_notification.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/make_input.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:salvatara/app/widgets/BaseAppBar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../services/TextStyleUtil.dart';
import '../../NFT/controllers/nft_controller.dart';
import '../../Profile/controllers/profile_controller.dart';
import '../controllers/nft_details_controller.dart';

class NftDetailsView extends GetView<NftDetailsController> {
  NftDetailsView({Key? key}) : super(key: key);
  Web3Connect web3connectController = Get.find<Web3Connect>();

  @override
  Widget build(BuildContext context) {
    Get.put(NftDetailsController());
    return Scaffold(
      appBar: BaseAppBar(
        leading: true,
        title: Text(
          "Details",
          style: TextStyleUtil.k24(),
        ),
        appBar: AppBar(
          centerTitle: true,
        ),
        widgets: [],
        ontap: () {
          Get.back();
        },
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Obx(
              () => Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 375.kh,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: NetworkImage(
                              "${controller.NFTdetails.value.data?.imageURL}"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 20.kh,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.NFTdetails.value.data?.title ==
                                          null
                                      ? ""
                                      : "${controller.NFTdetails.value.data?.title}",
                                  style: TextStyleUtil.k24(),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "",
                                      style: TextStyleUtil.k16(
                                          color: ColorUtil.neutral4,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      width: 10.kw,
                                    ),
                                    Text(
                                      "",
                                      style: TextStyleUtil.k16(
                                          color: ColorUtil.accent5),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              height: 40.kh,
                              width: 40.kh,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: ColorUtil.neutral2)),
                              child: Center(
                                child: SizedBox(
                                  child: IconButton(
                                      onPressed: () async {
                                        Share.share(
                                            "${await controller.link.value}");
                                      },
                                      icon: Icon(
                                        Icons.share,
                                        size: 20,
                                        color: ColorUtil.neutral3,
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.kw,
                            ),
                            Container(
                              height: 40.kh,
                              width: 40.kh,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: ColorUtil.neutral2)),
                              child: Center(
                                child: Obx(
                                  () => SizedBox(
                                    child: IconButton(
                                        onPressed: () {
                                          controller.favStatus.value == false
                                              ? controller.getAddToFavourite(
                                                  "${controller.NFTID.value}")
                                              : controller.getRemoveFavourite(
                                                  "${controller.NFTID.value}");
                                        },
                                        icon:
                                            controller.favStatus.value == false
                                                ? Icon(
                                                    Icons.favorite_border,
                                                    size: 22,
                                                    color: ColorUtil.neutral3,
                                                  )
                                                : Icon(
                                                    Icons.favorite,
                                                    size: 22,
                                                    color: Colors.red,
                                                  )),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.kh,
                        ),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Price",
                                  style: TextStyleUtil.k12(
                                    fontWeight: FontWeight.normal,
                                    color: ColorUtil.neutral4,
                                  ),
                                ),
                                Text(
                                  controller.NFTdetails.value.data?.price ==
                                          null
                                      ? ""
                                      : "${controller.NFTdetails.value.data?.price} ${controller.NFTdetails.value.data?.typeOfPayment?.toUpperCase()}",
                                  style: TextStyleUtil.k18(),
                                ),
                                Text(
                                  "",
                                  style: TextStyleUtil.k12(
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            Spacer(),
                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Text(
                            //       "Ends In",
                            //       style: TextStyleUtil.k12(
                            //         fontWeight: FontWeight.normal,
                            //         color: ColorUtil.neutral4,
                            //       ),salvatarapartner@yopmail.com
                            //     ),
                            //     Text(
                            //       "04D 18H",
                            //       style: TextStyleUtil.k18(),
                            //     ),
                            //     Text(
                            //       "4 days, 18 hours",
                            //       style: TextStyleUtil.k12(
                            //           fontWeight: FontWeight.normal),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 20.kh,
                        ),
                        Text(
                          "Description",
                          style: TextStyleUtil.k12(
                            fontWeight: FontWeight.normal,
                            color: ColorUtil.neutral4,
                          ),
                        ),
                        SizedBox(
                          height: 4.kh,
                        ),
                        Text(
                          controller.NFTdetails.value.data?.description == null
                              ? ""
                              : "${controller.NFTdetails.value.data?.description}",
                          style:
                              TextStyleUtil.k16(fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 24.kh,
                        ),
                        NFTDetailsList(
                            Creator: controller.NFTdetails.value.data
                                        ?.collectionId?.user?.firstname ==
                                    null
                                ? "-"
                                : "${controller.NFTdetails.value.data?.collectionId?.user?.firstname}",
                            Owner: controller.NFTdetails.value.data?.owner
                                        ?.firstname ==
                                    null
                                ? "-"
                                : "${controller.NFTdetails.value.data?.owner?.firstname}",
                            Network: controller.NFTdetails.value.data?.typeOfPayment == null
                                ? ""
                                : "${controller.NFTdetails.value.data?.typeOfPayment}",
                            Contract: controller.NFTdetails.value.data
                                        ?.contractAddress ==
                                    null
                                ? ""
                                : "${controller.NFTdetails.value.data?.contractAddress}",
                            TokenID: controller.NFTdetails.value.data?.tokenId == null
                                ? ""
                                : "${controller.NFTdetails.value.data?.tokenId}",
                            RoyaltyFee:
                                controller.NFTdetails.value.data?.royalty == null
                                    ? ""
                                    : "${controller.NFTdetails.value.data?.royalty}",
                            Platform:
                                controller.NFTdetails.value.data?.platFormFee == null
                                    ? ""
                                    : "${controller.NFTdetails.value.data?.platFormFee}"),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 10.kh,
                  // ),
                  // Provenance(),
                  // SizedBox(
                  //   height: 32.kh,
                  // ),
                  // History(),
                  SizedBox(
                    height: 150.kh,
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => Positioned(
              bottom: 0,
              child: (controller.OwnerStatus.value == true &&
                      controller.NFTSell.value == false)
                  ? Container(
                      decoration: BoxDecoration(
                          color: ColorUtil.kWhite,
                          border: Border(
                            top: BorderSide(
                              color: ColorUtil.neutral2,
                              width: 1,
                            ),
                          )),
                      //  color: ColorUtil.kWhite,
                      width: 375.kw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 120.kw,
                            height: 68.kh,
                            child: Center(
                              child: SizedBox(
                                height: 44.kh,
                                width: 300.kw,
                                child: Center(
                                  child: CustomButton(
                                      onTap: () {
                                        Get.snackbar("Message",
                                            "You Cannot Buy this NFT as you are the Owner");
                                        // Get.defaultDialog(
                                        //     title: '',
                                        //     content: Obx(
                                        //           () => Container(
                                        //         height: 230.kh,
                                        //         width: 200.kw,
                                        //         decoration: BoxDecoration(
                                        //             color: ColorUtil
                                        //                 .kWhite),
                                        //         child: Column(
                                        //           children: [
                                        //             Text(
                                        //               "Sell NFT",
                                        //               style: TextStyleUtil
                                        //                   .k24(),
                                        //             ),
                                        //             SizedBox(
                                        //               height:
                                        //               15.kh,
                                        //             ),
                                        //             MakeInput(
                                        //                 controllerID: Get.find<ProfileController>()
                                        //                     .NFTSellingAmountController
                                        //                     .value,
                                        //                 hintText:
                                        //                 "Enter Amount",
                                        //                 label:
                                        //                 "label",
                                        //                 obscureText:
                                        //                 false,
                                        //                 width: 210
                                        //                     .kw,
                                        //                 passwordField:
                                        //                 false),
                                        //             SizedBox(
                                        //               height:
                                        //               10.kh,
                                        //             ),
                                        //             Row(
                                        //               children: [
                                        //                 Text(
                                        //                   "MATIC",
                                        //                   style:
                                        //                   TextStyleUtil.k16(),
                                        //                 ),
                                        //                 Spacer(),
                                        //                 Switch(
                                        //                     value:
                                        //                     Get.find<ProfileController>().IsMatic.value,
                                        //                     onChanged: (value) {
                                        //                       Get.find<ProfileController>().IsMatic.value = value;
                                        //                       print(Get.find<ProfileController>().IsMatic.value);
                                        //                     }),
                                        //               ],
                                        //             ),
                                        //             SizedBox(
                                        //               height:
                                        //               15.kh,
                                        //             ),
                                        //             CustomButton(
                                        //               title:
                                        //               "Sell",
                                        //               onTap:
                                        //                   () async {
                                        //                 var ListingFee =    await  Get.find<Web3Connect>().getListingFee();
                                        //                 await launchUrl(
                                        //                     Uri.parse(Get.find<Web3Connect>()
                                        //                         .connector
                                        //                         .session
                                        //                         .toUri()),
                                        //                     mode:
                                        //                     LaunchMode.externalApplication);
                                        //                 var signature = await Get.find<Web3Connect>().contractCallSellNFT(
                                        //                   amount: double.parse("${Get.find<ProfileController>().NFTSellingAmountController.value.text}"),
                                        //                   tokenID: controller.NFTdetails.value.data?.tokenId,
                                        //                   isMatic: Get.find<ProfileController>().IsMatic.value,
                                        //                   ListingFee: "${ListingFee}",
                                        //                 );
                                        //                 print(signature);
                                        //                 if (signature != "") {
                                        //                   await Get.find<ProfileController>().postListNFT(
                                        //                       nftId: "${controller.NFTdetails.value.data?.Id}",
                                        //                       txnHash: "${signature}",
                                        //                       Price: double.parse(Get.find<ProfileController>().NFTSellingAmountController.value.text.toString()));
                                        //
                                        //                   Get.snackbar(
                                        //                       "Message",
                                        //                       "NFT listed");
                                        //                 }
                                        //               },
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ),
                                        //     ));
                                      },
                                      title: "Owned"),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 120.kw,
                            height: 68.kh,
                            child: Center(
                              child: SizedBox(
                                height: 44.kh,
                                width: 300.kw,
                                child: Center(
                                  child: CustomButton(
                                      onTap: () {
                                        Get.defaultDialog(
                                          title: "",
                                          content: SelectionBox(boxText: "Do you really want to cancel listing", ontap: ()async{
                                            await launchUrl(Uri.parse(Get.find<Web3Connect>().connector.session.toUri()), mode: LaunchMode.externalApplication);

                                            await Get.find<
                                                Web3Connect>()
                                                .CancelListing(
                                                TokenID:
                                                "${controller.NFTdetails.value.data?.tokenId}");
                                          }),


                                          // Container(
                                          //   height: 95.kh,
                                          //   decoration: BoxDecoration(
                                          //       color: ColorUtil.kWhite,
                                          //       borderRadius: BorderRadius.all(
                                          //           Radius.circular(16))),
                                          //   child: Center(
                                          //     child: Column(
                                          //       mainAxisAlignment:
                                          //           MainAxisAlignment.center,
                                          //       crossAxisAlignment:
                                          //           CrossAxisAlignment.center,
                                          //       children: [
                                          //         SizedBox(
                                          //           height: 10.kh,
                                          //         ),
                                          //         Text(
                                          //           "Do you really want to cancel listing?",
                                          //           style: TextStyleUtil.k16(
                                          //               fontWeight:
                                          //                   FontWeight.normal),
                                          //         ),
                                          //         SizedBox(
                                          //           height: 20.kh,
                                          //         ),
                                          //         Divider(
                                          //           height: 2.kh,
                                          //         ),
                                          //         Row(
                                          //           mainAxisAlignment:
                                          //               MainAxisAlignment
                                          //                   .center,
                                          //           children: [
                                          //             SizedBox(
                                          //               width: 100.kw,
                                          //               child: TextButton(
                                          //                   onPressed:
                                          //                       () async {
                                          //                         await launchUrl(Uri.parse(Get.find<Web3Connect>().connector.session.toUri()), mode: LaunchMode.externalApplication);
                                          //
                                          //                         await Get.find<
                                          //                             Web3Connect>()
                                          //                         .CancelListing(
                                          //                             TokenID:
                                          //                                 "${controller.NFTdetails.value.data?.tokenId}");
                                          //                   },
                                          //                   child: Text(
                                          //                     "Yes",
                                          //                     style: TextStyleUtil
                                          //                         .textNimbusSanLStyleS14Wregular(
                                          //                             color: Colors
                                          //                                 .green),
                                          //                   )),
                                          //             ),
                                          //             SizedBox(
                                          //               width: 100.kw,
                                          //               child: TextButton(
                                          //                   onPressed: () {
                                          //                     Get.back();
                                          //                   },
                                          //                   child: Text(
                                          //                     "No",
                                          //                     style: TextStyleUtil
                                          //                         .textNimbusSanLStyleS14Wregular(
                                          //                             color: Colors
                                          //                                 .red),
                                          //                   )),
                                          //             ),
                                          //           ],
                                          //         ),
                                          //       ],
                                          //     ),
                                          //   ),
                                          // ),
                                        );
                                        // Get.snackbar("Message",
                                        //     "You Cannot Buy this NFT as you are the Owner");
                                        //    Get.find<Web3Connect>().CancelListing(TokenID: "${controller.NFTdetails.value.data?.tokenId}");
                                      },
                                      title: "Cancel Listing"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      width: 375.kw,
                      height: 68.kh,
                      decoration: BoxDecoration(
                          color: ColorUtil.kWhite,
                          border: Border(
                            top: BorderSide(
                              color: ColorUtil.neutral2,
                              width: 1,
                            ),
                          )),
                      child: controller.NFTSell.value == true
                          ? Center(
                              child: Container(
                                height: 44.kh,
                                width: 300.kw,
                                child: OutlinedButton(
                                  child: Text('Sell',
                                      style: TextStyleUtil.k16(
                                          color: ColorUtil.k4)),
                                  onPressed: () async {
                                    Get.defaultDialog(
                                        title: '',
                                        content: Obx(
                                          () => Container(
                                            height: 230.kh,
                                            width: 200.kw,
                                            decoration: BoxDecoration(
                                                color: ColorUtil.kWhite),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Sell NFT",
                                                  style: TextStyleUtil.k24(),
                                                ),
                                                SizedBox(
                                                  height: 15.kh,
                                                ),
                                                MakeInput(
                                                  controllerID: Get.find<
                                                          ProfileController>()
                                                      .NFTSellingAmountController
                                                      .value,
                                                  hintText: "Enter Amount",
                                                  label: "label",
                                                  obscureText: false,
                                                  width: 210.kw,
                                                  passwordField: false,
                                                ),
                                                SizedBox(
                                                  height: 10.kh,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "SALVACOIN",
                                                      style:
                                                          TextStyleUtil.k16(),
                                                    ),
                                                    Spacer(),
                                                    Switch(
                                                      value: Get.find<
                                                              ProfileController>()
                                                          .IsMatic
                                                          .value,
                                                      onChanged: (value) {
                                                        Get.find<
                                                                ProfileController>()
                                                            .IsMatic
                                                            .value = value;
                                                        print(Get.find<
                                                                ProfileController>()
                                                            .IsMatic
                                                            .value);
                                                        if (Get.find<
                                                                    ProfileController>()
                                                                .IsMatic
                                                                .value ==
                                                            true) {
                                                          Get.find<
                                                                  ProfileController>()
                                                              .IsMaticString
                                                              .value = "matic";
                                                        } else {
                                                          Get.find<ProfileController>()
                                                                  .IsMaticString
                                                                  .value =
                                                              "salvacoin";
                                                        }
                                                      },
                                                    ),
                                                    Spacer(),
                                                    Text(
                                                      "MATIC",
                                                      style:
                                                          TextStyleUtil.k16(),
                                                    ),
                                                    SizedBox(
                                                      width: 2.kw,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 15.kh,
                                                ),
                                                CustomButton(
                                                  title: "Sell",
                                                  onTap: () async {
                                                    if (Get.find<ProfileController>()
                                                                .NFTSellingAmountController
                                                                .value
                                                                .text ==
                                                            '' ||
                                                        Get.find<
                                                                ProfileController>()
                                                            .NFTSellingAmountController
                                                            .value
                                                            .text
                                                            .isEmpty) {
                                                      snackBarClass(
                                                              "Please enter the amount.")
                                                          .WarningSnackBar;
                                                    } else {
                                                      var ListingFee =
                                                          await Get.find<
                                                                  Web3Connect>()
                                                              .getListingFee();

                                                      await launchUrl(
                                                          Uri.parse(Get.find<
                                                                  Web3Connect>()
                                                              .connector
                                                              .session
                                                              .toUri()),
                                                          mode: LaunchMode
                                                              .externalApplication);

                                                      var signature = await Get
                                                              .find<
                                                                  Web3Connect>()
                                                          .contractCallSellNFT(
                                                        amount: double.parse(
                                                            "${Get.find<ProfileController>().NFTSellingAmountController.value.text}"),
                                                        tokenID: controller
                                                            .NFTdetails
                                                            .value
                                                            .data
                                                            ?.tokenId,
                                                        isMatic: Get.find<
                                                                ProfileController>()
                                                            .IsMatic
                                                            .value,
                                                        ListingFee:
                                                            "${ListingFee}",
                                                      );

                                                      print(signature);
                                                      if (signature != "") {
                                                        await Get.find<ProfileController>().postListNFT(
                                                            nftId:
                                                                "${controller.NFTdetails.value.data?.Id}",
                                                            txnHash:
                                                                "${signature}",
                                                            Price: double.parse(Get
                                                                    .find<
                                                                        ProfileController>()
                                                                .NFTSellingAmountController
                                                                .value
                                                                .text
                                                                .toString()));

                                                        await Get.find<
                                                                ProfileController>()
                                                            .getCollectedNFTDetails();

                                                        Get.back();

                                                        Get.snackbar("Message",
                                                            "NFT listed");
                                                      }
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ));
                                    // var ListingFee =
                                    //     await Get.find<Web3Connect>().getListingFee();
                                    //
                                    // await launchUrl(
                                    //     Uri.parse(Get.find<Web3Connect>()
                                    //         .connector
                                    //         .session
                                    //         .toUri()),
                                    //     mode: LaunchMode.externalApplication);
                                    // var signature = await Get.find<Web3Connect>()
                                    //     .contractCallSellNFT(
                                    //         amount: 1,
                                    //         tokenID: controller
                                    //             .NFTdetails.value.data?.tokenId,
                                    //         isMatic: true,
                                    //         ListingFee: "${ListingFee}");
                                    // print(signature);
                                    // if (signature != "") {
                                    //   Get.snackbar("Message", "NFT listed");
                                    // }
                                  },
                                ),
                              ),
                            )
                          : Center(
                              child: SizedBox(
                                  height: 44.kh,
                                  width: 300.kw,
                                  child: CustomButton(
                                    title: "Buy Now",
                                    borderRadius: 4,
                                    onTap: () async {
                                      if (web3connectController
                                              .sessionStatus.value ==
                                          false) {
                                        snackBarClass(
                                                "Go to settings and connect to the Metamask Wallet to do transactions.")
                                            .WarningSnackBar;
                                      } else {
                                        //Check Matic or Salva
                                        var isMatic = await Get.find<
                                                Web3Connect>()
                                            .getNFTDetails(
                                                TokenID:
                                                    "${controller.NFTdetails.value.data?.tokenId}");
                                        if (isMatic == true) {
                                          Get.defaultDialog(
                                              title: "",
                                              content: Container(
                                                height: 300.kh,
                                                width: 300.kw,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Transaction Initiated",
                                                      style:
                                                          TextStyleUtil.k20(),
                                                    ),
                                                    SizedBox(
                                                      height: 10.kh,
                                                    ),
                                                    SvgPicture.asset(
                                                        "assets/SVG/Metamask.svg"),
                                                    SizedBox(
                                                      height: 5.kh,
                                                    ),
                                                    Text(
                                                      "Transaction has been initiated on your Metamask wallet and requires your immediate attention.\n",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            ColorUtil.neutral6,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 16.kh,
                                                        //  decoration: textDecoration,
                                                        letterSpacing: 0,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 5.kh,
                                                    ),
                                                    Text(
                                                      "Please open your Metamask wallet and approve transaction to buy the NFT.",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            ColorUtil.neutral6,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 16.kh,
                                                        //  decoration: textDecoration,
                                                        letterSpacing: 0,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 20.kh,
                                                    ),
                                                    SizedBox(
                                                      height: 48.kw,
                                                      width: 200.kh,
                                                      child: CustomButton(
                                                          onTap: () async {
                                                            var isMatic = await Get
                                                                    .find<
                                                                        Web3Connect>()
                                                                .getNFTDetails(
                                                                    TokenID:
                                                                        "${controller.NFTdetails.value.data?.tokenId}");
                                                            if (isMatic ==
                                                                true) {
                                                              var sig1s = await Get
                                                                      .find<
                                                                          Web3Connect>()
                                                                  .contractCallBuyNFT(
                                                                      amount: controller
                                                                          .NFTdetails
                                                                          .value
                                                                          .data
                                                                          ?.price,
                                                                      tokenID: controller
                                                                          .NFTdetails
                                                                          .value
                                                                          .data
                                                                          ?.tokenId);
                                                              if (sig1s == '') {
                                                              } else {
                                                                if (sig1s
                                                                    .toString()
                                                                    .contains(
                                                                        "0x")) {
                                                                  await controller.postBuyNFT(
                                                                      nft:
                                                                          "${controller.NFTdetails.value.data?.Id}",
                                                                      buyer:
                                                                          "${Get.find<ProfileController>().userdetials.value.data?.Id}",
                                                                      hash:
                                                                          "${sig1s}",
                                                                      tokenId:
                                                                          "${controller.NFTdetails.value.data?.tokenId}");

                                                                  await Get.find<
                                                                          NftController>()
                                                                      .getTreadingNFTList();
                                                                  await Get.find<
                                                                          NftController>()
                                                                      .getNFTList();

                                                                  Get.back();
                                                                } else {
                                                                  //  Get.snackbar("Message", "Try Again");
                                                                }
                                                              }
                                                            } else {
                                                              var signature = await Get
                                                                      .find<
                                                                          Web3Connect>()
                                                                  .contractSalvaCoin(
                                                                      amount: controller
                                                                          .NFTdetails
                                                                          .value
                                                                          .data
                                                                          ?.price);

                                                              if (signature ==
                                                                  "") {
                                                              } else {
                                                                var sig2 = await Get
                                                                        .find<
                                                                            Web3Connect>()
                                                                    .contractCallBuyNFTSalva(
                                                                        // amount: controller
                                                                        //     .NFTdetails.value.data?.price,
                                                                        tokenID: controller
                                                                            .NFTdetails
                                                                            .value
                                                                            .data
                                                                            ?.tokenId);

                                                                if (sig2 ==
                                                                    '') {
                                                                } else {
                                                                  await controller.postBuyNFT(
                                                                      nft:
                                                                          "${controller.NFTdetails.value.data?.Id}",
                                                                      buyer:
                                                                          "${Get.find<ProfileController>().userdetials.value.data?.Id}",
                                                                      hash:
                                                                          "${sig2}",
                                                                      tokenId:
                                                                          "${controller.NFTdetails.value.data?.tokenId}");
                                                                  await Get.find<
                                                                          NftController>()
                                                                      .getTreadingNFTList();
                                                                  await Get.find<
                                                                          NftController>()
                                                                      .getNFTList();
                                                                  SendNotification.sendTopicNotification(title: "Congratulations!", message: "Your NFT, ${controller.NFTdetails.value.data?.title?.toLowerCase()} is sold to ${Get.find<ProfileController>().userdetials.value.data?.firstname}", topic: "${controller.NFTdetails.value.data?.owner?.Id}");

                                                                  Get.back();
                                                                  // Get.snackbar(
                                                                  //     "Message",
                                                                  //     "NFT Buyed");
                                                                }
                                                              }
                                                            }
                                                          },
                                                          title:
                                                              "Resend transaction request"),
                                                    )
                                                  ],
                                                ),
                                              ));
                                          var sig1s =
                                              await Get.find<Web3Connect>()
                                                  .contractCallBuyNFT(
                                                      amount:
                                                          controller
                                                              .NFTdetails
                                                              .value
                                                              .data
                                                              ?.price,
                                                      tokenID: controller
                                                          .NFTdetails
                                                          .value
                                                          .data
                                                          ?.tokenId);
                                          if (sig1s == '') {
                                          } else {
                                            if (sig1s
                                                .toString()
                                                .contains("0x")) {
                                              await controller.postBuyNFT(
                                                  nft:
                                                      "${controller.NFTdetails.value.data?.Id}",
                                                  buyer:
                                                      "${Get.find<ProfileController>().userdetials.value.data?.Id}",
                                                  hash: "${sig1s}",
                                                  tokenId:
                                                      "${controller.NFTdetails.value.data?.tokenId}");
                                              await Get.find<NftController>()
                                                  .getTreadingNFTList();
                                              await Get.find<NftController>()
                                                  .getNFTList();
                                              SendNotification.sendTopicNotification(title: "Congratulations!", message: "Your NFT, ${controller.NFTdetails.value.data?.title?.toLowerCase()} is sold to ${Get.find<ProfileController>().userdetials.value.data?.firstname}", topic: "${controller.NFTdetails.value.data?.owner?.Id}");

                                              Get.back();
                                            } else {
                                              //  Get.snackbar("Message", "Try Again");
                                            }
                                          }
                                        } else {
                                          Get.defaultDialog(
                                              title: "",
                                              content: Container(
                                                height: 300.kh,
                                                width: 300.kw,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Transation Initiated",
                                                      style:
                                                          TextStyleUtil.k20(),
                                                    ),
                                                    SizedBox(
                                                      height: 10.kh,
                                                    ),
                                                    SvgPicture.asset(
                                                        "assets/SVG/Metamask.svg"),
                                                    SizedBox(
                                                      height: 5.kh,
                                                    ),
                                                    Text(
                                                      "Transaction has been initiated on your Metamask wallet and requires your immediate attention.\n",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            ColorUtil.neutral6,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 16.kh,
                                                        //  decoration: textDecoration,
                                                        letterSpacing: 0,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 5.kh,
                                                    ),
                                                    Text(
                                                      "Follow these steps to complete the transaction",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            ColorUtil.neutral6,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 16.kh,
                                                        //  decoration: textDecoration,
                                                        letterSpacing: 0,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 5.kh,
                                                    ),
                                                    Text(
                                                      "Step1 -> Open MetaMask And click on approve to approve the MTK",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            ColorUtil.neutral6,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 14.kh,
                                                        //  decoration: textDecoration,
                                                        letterSpacing: 0,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 5.kh,
                                                    ),
                                                    Text(
                                                      "Step2 -> Open Metamask Wallet again and click on approve transaction",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            ColorUtil.neutral6,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 14.kh,
                                                        //  decoration: textDecoration,
                                                        letterSpacing: 0,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ));
                                          var signature =
                                              await Get.find<Web3Connect>()
                                                  .contractSalvaCoin(
                                                      amount: controller
                                                          .NFTdetails
                                                          .value
                                                          .data
                                                          ?.price);

                                          if (signature == "") {
                                          } else {
                                            // await launchUrl(
                                            //     Uri.parse(Get.find<Web3Connect>()
                                            //         .connector
                                            //         .session
                                            //         .toUri()),
                                            //    mode: LaunchMode.externalApplication);
                                            var sig2 =
                                                await Get.find<Web3Connect>()
                                                    .contractCallBuyNFTSalva(
                                                        tokenID: controller
                                                            .NFTdetails
                                                            .value
                                                            .data
                                                            ?.tokenId);

                                            if (sig2 == '') {
                                            } else {
                                              await controller.postBuyNFT(
                                                  nft:
                                                      "${controller.NFTdetails.value.data?.Id}",
                                                  buyer:
                                                      "${Get.find<ProfileController>().userdetials.value.data?.Id}",
                                                  hash: "${sig2}",
                                                  tokenId:
                                                      "${controller.NFTdetails.value.data?.tokenId}");


                                              await Get.find<NftController>()
                                                  .getTreadingNFTList();
                                              await Get.find<NftController>()
                                                  .getNFTList();
                                              SendNotification.sendTopicNotification(title: "Congratulations!", message: "Your NFT, ${controller.NFTdetails.value.data?.title?.toLowerCase()} is sold to ${Get.find<ProfileController>().userdetials.value.data?.firstname}", topic: "${controller.NFTdetails.value.data?.owner?.Id}");

                                              Get.back();

                                              Get.snackbar("Message", "NFT Buyed");
                                            }
                                          }
                                        }
                                      }
                                    },
                                  )),
                            ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class NFTDetailsList extends StatelessWidget {
  final String Creator;
  final String Owner;
  final String Network;
  final String Contract;
  final String TokenID;
  final String RoyaltyFee;
  final String Platform;

  NFTDetailsList(
      {Key? key,
      required this.Creator,
      required this.Owner,
      required this.Network,
      required this.Contract,
      required this.TokenID,
      required this.RoyaltyFee,
      required this.Platform})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Creator",
              style: TextStyleUtil.k14(
                  fontWeight: FontWeight.normal, color: ColorUtil.neutral4),
            ),
            Spacer(),
            Text(
              "${Creator}",
              style: TextStyleUtil.k14(),
            ),
          ],
        ),
        // Owner == ""
        //     ? SizedBox()
        //     :
        SizedBox(
          height: 16.kh,
        ),
        // Owner == ""
        //     ? SizedBox()
        //     :
        Row(
          children: [
            Text(
              "Owner",
              style: TextStyleUtil.k14(
                  fontWeight: FontWeight.normal, color: ColorUtil.neutral4),
            ),
            Spacer(),
            Text(
              "${Owner}",
              style: TextStyleUtil.k14(),
            ),
          ],
        ),
        SizedBox(
          height: 16.kh,
        ),
        Row(
          children: [
            Text(
              "Network",
              style: TextStyleUtil.k14(
                  fontWeight: FontWeight.normal, color: ColorUtil.neutral4),
            ),
            Spacer(),
            Network == ""
                ? Text(
                    "Matic",
                    style: TextStyleUtil.k14(),
                  )
                : Text(
                    "${Network}",
                    style: TextStyleUtil.k14(),
                  ),
          ],
        ),
        SizedBox(
          height: 16.kh,
        ),
        Row(
          children: [
            Text(
              "Contract Address",
              style: TextStyleUtil.k14(
                  fontWeight: FontWeight.normal, color: ColorUtil.neutral4),
            ),
            Spacer(),
            SizedBox(
              width: 100.kw,
              child: Text(
                "${Contract}",
                style: TextStyleUtil.k14(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16.kh,
        ),
        Row(
          children: [
            Text(
              "Token ID",
              style: TextStyleUtil.k14(
                  fontWeight: FontWeight.normal, color: ColorUtil.neutral4),
            ),
            Spacer(),
            Text(
              "${TokenID}",
              style: TextStyleUtil.k14(),
            ),
          ],
        ),
        SizedBox(
          height: 16.kh,
        ),
        Row(
          children: [
            Text(
              "Royalty Fee",
              style: TextStyleUtil.k14(
                  fontWeight: FontWeight.normal, color: ColorUtil.neutral4),
            ),
            Spacer(),
            Text(
              "${RoyaltyFee}",
              style: TextStyleUtil.k14(),
            ),
          ],
        ),
        SizedBox(
          height: 16.kh,
        ),
        Row(
          children: [
            Text(
              "Platform Fee",
              style: TextStyleUtil.k14(
                  fontWeight: FontWeight.normal, color: ColorUtil.neutral4),
            ),
            Spacer(),
            Text(
              "${Platform}",
              style: TextStyleUtil.k14(),
            ),
          ],
        ),
        SizedBox(
          height: 16.kh,
        ),
      ],
    );
  }
}

class Provenance extends StatelessWidget {
  const Provenance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24.kh,
          ),
          Text(
            "Provenance",
            style: TextStyleUtil.k12(
              fontWeight: FontWeight.normal,
              color: ColorUtil.neutral4,
            ),
          ),
          SizedBox(
            height: 24.kh,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: TextStyleUtil.k14(
                  fontWeight: FontWeight.normal,
                  color: ColorUtil.neutral4,
                ),
              ),
              SizedBox(
                width: 55.kw,
              ),
              Text(
                "Action",
                style: TextStyleUtil.k14(
                  fontWeight: FontWeight.normal,
                  color: ColorUtil.neutral4,
                ),
              ),
              SizedBox(
                width: 31.kw,
              ),
              Text(
                "Trade Price",
                style: TextStyleUtil.k14(
                  fontWeight: FontWeight.normal,
                  color: ColorUtil.neutral4,
                ),
              ),
              SizedBox(
                width: 30.kw,
              ),
              Text(
                "Time",
                style: TextStyleUtil.k14(
                  fontWeight: FontWeight.normal,
                  color: ColorUtil.neutral4,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.kh,
          ),
          Divider(
            height: 1,
            thickness: 2,
          ),
          SizedBox(
            height: 17.kh,
          ),
          Row(
            children: [
              Text(
                "ARTUHR...",
                style: TextStyleUtil.k14(
                    color: ColorUtil.accent4, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 23.kw,
              ),
              Text(
                "mint",
                style: TextStyleUtil.k12(fontWeight: FontWeight.normal),
              )
            ],
          ),
          SizedBox(
            height: 17.kh,
          ),
          Divider(
            height: 1,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24.kh,
          ),
          Text(
            "History",
            style: TextStyleUtil.k12(
              fontWeight: FontWeight.normal,
              color: ColorUtil.neutral4,
            ),
          ),
          SizedBox(
            height: 24.kh,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "From",
                style: TextStyleUtil.k14(
                  fontWeight: FontWeight.normal,
                  color: ColorUtil.neutral4,
                ),
              ),
              SizedBox(
                width: 94.kw,
              ),
              Text(
                "Time",
                style: TextStyleUtil.k14(
                  fontWeight: FontWeight.normal,
                  color: ColorUtil.neutral4,
                ),
              ),
              SizedBox(
                width: 94.kw,
              ),
              Text(
                "Bidding Price",
                style: TextStyleUtil.k14(
                  fontWeight: FontWeight.normal,
                  color: ColorUtil.neutral4,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.kh,
          ),
          Divider(
            height: 1,
            thickness: 2,
          ),
          SizedBox(
            height: 17.kh,
          ),
          Row(
            children: [
              Text(
                "Platform Fee",
                style: TextStyleUtil.k12(fontWeight: FontWeight.normal),
              ),
              SizedBox(
                width: 64.kw,
              ),
              Text(
                "mint",
                style: TextStyleUtil.k12(fontWeight: FontWeight.normal),
              )
            ],
          ),
          SizedBox(
            height: 17.kh,
          ),
          Divider(
            height: 1,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}



class SelectionBox extends StatelessWidget {
  final String boxText;
  final ontap;
   SelectionBox({Key? key, required this.boxText,required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.kh,
      decoration: BoxDecoration(
          color: ColorUtil.kWhite,
          borderRadius: BorderRadius.all(
              Radius.circular(16))),
      child: Center(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.kh,
            ),
            Text(
              "${boxText}",
              style: TextStyleUtil.k16(
                  fontWeight:
                  FontWeight.normal),
            ),
            SizedBox(
              height: 20.kh,
            ),
            Divider(
              height: 2.kh,
            ),
            Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .center,
              children: [
                SizedBox(
                  width: 100.kw,
                  child: TextButton(
                      onPressed:ontap,
                      //     () async {
                      //   await launchUrl(Uri.parse(Get.find<Web3Connect>().connector.session.toUri()), mode: LaunchMode.externalApplication);
                      //
                      //   await Get.find<
                      //       Web3Connect>()
                      //       .CancelListing(
                      //       TokenID:
                      //       "${controller.NFTdetails.value.data?.tokenId}");
                      // },
                      child: Text(
                        "Yes",
                        style: TextStyleUtil
                            .textNimbusSanLStyleS14Wregular(
                            color: Colors
                                .green),
                      )),
                ),
                SizedBox(
                  width: 100.kw,
                  child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "No",
                        style: TextStyleUtil
                            .textNimbusSanLStyleS14Wregular(
                            color: Colors
                                .red),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

