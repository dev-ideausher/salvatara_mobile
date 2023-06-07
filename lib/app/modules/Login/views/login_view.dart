import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salvatara/app/routes/app_pages.dart';
import 'package:salvatara/app/services/CommonSnackBar.dart';
import 'package:salvatara/app/services/CustomButton.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/constants/constantSize.dart';
import 'package:salvatara/app/services/constants/constantText.dart';
import 'package:salvatara/app/services/make_input.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../services/auth.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.put(LoginController());

    Get.put(Auth());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Obx(
            () => Column(
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
                _EmailInput(LoginController: controller.EmailController.value),
                SizedBox(
                  height: Size_16,
                ),
                _PasswordlInput(
                  PasswordController: controller.PasswordController.value,
                  onTapObsecure: () {
                    if (controller.ObsecureStatus.value == false) {
                      controller.ObsecureStatus.value = true;
                    } else {
                      controller.ObsecureStatus.value = false;
                    }
                  },
                  obsecureStatus: controller.ObsecureStatus.value,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        if(controller.EmailController.value.text.toString() == ''|| controller.EmailController.value.text.isEmpty)
                        {
                          snackBarClass("Please Enter You Email address in the Email field").WarningSnackBar;
                        }else{
                          Get.find<Auth>().resetPassword(Email: '${controller.EmailController.value.text.toString()}');}

                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyleUtil.k12(
                            textDecoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Size_4,
                ),
                Row(
                  children: [
                    Checkbox(
                        fillColor: MaterialStateColor.resolveWith(
                                (states) => ColorUtil.k4),
                        value: controller.checkBoxStatus.value,
                        onChanged: (newVale) {
                          controller.checkBoxStatus.value = newVale!;
                        }),
                    Center(
                      child: RichText(
                        text: TextSpan(
                            text: "Please accept ",
                            children: [
                              TextSpan(
                                  text: "terms and conditions and \nprivacy policy",
                                  style: GoogleFonts.montserrat(
                                      color: ColorUtil.k4,
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      final url =
                                          'https://www.iubenda.com/privacy-policy/98422714';
                                      await launchUrl(
                                          Uri.parse("${url}"));
                                    }),
                            //  TextSpan(text: " and "),
                              // TextSpan(
                              //     text: "\nprivacy policy",
                              //     style: GoogleFonts.montserrat(
                              //         color: ColorUtil.k4,
                              //         fontWeight: FontWeight.bold),
                              //     recognizer: TapGestureRecognizer()
                              //       ..onTap = () async {
                              //         final url =
                              //             'https://app.musiccoast.com/privacy-policy';
                              //         await launchUrl(
                              //             Uri.parse("${url}"));
                              //       }
                              //   //Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrivacyAndPolicy()))
                              // )
                            ],
                            style: GoogleFonts.montserrat(
                                color: Colors.black, fontSize: 12.kh)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Size_4,
                ),
                SizedBox(
                  height: Size_4,
                ),
                SizedBox(
                  height: Size_4,
                ),
                SizedBox(
                  height: Size_8,
                ),
                CustomButton(
                  onTap: () async {
                    if(controller.checkBoxStatus.value == false){
                      snackBarClass("Please accept terms and conditions").WarningSnackBar;
                    }else{
                    await Get.find<Auth>().signInWithEmailAndPassword(
                        email: controller.EmailController.value.text,
                        password: controller.PasswordController.value.text);}
                  },
                  title: "Login",
                  borderRadius: Size_4,
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
                      "or login with",
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
                          if(controller.checkBoxStatus.value == false){
                            snackBarClass("Please accept terms and conditions").WarningSnackBar;

                          }else{
                          Get.find<Auth>().googleSignUp();}
                        },
                        child: SvgPicture.asset(
                            "assets/SVG/Social button (1).svg")),
                    // InkWell(
                    //     onTap: (){
                    //
                    //     },
                    //     child: SvgPicture.asset("assets/SVG/Social button (2).svg")),
                    // InkWell(
                    //     onTap: () {},
                    //     child: SvgPicture.asset(
                    //         "assets/SVG/Social button (3).svg"))
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
                        text: "Don't have an account? ",
                        children: [
                          TextSpan(
                              text: "Create new",
                              style: TextStyleUtil.k14(),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  Get.toNamed(Routes.SIGN_UP);
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
      ),
    );
  }
}

//Welcome back text widget
Widget _welcomeText() {
  return Text(
    ConstantText.WELCOME_BACK,
    style: TextStyleUtil.k24(
      color: ColorUtil.neutral6,
    ),
  );
}

//Welcome back text widget
Widget _EmailInput({required TextEditingController LoginController}) {
  return MakeInput(
      controllerID: LoginController,
      hintText: "E-mail",
      label: "E-mail",
      obscureText: false,
      width: 343.kw,
      passwordField: false);
}

//Welcome back text widget
Widget _PasswordlInput({required TextEditingController PasswordController, required bool obsecureStatus, required Function onTapObsecure}) {
  return MakeInput(
    obscureText: obsecureStatus == true ? true : false,
    controllerID: PasswordController,
    hintText: "Password",
    label: "Login",
    width: 343.kw,
    passwordField: true,
    ontapObsecureText: onTapObsecure,
  );
}
