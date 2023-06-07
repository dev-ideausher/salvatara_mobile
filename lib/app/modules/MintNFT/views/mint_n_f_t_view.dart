import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:salvatara/app/modules/NFT/views/nft_view.dart';
import 'package:salvatara/app/modules/Profile/controllers/profile_controller.dart';
import 'package:salvatara/app/modules/web3/wallet_connect/wallect_connect_class.dart';
import 'package:salvatara/app/services/CommonSnackBar.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/make_input.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../services/CustomButton.dart';
import '../../../services/TextStyleUtil.dart';
import '../../../services/constants/constantSize.dart';
import '../../../widgets/BaseAppBar.dart';
import '../controllers/mint_n_f_t_controller.dart';

class MintNFTView extends GetView<MintNFTController> {
  MintNFTView({Key? key}) : super(key: key);
  ProfileController controllerProfile = Get.find<ProfileController>();
  Web3Connect web3connectController = Get.find<Web3Connect>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        leading: true,
        title: Text(
          "Mint NFT",
          style: TextStyleUtil.k24(),
        ),
        appBar: AppBar(
          centerTitle: true,
        ),
        widgets: const [

        ],
        ontap: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _TitleInput(
                        TitleController: controller.TitleController.value),
                    SizedBox(
                      height: 24.kh,
                    ),
                    Text(
                      "Upload product photos",
                      style: TextStyleUtil.k14(),
                    ),
                    SizedBox(
                      height: 4.kh,
                    ),
                    Text(
                      "Accepted formats - Image: JPG, PNG, SVG,\nGIF; Video: MP4, WEBM; Audio: MP3, WAV",
                      style: TextStyleUtil.k16(
                        fontWeight: FontWeight.normal,
                        color: ColorUtil.neutral4,
                      ),
                    ),
                    SizedBox(
                      height: 8.kh,
                    ),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.uploadClassesFront();
                        },
                        child: controller.imageLink.value == ""
                            ? Image(
                                image: AssetImage("assets/images/upload.png"),
                              )
                            : Container(
                                height: 164.kh,
                                width: 343.kw,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  image: DecorationImage(
                                      image: FileImage(
                                        File("${controller.imageLink.value}"),
                                      ),
                                      fit: BoxFit.cover),
                                )),
                      ),
                    ),
                    SizedBox(
                      height: 24.kh,
                    ),
                    Text(
                      "Collection",
                      style: TextStyleUtil.k14(),
                    ),
                    SizedBox(
                      height: 4.kh,
                    ),
                    Row(
                      children: [
                        controllerProfile.UserCollection.value.users?.length ==
                                    null ||
                                controllerProfile
                                        .UserCollection.value.users?.length ==
                                    0
                            ? Image(
                                height: 172.kh,
                                width: 164.kw,
                                image: AssetImage("assets/images/ERC.png"))
                            : SizedBox(
                                height: 172.kh,
                                width: 343.kw,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controllerProfile.UserCollection
                                              .value.users?.length ==
                                          null
                                      ? 0
                                      : controllerProfile
                                          .UserCollection.value.users?.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Stack(
                                        children: [
                                          Obx(
                                            () => GestureDetector(
                                              onTap: () {
                                                controller.SelectedCollectionID
                                                        .value =
                                                    "${controllerProfile.UserCollection.value.users?[index]?.Id}";
                                                print(
                                                    "${controller.SelectedCollectionID.value}");
                                              },
                                              child: CollectionCoverSmall(
                                                Name:
                                                    "${controllerProfile.UserCollection.value.users?[index]?.title}",
                                                Volume: "Volume",
                                                FloorPrice: "FloorPrice",
                                                Profile:
                                                    "${controllerProfile.UserCollection.value.users?[index]?.profile}",
                                                CoverImage:
                                                    "${controllerProfile.UserCollection.value.users?[index]?.cover}",
                                                OverLay: controller
                                                            .SelectedCollectionID
                                                            .value ==
                                                        controllerProfile
                                                            .UserCollection
                                                            .value
                                                            .users?[index]
                                                            ?.Id
                                                    ? true
                                                    : false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                      ],
                    ),

                    SizedBox(
                      height: 24.kh,
                    ),
                    _DiscriptionInput(
                        TitleController:
                            controller.DescriptionController.value),
                    SizedBox(
                      height: 24.kh,
                    ),
                    Text(
                      "External link",
                      style: TextStyleUtil.k14(),
                    ),
                    SizedBox(
                      height: 4.kh,
                    ),
                    Text(
                      "We will include a link to this URL on this item's detail page, so that users can click to learn more about it. You are welcome to link to your own webpage with more details.",
                      style: TextStyleUtil.k16(
                        fontWeight: FontWeight.normal,
                        color: ColorUtil.neutral4,
                      ),
                    ),
                    SizedBox(
                      height: 4.kh,
                    ),
                    _ExternalInput(
                        TitleController:
                            controller.ExternalLinkController.value),
                    SizedBox(
                      height: 10.kh,
                    ),

                    Text(
                      "Royalty Fee",
                      style: TextStyleUtil.k14(),
                    ),
                    SizedBox(
                      height: 4.kh,
                    ),
                    _RoyaltyFeeInput(
                        TitleController: controller.RoyaltyController.value),
                    SizedBox(
                      height: 16.kh,
                    ),

                    // Row(
                    //   children: [
                    //     Text("Currency Matic",style: TextStyleUtil.k16(),),
                    //     Spacer(),
                    //     SwitcherButton(
                    //       value: false,
                    //       onChange: (value) {
                    //         print(value);
                    //
                    //       },
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 24.kh,
                    ),
                    CustomButton(
                      onTap: () async {

                        if(web3connectController.sessionStatus.value == false){
                          snackBarClass("Go to settings and connect to the Metamask Wallet to do transactions.").WarningSnackBar;

                        }else{
                          if (controller.TitleController.value.text == '' ||
                              controller.RoyaltyController.value.text == '' ||
                              controller.imageLink.value == '' ||
                              controller.SelectedCollectionID.value == '' ||
                              controller.DescriptionController.value.text == ''){
                            Get.snackbar(
                                "Message", "Please enter the required fields");
                          } else {
                            // await controller.createNFT(txnHash: "{signature}");
                            await controller.postReqUpload();
                            await controller.updateUserPersonalDetails();
                            await launchUrl(
                                Uri.parse(Get.find<Web3Connect>()
                                    .connector
                                    .session
                                    .toUri()),
                                mode: LaunchMode.externalApplication);
                            // await launchUrl(
                            //     Uri.parse(Get.find<Web3Connect>().connector.session.toUri()),
                            //     mode: LaunchMode.externalApplication);
                            var signature = await Get.find<Web3Connect>()
                                .contractCallMintFT(
                                tokenURI: "${controller.tokenURI.value}",
                                royalityPercentage: 2);
                            //Get.back();
                            print(signature);
                            if (signature != "") {}
                          }
                        }



                        //   Get.find<Web3Connect>().getRecipt(transactionAddress: "");
                      },
                      title: "Create",
                      borderRadius: Size_4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _TitleInput({required TextEditingController TitleController}) {
  return Center(
    child: MakeInput(
        controllerID: TitleController,
        hintText: "Title of product",
        label: "Title of product",
        obscureText: false,
        width: 343.kw,
        passwordField: false),
  );
}

Widget _ExternalInput({required TextEditingController TitleController}) {
  return Center(
    child: MakeInput(
        controllerID: TitleController,
        hintText: "External Link",
        label: "External Link",
        obscureText: false,
        width: 343.kw,
        passwordField: false),
  );
}

Widget _RoyaltyFeeInput({required TextEditingController TitleController}) {
  return Center(
    child: MakeInput(
        controllerID: TitleController,
        hintText: "Add royalty Fee from 0 to 10",
        label: "Add Royalty Fee from 0 to 10",
        obscureText: false,
        width: 343.kw,
        passwordField: false,
      KeyBoardtype: TextInputType.number,
      onChanged: (value){
          if(int.parse(value) < int.parse("0") || int.parse(value) > int.parse("10")){
            snackBarClass("Number out of range").ErrorSnackBar;
            TitleController.clear();

          }
      },
    ),
  );
}

Widget _DiscriptionInput({required TextEditingController TitleController}) {
  return Center(
      child: SizedBox(
    child: Center(
      child: TextField(
        controller: TitleController,
        minLines: 3,
        maxLines: 7,
        keyboardType: TextInputType.multiline,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          fillColor: ColorUtil.neutral2,
          hintText: "Description of Product",
          hintStyle: TextStyleUtil.k16(
              fontWeight: FontWeight.normal, color: ColorUtil.neutral4),
          contentPadding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffEAE7FF),
            ),
            borderRadius: BorderRadius.circular(Size_8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffEAE7FF),
            ),
            borderRadius: BorderRadius.circular(Size_8),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorUtil.k6,
            ),
            borderRadius: BorderRadius.circular(Size_8),
          ),
        ),

        // TextFormField(
        //   keyboardType: TextInputType.multiline,
        //   // minLines: 3,
        //   // maxLines: 6,
        //   onChanged: (onChanged){},
        //   onTap: (){},
        //   enabled: true,
        //   controller: TitleController,
        //   obscureText: true,
        //   style: TextStyle(color: Colors.black),
        //   decoration: InputDecoration(
        //     fillColor: ColorUtil.neutral1,
        //     filled: true,
        //     hintText: "Description of Product",
        //     hintStyle: TextStyleUtil.k16(
        //         fontWeight: FontWeight.normal,
        //         color: ColorUtil.neutral4
        //     ),
        //     contentPadding: EdgeInsets.symmetric(
        //       vertical: 0.0,
        //       horizontal: 20.0,
        //     ),
        //     disabledBorder: OutlineInputBorder(
        //       borderSide: BorderSide(
        //         color: Color(0xffEAE7FF),
        //       ),
        //       borderRadius: BorderRadius.circular(Size_8),
        //     ),
        //     enabledBorder: OutlineInputBorder(
        //       borderSide: BorderSide(
        //         color: Color(0xffEAE7FF),
        //       ),
        //       borderRadius: BorderRadius.circular(Size_8),
        //     ),
        //     border: OutlineInputBorder(
        //       borderSide: BorderSide(
        //         color: Colors.grey,
        //       ),
        //     ),
        //     focusedBorder: OutlineInputBorder(
        //       borderSide: BorderSide(
        //         color: ColorUtil.k6,
        //       ),
        //       borderRadius: BorderRadius.circular(Size_8),
        //     ),
        //   ),
        //
        // ),
      ),
    ),
  ));
}

