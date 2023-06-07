import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:salvatara/app/routes/app_pages.dart';
import 'package:salvatara/app/services/CustomButton.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/constants/constantSize.dart';
import 'package:salvatara/app/services/constants/constantText.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:salvatara/app/widgets/BaseAppBar.dart';
import 'package:salvatara/app/widgets/upload_document.dart';

import '../controllers/identity_proof_controller.dart';

class IdentityProofView extends GetView<IdentityProofController> {
  const IdentityProofView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  "STEP 2/3",
                  style: TextStyleUtil.k14(color: ColorUtil.accent5),
                )),
              ),
            ),
          ],
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
              "From front",
              style: TextStyleUtil.k14(),
            ),
            SizedBox(
              height: Size_4,
            ),
            Obx(
              () => UploadDocButton(
                text: "text",
                ontap: () async {
                  await controller.uploadClassesFront();
                },
                url: "${controller.FrontimageLink.value}",
              ),
            ),
            SizedBox(
              height: Size_16,
            ),
            Text(
              "From back",
              style: TextStyleUtil.k14(),
            ),
            SizedBox(
              height: Size_4,
            ),
            Obx(
              () => UploadDocButton(
                text: "text",
                ontap: () async {
                  await controller.uploadClasseBack();
                },
                url: "${controller.BackimageLink.value}",
              ),
            ),
            SizedBox(
              height: Size_20,
            ),
            CustomButton(
              title: "Submit",
              borderRadius: Size_4,
              onTap: () async{
                print("go");
             await controller.SubmitDocuments();

                Get.toNamed(Routes.KYC);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _CLICKASELFIEText() {
  return Text(
    ConstantText.ENTER_DOCUMENT,
    style: TextStyleUtil.k24(
      color: ColorUtil.neutral6,
    ),
  );
}
