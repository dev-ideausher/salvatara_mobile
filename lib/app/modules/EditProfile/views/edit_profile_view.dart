import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:get/get.dart';
import 'package:salvatara/app/services/CommonImage.dart';
import 'package:salvatara/app/services/CustomButton.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/constants/constantSize.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:salvatara/app/widgets/BaseAppBar.dart';

import '../../../services/CommonSnackBar.dart';
import '../../../services/TextStyleUtil.dart';
import '../../../services/make_input.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.kWhite,
      appBar: BaseAppBar(
        leading: true,
        title: Text(
          "Edit Details",
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Size_24,
                ),
                Obx(
                      () =>
                      GestureDetector(
                        onTap: () {
                          controller.uploadClassProfile();
                        },
                        child: Center(
                          child: controller.ProfileImageFileLink.value != ""
                              ? CircleAvatar(
                            radius: 60.kh,
                            backgroundImage: FileImage(
                              File(
                                  "${controller.ProfileImageFileLink.value}"),
                            ),
                          )
                              : Stack(
                            children: [
                              controller.ProfileImageUploadLink.value == ''
                                  ? CircleAvatar(
                                radius: 60.kh,
                                backgroundColor: ColorUtil.kWhite,
                                backgroundImage: AssetImage(
                                    "assets/images/Ellipse309.png"),
                              )
                                  : CommonImageCircular(
                                ImageLink: "${controller.ProfileImageUploadLink
                                    .value}",
                                ImageSize: 60.kh,
                              ),
                              // CircleAvatar(
                              //         backgroundColor: ColorUtil.kWhite,
                              //         radius: 60.kh,
                              //         backgroundImage:
                              //         NetworkImage(
                              //             "${controller.imageLink.value}"),
                              //       ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                      height: 30.kw,
                                      width: 30.kw,
                                      decoration: BoxDecoration(
                                          color: ColorUtil.k6,
                                          shape: BoxShape.circle),
                                      child: Center(
                                          child: Icon(
                                            Icons.edit,
                                            color: ColorUtil.kWhite,
                                            size: 15.kw,
                                          )))),
                            ],
                          ),
                        ),
                      ),
                ),
                SizedBox(
                  height: Size_16,
                ),
                Text(
                  "First Name*",
                  style: TextStyleUtil.k14(
                      color: ColorUtil.neutral4, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: Size_4,
                ),
                _NameInput(
                    firstNameController:
                    controller.NameTextEditingController.value),
                SizedBox(
                  height: Size_16,
                ),
                Text(
                  "Last Name",
                  style: TextStyleUtil.k14(
                      color: ColorUtil.neutral4, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: Size_4,
                ),
                _LastInput(
                    lastNameController:
                    controller.LastNameTextEditingController.value),
                SizedBox(
                  height: Size_16,
                ),
                Text(
                  "Email*",
                  style: TextStyleUtil.k14(
                      color: ColorUtil.neutral4, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: Size_4,
                ),
                _EmailInput(
                    firstNameController: controller.EmailController.value),
                // SizedBox(
                //   height: Size_16,
                // ),
                // Text(
                //   "Bio",
                //   style: TextStyleUtil.k14(
                //       color: ColorUtil.neutral4, fontWeight: FontWeight.normal),
                // ),
                // SizedBox(
                //   height: Size_4,
                // ),
                // _BioInput(
                //     firstNameController: controller.BioEditingController.value),
                SizedBox(
                  height: Size_16,
                ),
                Text(
                  "Date of Birth",
                  style: TextStyleUtil.k14(
                      color: ColorUtil.neutral4, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: Size_4,
                ),
                _DatePickerInput(context),
                SizedBox(
                  height: Size_16,
                ),
                Text(
                  "Country",
                  style: TextStyleUtil.k14(
                      color: ColorUtil.neutral4, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: Size_4,
                ),
                _CountryInput(
                    firstNameController:
                    controller.CorTextEditingController.value),
                SizedBox(
                  height: 40.kh,
                ),
                CustomButton(
                  title: "Save",
                  onTap: () async {
                    if (controller.NameTextEditingController.value.text == ''|| controller.EmailController.value.text == ''){
                      snackBarClass("Please fill all ( * ) fields").WarningSnackBar;
                    }else{
                      await controller.UpdateUserWithImage();
                    }

                    //await controller.updateUser(imageLink: '');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _NameInput({required TextEditingController firstNameController}) {
  return MakeInput(
      controllerID: firstNameController,
      hintText: "First Name",
      label: "Name",
      obscureText: false,
      width: 343.kw,
      passwordField: false);
}

Widget _LastInput({required TextEditingController lastNameController}) {
  return MakeInput(
      controllerID: lastNameController,
      hintText: "Last Name",
      label: "Name",
      obscureText: false,
      width: 343.kw,
      passwordField: false);
}

Widget _EmailInput({required TextEditingController firstNameController}) {
  return GestureDetector(
    onTap: (){
      snackBarClass("Email address is non-editable field",).WarningSnackBar;
    },
    child: MakeInput(
      enabled: false,
        controllerID: firstNameController,
        hintText: "Email",
        label: "Email",
        obscureText: false,
        width: 343.kw,
        passwordField: false),
  );
}

Widget _BioInput({required TextEditingController firstNameController}) {
  return MakeInput(
      controllerID: firstNameController,
      hintText: "Bio",
      label: "Email",
      obscureText: false,
      width: 343.kw,
      passwordField: false);
}

Widget _CountryInput({required TextEditingController firstNameController}) {
  return MakeInput(
      controllerID: firstNameController,
      hintText: "Country",
      label: "Email",
      obscureText: false,
      width: 343.kw,
      passwordField: false);
}

Widget _DatePickerInput(BuildContext context) {
  return Obx(
        () =>
        MakeInputCustomIcon(
            controllerID: Get
                .find<EditProfileController>()
                .BirthDayTextEditingController
                .value,
            hintText: "D.O.B DD/MM/YYYY",
            label: "D.O.B",
            obscureText: false,
            width: 343.kw,
            SuffixIcon: true,
            ontapSuffixIcon: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  maxTime: DateTime.now(),
                  onChanged: (date) {
                    print('change ${date.day}');
                  },
                  onConfirm: (date) {
                    Get
                        .find<EditProfileController>()
                        .BirthDayTextEditingController
                        .value
                        .text =
                    "${date.day.toString()}/${date.month.toString()}/${date.year
                        .toString()} ";

                    Get
                        .find<EditProfileController>()
                        .BirthDayPostTextEditingController
                        .value
                        .text = date.toString();
                    print('confirm ${date.toLocal()}');
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.en);
            }),
  );
}
