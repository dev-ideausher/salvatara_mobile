import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:salvatara/app/routes/app_pages.dart';
import 'package:salvatara/app/services/CustomButton.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:salvatara/app/widgets/BaseAppBar.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
 Scaffold(
        appBar: BaseAppBar(
          leading: true,
          title: Text(
            "Notification",
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
        backgroundColor: ColorUtil.kWhite,
        body:

        controller.ShowKYC.value == true
            ? // Positioned(
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 60.kh,
                    width: 343.kw,
                    decoration: BoxDecoration(
                      color: ColorUtil.k6,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ColorUtil.k6,
                          blurRadius: 0.0,
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                        ),
                      ],
                      border:
                          Border.all(color: ColorUtil.neutral6.withOpacity(0.2)),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Image(
                                height: 20.kw,
                                width: 20.kw,
                                image: AssetImage("assets/images/KYCpending.png")),
                            SizedBox(
                              height: 40.kh,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Text(
                                "KYC Pending",
                                style: TextStyleUtil.k20(color: ColorUtil.kWhite),
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                                height: 28.kh,
                                width: 100.kw,
                                child: CustomButton(
                                  title: "Complete KYC",
                                  onTap: () {
                                    Get.toNamed(Routes.KYC, arguments: [true]);
                                  },
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications,
                    size: 100.kw,
                  ),
                  SizedBox(
                    height: 15.kh,
                  ),
                  Center(
                    child: Text(
                      'No notifications yet!',
                      style: TextStyleUtil.k20(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
