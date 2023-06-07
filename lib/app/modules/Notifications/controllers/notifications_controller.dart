import 'package:get/get.dart';
import 'package:salvatara/app/modules/KYC/controllers/kyc_controller.dart';

class NotificationsController extends GetxController {

  var ShowKYC = false.obs;

  Future <void> KYCSetting() async {
    await Get.find<KycController>().getuserKYCDetails();
    if(Get.find<KycController>().userKycDetails.value.data?.selfie == false  ||
        Get.find<KycController>().userKycDetails.value.data?.kycDocument == false ||
        Get.find<KycController>().userKycDetails.value.data?.personalInfo == false)  {

      ShowKYC.value = true;

    } else {

      ShowKYC.value = false;

    }
  }




  @override
  void onInit() async{
   await KYCSetting();

    super.onInit();
  }

  @override
  void onReady() {

    super.onReady();
  }

  @override
  void onClose(){

    super.onClose();
  }


}
