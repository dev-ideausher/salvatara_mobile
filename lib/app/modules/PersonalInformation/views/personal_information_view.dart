import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:salvatara/app/routes/app_pages.dart';
import 'package:salvatara/app/services/CommonSnackBar.dart';
import 'package:salvatara/app/services/CustomButton.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/constants/constantSize.dart';
import 'package:salvatara/app/services/make_input.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:salvatara/app/widgets/BaseAppBar.dart';
import '../../../services/TextStyleUtil.dart';
import '../../../services/constants/constantText.dart';
import '../controllers/personal_information_controller.dart';

class PersonalInformationView extends GetView<PersonalInformationController> {
  const PersonalInformationView({Key? key}) : super(key: key);

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
                  "STEP 1/3",
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Size_16,
            ),
            _EnterDetailsText(),
            SizedBox(
              height: Size_40,
            ),
            _FirstNameInput(
                firstNameController:
                    controller.FirstNameTextEditingController.value),
            SizedBox(
              height: Size_16,
            ),
            _lastNameInput(
              lastNameController:
                  controller.LastNameTextEditingController.value,
            ),
            SizedBox(
              height: Size_16,
            ),
            _CountryInput(
                corNameController: controller.CorTextEditingController.value),
            SizedBox(
              height: Size_16,
            ),
            _DatePickerInput(context),
            SizedBox(
              height: Size_20,
            ),
            CustomButton(
              onTap: () async {
                if(controller.FirstNameTextEditingController.value.text == '' || controller.LastNameTextEditingController.value.text == '' || controller.CorTextEditingController.value.text == '' || controller.BirthDayPostTextEditingController.value.text == ''){
                  snackBarClass( "Please enter all the details").WarningSnackBar;
                }else{
                  await controller.updateUserPersonalDetails(
                      firstName:
                      "${controller.FirstNameTextEditingController.value.text.trim()}",
                      lastName:
                      "${controller.LastNameTextEditingController.value.text.trim()}",
                      cor: "${controller.CorTextEditingController.value.text.trim()}",
                      dob:
                      "${controller.BirthDayPostTextEditingController.value.text}");
                }

              },
              title: "Submit",
              borderRadius: Size_8,
            ),

          ],
        ),
      ),
    );
  }
}

//Enter Details text widget
Widget _EnterDetailsText() {
  return Text(
    ConstantText.ENTER_DETAILS,
    style: TextStyleUtil.k24(
      color: ColorUtil.neutral6,
    ),
  );
}

Widget _FirstNameInput({required TextEditingController firstNameController}) {
  return MakeInput(
      controllerID: firstNameController,
      hintText: "First name",
      label: "First name",
      obscureText: false,
      width: 343.kw,
      passwordField: false);
}

Widget _lastNameInput({required TextEditingController lastNameController}) {
  return MakeInput(
    controllerID: lastNameController,
    hintText: "Last name",
    label: "Last name",
    obscureText: false,
    width: 343.kw,
    passwordField: false,
  );
}

Widget _CountryInput({required TextEditingController corNameController}) {
  return MakeInput(
    controllerID: corNameController,
    hintText: "Country of Residence",
    label: "Last name",
    obscureText: false,
    width: 343.kw,
    passwordField: false,
  );
}

Widget _DatePickerInput(BuildContext context) {
  return Obx(
    () => MakeInputCustomIcon(
        controllerID: Get.find<PersonalInformationController>()
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
              maxTime: DateTime.now(), onChanged: (date) {
            print('change ${date.day}');
          }, onConfirm: (date) {
            Get.find<PersonalInformationController>()
                    .BirthDayTextEditingController
                    .value
                    .text =
                "${date.day.toString()}/${date.month.toString()}/${date.year.toString()} ";

            Get.find<PersonalInformationController>()
                .BirthDayPostTextEditingController
                .value
                .text = date.toString();
            print('confirm ${date.toLocal()}');
          }, currentTime: DateTime.now(), locale: LocaleType.en);
        }),
  );
}
