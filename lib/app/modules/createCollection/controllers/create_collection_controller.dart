import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../../../services/upload_class.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:salvatara/app/services/dio/api_service.dart';
import 'package:salvatara/app/services/storage.dart';


class CreateCollectionController extends GetxController {
  //TODO: Implement CreateCollectionController
  var TitleController = TextEditingController().obs;
  var DescriptionController = TextEditingController().obs;
  var ExternalLinkController = TextEditingController().obs;
  var RoyaltyController = TextEditingController().obs;
  var imageLink = ''.obs;
  var imageCoverLink = ''.obs;
  var imageUploadLink = ''.obs;
  var imageUploadLinkCover = ''.obs;

  var tokenURI = ''.obs;

  final count = 0.obs;
 var UserID = ''.obs;

  Future uploadClassesProfile() async {
    imageLink.value = (await uploadImageClass().getImage(gallery: true))!;
    print(imageLink.value);
  }

  Future uploadClassesCover() async {
    imageCoverLink.value = (await uploadImageClass().getImage(gallery: true))!;
    print(imageCoverLink.value);
  }

  Future<String> postReqUpload() async {
    final extension =
    path.extension(imageLink.value.toString()).replaceAll(".", "");
    var mDatajson = await FormData.fromMap(
      {
        "file": await MultipartFile.fromFile(
          imageLink.value,
          contentType: MediaType(
            'application',
            extension.toString(),
          ),
        ),
      },
    );
    var response = await APIManager.fileUpload(body: mDatajson);
    print(response.statusCode);
    print(response.data['data']);
    imageUploadLink.value = response.data['data'].toString();

    return response.data['data'].toString();
  }
  Future<String> postReqUploadCover() async {
    final extension =
    path.extension(imageCoverLink.value.toString()).replaceAll(".", "");
    var mDatajson = await FormData.fromMap(
      {
        "file": await MultipartFile.fromFile(
          imageCoverLink.value,
          contentType: MediaType(
            'application',
            extension.toString(),
          ),
        ),
      },
    );
    var response = await APIManager.fileUpload(body: mDatajson);
    print(response.statusCode);
    print(response.data['data']);
    imageUploadLinkCover.value = response.data['data'].toString();

    return response.data['data'].toString();
  }



  Future postCreateUserCollection() async {
    var response = await APIManager.postCreateUserCollection(body:
    {
      "title": "${TitleController.value.text}",
      "category": "png",
      "description": "${DescriptionController.value.text}",
      "externalLink": "${ExternalLinkController.value.text}",
      "explicit_sensitive": true,
      "royalty": true,
      "profile": "${imageUploadLink.value}",
      "cover": "${imageUploadLinkCover.value}",
      "user": "${UserID.value}"
    }

    );
    print("${response}");
  }


 Future<void> CREATECollection()async{
    await postReqUpload();
    await postReqUploadCover();
    await postCreateUserCollection();
    Clear();
    Get.back();
  }


  Clear(){
    TitleController.value.clear();
    DescriptionController.value.clear();
    ExternalLinkController.value.clear();
    RoyaltyController.value.clear();
    imageLink.value= '';
    imageUploadLinkCover.value = '';
  }
  @override
  void onInit() {
    UserID.value = Get.arguments[0];
    print(UserID.value);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
