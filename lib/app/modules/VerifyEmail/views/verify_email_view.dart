import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/responsiveSize.dart';

import '../controllers/verify_email_controller.dart';

class VerifyEmailView extends GetView<VerifyEmailController> {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyEmailController());
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('VerifyEmailView'),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/SVG/mailSent.svg",
              height: 300.kh,
              width: 300.kh,
            ),
            SizedBox(
              height: 20.kh,
            ),
            Center(
              child: Padding(
                padding:  EdgeInsets.all(16.0),
                child: Text(
                  'Verification Link Has Been Sent to Your Email',
                   textAlign: TextAlign.center,
                  style: TextStyleUtil.k18(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
