import 'package:get/get.dart';
import 'package:salvatara/app/routes/app_pages.dart';
import 'package:salvatara/app/services/storage.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 1), () async{
      if(
      Get.find<GetStorageService>().encjwToken == ''
      ){
        Get.offAllNamed(Routes.LOGIN);
      }else{
        //Get.find<GetStorageService>().encjwToken = 'eyJhbGciOiJSUzI1NiIsImtpZCI6ImU3OTMwMjdkYWI0YzcwNmQ2ODg0NGI4MDk2ZTBlYzQzMjYyMjIwMDAiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vc2FsdmF0YXJhLTZjYmE3IiwiYXVkIjoic2FsdmF0YXJhLTZjYmE3IiwiYXV0aF90aW1lIjoxNjgyNjk3NTc0LCJ1c2VyX2lkIjoieDFMTk5GRm14UmV0eHBPaDRwMXE3MGhLZVVQMiIsInN1YiI6IngxTE5ORkZteFJldHhwT2g0cDFxNzBoS2VVUDIiLCJpYXQiOjE2ODI2OTc1NzQsImV4cCI6MTY4MjcwMTE3NCwiZW1haWwiOiJzYWx2YWFkbWluMTIzQHlvcG1haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInNhbHZhYWRtaW4xMjNAeW9wbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJjdXN0b20ifX0.R8fGgINEfQ61CZnaWj_sdFQAa40Nm4RkVWlSMgxfUQEom5MTADopxwMi4bU9EdZ8a6oDlKAVD6HeAX92Mkqasg1ZHtXBqxtWipiK9CkEdhadSfDkEV1YhfeHIWPsCHJM-4hnXKxNID3JR4HMJp23usItbdpObYHuGC7wh2hTtugduk0dmlJMihZK61VkhGjWApV4_I6XrkG9Tob5c1KYjsD9Q8kJmgH9oLNOVg_3u5QrDjYsckLi3eaQEZNWCMibbC3k6GjhEumicIGPZSKhOlll_nKlyqOEU_dGU98EufY0igqjtxKSbqDAQi78nq7YffZjS2LWxMbLO31Bt6Tbxg';
        Get.offAllNamed(Routes.NAVBAR);

      }


    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
