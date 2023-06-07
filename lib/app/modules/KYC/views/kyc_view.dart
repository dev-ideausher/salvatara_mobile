import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/constants/constantText.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:salvatara/app/widgets/BaseAppBar.dart';
import '../../../routes/app_pages.dart';
import '../../../services/CustomButton.dart';
import '../../../services/TextStyleUtil.dart';
import '../../../services/constants/constantSize.dart';
import '../../../services/make_input.dart';
import '../controllers/kyc_controller.dart';

class KycView extends GetView<KycController> {

  const KycView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(KycController()).onInit();
    return Scaffold(
      backgroundColor: ColorUtil.kWhite,
      // appBar: BaseAppBar(
      //   leading: true,
      //   title: Text(""),
      //   appBar: AppBar(),
      //   widgets: [],
      //   ontap: () {
      //     Get.back();
      //   },
      // ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Size_16,
              ),
              SizedBox(
                height: Size_16,
              ),
              SizedBox(
                height: Size_16,
              ),
              SizedBox(
                height: Size_16,
              ),
              SizedBox(
                height: Size_16,
              ),
              _completeKYCText(),
              SizedBox(
                height: 40.kh,
              ),
              _completeKYCTextTwo(),
              SizedBox(
                height: Size_20,
              ),
              KycTile(
                imageAsset: "PI.svg",
                Name: "Personal Information",
                ontap: () {
                  Get.toNamed(Routes.PERSONAL_INFORMATION);
                },
                status: controller.userKycDetails.value.data?.personalInfo,
              ),
              SizedBox(
                height: Size_20,
              ),
              KycTile(
                  imageAsset: "IP.svg",
                  Name: "Identity Proof",
                  ontap: () {
                    Get.toNamed(Routes.IDENTITY_PROOF);
                  },
                  status: controller.userKycDetails.value.data?.kycDocument),
              SizedBox(
                height: Size_20,
              ),
              KycTile(
                  imageAsset: "US.svg",
                  Name: "User’s Selfie",
                  ontap: () {
                    Get.toNamed(Routes.USER_SELFIE);
                  },
                  status: controller.userKycDetails.value.data?.selfie),
              SizedBox(
                height: Size_20,
              ),
              controller.ButtonStatus.value == true ? CustomButton(
                title: "Done",
                borderRadius: Size_4,
                onTap: () {
                  print("Go");
                  if(controller.userKycDetails.value.data?.selfie == false && controller.userKycDetails.value.data?.selfie == false && controller.userKycDetails.value.data?.selfie == false ){
                    Get.snackbar("Message", "Please Complete your KYC");
                  }
                  else if(controller.userKycDetails.value.data?.selfie == false){
                    Get.snackbar("Message", "Please add your selfie");
                  } else if(controller.userKycDetails.value.data?.kycDocument == false){
                    Get.snackbar("Message", "Please add KYC details");

                  }else if(controller.userKycDetails.value.data?.personalInfo == false){
                    Get.snackbar("Message", "Please add your personal Details");
                  }else{
                    Get.back();

                  }
                },
              ) : CustomButton(
                title: "Get Started",
                borderRadius: Size_4,
                onTap: () {
                  print("Go");
                  if(controller.userKycDetails.value.data?.selfie == false && controller.userKycDetails.value.data?.selfie == false && controller.userKycDetails.value.data?.selfie == false ){
                    Get.snackbar("Message", "Please Complete your KYC");
                  }
                  else if(controller.userKycDetails.value.data?.selfie == false){
                    Get.snackbar("Message", "Please add your selfie");
                  } else if(controller.userKycDetails.value.data?.kycDocument == false){
                    Get.snackbar("Message", "Please add KYC details");
                  }else if(controller.userKycDetails.value.data?.personalInfo == false){
                    Get.snackbar("Message", "Please add your personal Details");
                  }else{
                    Get.toNamed(Routes.WALLET_CONNECT);
                  }
                },
              ),
              SizedBox(
                height: 12.kh,
              ),
              controller.ButtonStatus.value == true ? SizedBox() : Center(
                child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.WALLET_CONNECT);
                    },
                    child: Text(
                      "Skip",
                      style: TextStyleUtil.k16(color: ColorUtil.k4),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Complete KYC text widget
Widget _completeKYCText() {
  return Text(
    ConstantText.COMPLETE_KYC,
    style: TextStyleUtil.k24(
      color: ColorUtil.neutral6,
    ),
  );
}

//
Widget _completeKYCTextTwo() {
  return Text(
    "Complete this 3 steps to get started with Salvatara",
    style: TextStyleUtil.k16(
        color: ColorUtil.neutral6, fontWeight: FontWeight.normal),
  );
}

//Welcome back text widget
Widget _EmailInput() {
  return MakeInput(
      hintText: "Login",
      label: "Login",
      obscureText: false,
      width: 343.kw,
      passwordField: false);
}

//Welcome back text widget
Widget _PasswordlInput() {
  return MakeInput(
      hintText: "Password",
      label: "Login",
      obscureText: true,
      width: 343.kw,
      passwordField: true);
}

class KycTile extends StatelessWidget {
  final String imageAsset;
  final String Name;
  final Function() ontap;
  final bool? status;

  KycTile(
      {Key? key,
      required this.imageAsset,
      required this.Name,
      required this.ontap,
      required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          child: Container(
            width: 343.kw,
            height: 64.kh,
            decoration: BoxDecoration(
                border: Border.all(color: ColorUtil.k2),
                borderRadius: BorderRadius.all(Radius.circular(Size_8))),
            child: Center(
              child: Row(
                children: [
                  SizedBox(
                    width: Size_8,
                  ),
                  Container(
                    height: 48.kw,
                    width: 48.kw,
                    decoration: BoxDecoration(
                      color: ColorUtil.k1,
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/SVG/${imageAsset}"),
                    ),
                  ),
                  SizedBox(
                    width: Size_8,
                  ),
                  Text(
                    "$Name",
                    style: TextStyleUtil.k14(fontWeight: FontWeight.normal),
                  ),
                  Spacer(),
                  status == true
                      ? SizedBox(
                          height: 20.kh,
                          width: 20.kh,
                          child: Icon(
                            Icons.check_circle_sharp,
                            color: ColorUtil.green700,
                          ),
                        )
                      : SizedBox(),
                  SizedBox(
                    width: 14.kw,
                  ),

                  // SizedBox(
                  //   height: 20,
                  //     width: 20,
                  //     child: SvgPicture.asset("assets/SVG/GreenCheck.svg"))
                ],
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: ontap,
            child: Ink(
              width: double.infinity,
              height: 64.kh,
              child: Container(
                width: 343.kw,
                height: 64.kh,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
