import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors.dart';
import 'responsiveSize.dart';

class DialogHelper {
  static void showLoading([String? message]) {
    Get.dialog(
      WillPopScope(
        child: SizedBox(
          child: Center(
            child: Container(
                height: 80.kh,
                width: 80.kh,
                decoration: BoxDecoration(
                  color: ColorUtil.k5,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0.kh),
                  ),
                ),
                padding: EdgeInsets.all(12.kh),
                child: Center(
                  child: CircularProgressIndicator(
                    color: ColorUtil.kWhite,
                    strokeWidth: 2,
                  ),
                )),
          ),
        ),
        onWillPop: () => Future.value(false),
      ),
      barrierDismissible: false,
      barrierColor: const Color(0xff141A31).withOpacity(.4),
      useSafeArea: true,
    );
  }

  //hide loading
  static Future<void> hideDialog() async {
    if (Get.isDialogOpen!) Get.until((route) => !Get.isDialogOpen!);
  }
}
