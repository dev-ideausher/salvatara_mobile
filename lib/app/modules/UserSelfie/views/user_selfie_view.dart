import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:salvatara/app/modules/IdentityProof/controllers/identity_proof_controller.dart';
import 'package:salvatara/app/services/CustomButton.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/constants/constantText.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:salvatara/app/widgets/BaseAppBar.dart';

import '../../../services/TextStyleUtil.dart';
import '../../../services/constants/constantSize.dart';
import '../controllers/user_selfie_controller.dart';

class UserSelfieView extends GetView<UserSelfieController> {
  const UserSelfieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(UserSelfieController());
    return Scaffold(
      backgroundColor: ColorUtil.kWhite,
      appBar: BaseAppBar(
          leading: true,
          title: Text(""),
          appBar: AppBar(),
          widgets: [
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 16, top: 8, bottom: 8),
              child: Container(
                width: 85.kw,
                height: 20.kh,
                decoration: BoxDecoration(
                    color: ColorUtil.accent1,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Center(
                    child: Text(
                  "STEP 3/3",
                  style: TextStyleUtil.k14(color: ColorUtil.accent5),
                )),
              ),
            ),
          ],
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Obx(() =>
       Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Size_16,
              ),
              _CLICKASELFIEText(),
              SizedBox(
                height: Size_16,
              ),
              Text(
                "Point your face right at the box, then take a photo",
                style: TextStyleUtil.k16(
                    color: ColorUtil.neutral6, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: Size_16,
              ),
              // Container(
              //   height: 375.kh,
              //   width: double.infinity,
              //   color: Colors.grey.shade100,
              //
              // ),
             controller.picPath.value == '' ? SizedBox(
                  height: 500.kh,
                  width: 343.kw,
                  child: Obx(() => controller.loader.value == true
                      ? Text("data")
                      : CameraPreview(controller.camController.value!))) : SizedBox(
                 height: 500.kh,
                 width: 343.kw,
                 child:Image(image: FileImage(File("${controller.picPath.value}")),)) ,

              SizedBox(
                height: Size_16,
              ),
              controller.picPath.value == "" ?Center(
                child: GestureDetector(
                  onTap: () async{
                  await  controller.takePicture();
                  },
                  child: SizedBox(
                    height: 80.kh,
                    width: 80.kh,
                    child: CircleAvatar(
                      backgroundColor: ColorUtil.k4,
                      child: Center(
                        child: Icon(Icons.check),
                      ),
                    ),
                  ),
                ),
              ): CustomButton(title: "Upload",
              onTap: (){
                Get.put(IdentityProofController());
                controller.uploadImage();
              },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _CLICKASELFIEText() {
  return Text(
    ConstantText.CLICK_A_SELFIE,
    style: TextStyleUtil.k24(
      color: ColorUtil.neutral6,
    ),
  );
}
