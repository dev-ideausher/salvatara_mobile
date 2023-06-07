import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:salvatara/app/routes/app_pages.dart';
import 'package:salvatara/app/services/CustomButton.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/auth.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/constants/constantSize.dart';
import 'package:salvatara/app/services/constants/constantText.dart';
import 'package:salvatara/app/services/make_input.dart';
import 'package:salvatara/app/services/responsiveSize.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Size_120,
              ),
              _welcomeText(),
              SizedBox(
                height: 40.kh,
              ),
              _EmailInput(EmailController: controller.EmailController.value),
              SizedBox(
                height: Size_16,
              ),
              Obx(
                () => _PasswordlInput(
                    onTapObsecure: () {
                      if (controller.ObsecureStatus.value == false) {
                        controller.ObsecureStatus.value = true;
                      } else {
                        controller.ObsecureStatus.value = false;
                      }
                    },
                    obsecureStatus: controller.ObsecureStatus.value,
                    PasswordController: controller.PasswordController.value),
              ),
              SizedBox(
                height: Size_16,
              ),
              Obx(
                () => _ConfirmPasswordlInput(
                    onTapObsecure: () {
                      if (controller.ObsecureStatus.value == false) {
                        controller.ObsecureStatus.value = true;
                      } else {
                        controller.ObsecureStatus.value = false;
                      }
                    },
                    obsecureStatus: controller.ObsecureStatus.value,
                    PasswordController: controller.PasswordControllerConfirm.value),
              ),
              SizedBox(
                height: Size_16,
              ),
              SizedBox(
                height: Size_8,
              ),
              CustomButton(
                title: "Sign Up",
                borderRadius: Size_4,
                onTap: () async {
                  // print("");
                  if (controller.PasswordController.value.text ==
                      controller.PasswordControllerConfirm.value.text) {
                    await Get.find<Auth>().registerUsingEmailPassword(
                        email: controller.EmailController.value.text.trim(),
                        password: controller.PasswordController.value.text);
                  } else {
                    Get.snackbar("Message", "Password do not match");
                  }
                  //Get.toNamed(Routes.KYC);
                },
              ),
              SizedBox(
                height: Size_24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 119.kw,
                    child: Divider(
                      thickness: 1.kh,
                    ),
                  ),
                  Text(
                    "or signup with",
                    style: TextStyleUtil.k14(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    width: 119.kw,
                    child: Divider(
                      thickness: 1.kh,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Size_24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () {
                        Get.find<Auth>().googleSignUp();
                      },
                      child:
                  SvgPicture.asset("assets/SVG/Social button (1).svg")),
                  //  SvgPicture.asset("assets/SVG/Social button (2).svg"),
                //  SvgPicture.asset("assets/SVG/Social button (3).svg")
                ],
              ),
              SizedBox(
                height: Size_120,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      children: [
                        TextSpan(
                            text: "Login",
                            style: TextStyleUtil.k14(),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                Get.toNamed(Routes.LOGIN);
                              }),
                      ],
                      style: TextStyleUtil.k14(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Welcome back text widget
Widget _welcomeText() {
  return Text(
    ConstantText.CREATE_NEW_ACCOUNT,
    style: TextStyleUtil.k24(
      color: ColorUtil.neutral6,
    ),
  );
}

//Welcome back text widget
Widget _EmailInput({required TextEditingController EmailController}) {
  return MakeInput(
      controllerID: EmailController,
      hintText: "Enter your E-mail",
      label: "Login",
      obscureText: false,
      width: 343.kw,
      passwordField: false);
}

//Welcome back text widget
Widget _PasswordlInput(
    {required TextEditingController PasswordController,
    required bool obsecureStatus,
    required Function onTapObsecure,

    }) {
  return MakeInput(
    controllerID: PasswordController,
    hintText: "Password",
    label: "Login",
    obscureText: obsecureStatus == true ? true : false,
    width: 343.kw,
    passwordField: true,
    ontapObsecureText: onTapObsecure,
  );
}

Widget _ConfirmPasswordlInput(
    {required TextEditingController PasswordController,
      required bool obsecureStatus,
      required Function onTapObsecure,

    }) {
  return MakeInput(
    controllerID: PasswordController,
    hintText: "Confirm Password",
    label: "Login",
    obscureText: obsecureStatus == true ? true : false,
    width: 343.kw,
    passwordField: false,
    ontapObsecureText: onTapObsecure,
  );
}


