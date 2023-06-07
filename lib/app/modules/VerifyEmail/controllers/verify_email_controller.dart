import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:salvatara/app/modules/Login/controllers/login_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth.dart';

class VerifyEmailController extends GetxController {
  //TODO: Implement VerifyEmailController

  //TODO: Implement VerifYotpController
  FirebaseAuth auth = FirebaseAuth.instance;
  final isEmailVerified = false.obs;
  final count = 0.obs;
  final loader = false.obs;
  late Timer timer;
  String url = 'https://hasura.mogoverse.click/v1/graphql';

  @override
  void onInit() {
    super.onInit();
    print("hello verification");
    isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;

    // if(!isEmailVerified.value){
    //   sendVerificationEmail();
    // }
    // if(isEmailVerified.value){
    //   Get.toNamed(Routes.SET_UP_PROFILE);
    // }

    timer = Timer.periodic(Duration(seconds: 3), (_) async {

      return await checkEmailVerified();
    });
  }

  Future sendVerificationEmail() async {
    try {
      loader.value = true;
      final user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();
      loader.value = false;
    } catch (e) {
      print(e);
      loader.value = false;
      Get.snackbar("Error", "${e}");
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;
    if (isEmailVerified.value) {
      timer.cancel();
      await Get.find<Auth>().handleGetContact(id: "id", fullName: "fullName", email: "email", photoUrl: "photoUrl", phoneNumber: "phoneNumber");
     await Get.find<Auth>().postOnBoardingRequest(Email: "Email");
      await Get.find<Auth>().getuserKYCDetails();
      if(Get.find<Auth>().userKycDetails.value.data?.personalInfo ==  false){
        await Get.find<LoginController>().updateUserPersonalDetails(firstName: "Unkown", lastName: '', cor: '', dob: "", selfie: '',
        );

      }
      Get.toNamed(Routes.KYC,arguments: [false]);
    }
    ;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
