import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salvatara/app/modules/IdentityProof/controllers/identity_proof_controller.dart';
import 'package:salvatara/app/modules/KYC/controllers/kyc_controller.dart';
import 'package:salvatara/app/modules/PersonalInformation/views/upload.dart';
import 'package:salvatara/app/services/dio/api_service.dart';

class UserSelfieController extends GetxController {
  //TODO: Implement UserSelfieController
  var camController = Rx<CameraController?>(null);

 // var camController;
  var loader = false.obs;
  late List<CameraDescription> _cameras;

  final count = 0.obs;
  Future initialiseCamera()async{
    loader.value = true;
    _cameras = await availableCameras();
    camController.value = CameraController(_cameras[1], ResolutionPreset.veryHigh);
    await camController.value?.initialize();
    loader.value = false;
  }

  Future uploadImage()async{
 var ImageLInk = await  uploadClassMain().postReqUpload(ImageLink: "${picPath.value}");

 await updateUserPersonalDetails(imageLink:ImageLInk);
 await Get.find<KycController>().getuserKYCDetails();
 Get.back();

  }

  @override
  void onInit() async{
    super.onInit();
    await initialiseCamera();



    // then((_) {
    //   // if (!mounted) {
    //   //   return;
    //   // }
    // }).catchError((Object e) {
    //   if (e is CameraException) {
    //     switch (e.code) {
    //       case 'CameraAccessDenied':
    //         print('User denied camera access.');
    //         break;
    //       default:
    //         print('Handle other errors.');
    //         break;
    //     }
    //   }
    // });

  }

  Future<void> updateUserPersonalDetails({required String imageLink}) async {
    var response = await APIManager.postupdateUser(body: {
      "selfie":"${imageLink}",
    });
    print(response);
    var data = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(await response.data);
    } else {

    }
  }


  var picPath = ''.obs;

  Future takePicture() async {
    if (!camController.value!.value.isInitialized) {return null;}
    if (camController.value!.value.isTakingPicture) {return null;}
    try {
      await camController.value?.setFlashMode(FlashMode.off);
      XFile? picture = await camController.value?.takePicture();
      // Navigator.push(context, MaterialPageRoute(
      //     builder: (context) => PreviewPage(
      //       picture: picture,
      //     )));
      picPath.value = picture!.path.toString();

      print(picture.path);

    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  @override
  void onReady() async{

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
