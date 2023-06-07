import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:salvatara/app/services/CustomButton.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/make_input.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:salvatara/app/widgets/BaseAppBar.dart';

import '../../../services/constants/constantSize.dart';
import '../controllers/create_collection_controller.dart';

class CreateCollectionView extends GetView<CreateCollectionController> {
  const CreateCollectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        leading: true,
        title: Text(
          "Create Collection",
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
                      "Upload Collection Profile photo",
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
                          controller.uploadClassesProfile();
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
                      "Upload Cover photo",
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
                          controller.uploadClassesCover();
                          //controller.uploadClassesFront();
                        },
                        child: controller.imageCoverLink.value == ""
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
                                        File(
                                            "${controller.imageCoverLink.value}"),
                                      ),
                                      fit: BoxFit.cover),
                                )),
                      ),
                    ),
                    SizedBox(
                      height: 4.kh,
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
                    // Text(
                    //   "Royalty Fee",
                    //   style: TextStyleUtil.k14(),
                    // ),
                    // SizedBox(
                    //   height: 4.kh,
                    // ),
                    // _RoyaltyFeeInput(
                    //     TitleController: controller.RoyaltyController.value),
                    SizedBox(
                      height: 16.kh,
                    ),
                    CustomButton(
                      onTap: () async {

                        await controller.CREATECollection();
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
        hintText: "Title of Collection",
        label: "Title of Collection",
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
        hintText: "Add Royalty Fee",
        label: "Add Royalty Fee",
        obscureText: false,
        width: 343.kw,
        passwordField: false),
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
