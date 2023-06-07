import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../../../services/upload_class.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:salvatara/app/services/dio/api_service.dart';
import 'package:salvatara/app/services/storage.dart';

class MintNFTController extends GetxController {

  var SelectedCollectionID = ''.obs;
  var TitleController = TextEditingController().obs;
  var DescriptionController = TextEditingController().obs;
  var ExternalLinkController = TextEditingController().obs;
  var RoyaltyController = TextEditingController().obs;
  var imageLink = ''.obs;
  var imageUploadLink = ''.obs;
  var tokenURI = ''.obs;

  Future uploadClassesFront() async {
    imageLink.value = (await uploadImageClass().getImage(gallery: true))!;
    print(imageLink.value);
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

  Future<void> updateUserPersonalDetails() async {
    var response = await APIManager.postMintNFT(
      body: {
        "file": "${imageUploadLink.value}",
        "name": "${TitleController.value.text}",
        "description": "${DescriptionController.value.text}",
        "external_url": "${ExternalLinkController.value.text}",

      },
    );
    print(response);
    var data = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print(response.statusCode);
      await response.data['data'];
      tokenURI.value = response.data['data'];
      print(response.data);
    } else {

    }
  }

  Future<void> createNFT(
      {required String txnHash,required String TokenID}) async {
    var headers = {
      'Authorization': 'Bearer ${Get.find<GetStorageService>().encjwToken}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://3.144.148.175:8000/user/createNFT'));
    request.body = json.encode(
        {
          "title": "${TitleController.value.text}",
          "category":"png",
          "description":"desc",
          "price":0.01,
          "externalLink":"${ExternalLinkController.value.text}",
          "explicit_sensitive":true,
          "stats":true,
          "royalty":int.parse("${RoyaltyController.value.text}"),
          "imageURL":"${imageUploadLink.value}",
          "market":"setPrice",
          "collectionId":"${SelectedCollectionID.value}",
          "fileType":"image",
          "tokenId":"${TokenID}",
          "status":"Minted",
          "contractAddress":"0x81eaeC135cF1D9b3eE82bCB63Ac65766843076C0",
          "txnHash":"${txnHash}",
          "typeOfPayment":"salvacoin"
        }

    //
    //     {
    //   "title": "${TitleController.value.text}",
    //   "category": "png",
    //   "description": "desc",
    //   "price": 0.01,
    //   "externalLink": "${ExternalLinkController.value.text}",
    //   "explicit_sensitive": true,
    //   "stats": true,
    //   "royalty": 2,
    //   "imageURL": "${imageUploadLink.value}",
    //   "market": "setPrice",
    //   "collectionId": "6405bfc557a35b9247987002",
    //   "fileType": "image",
    //   "tokenId": "${TokenID}",
    //   "status": "Minted",
    //   "contractAddress": "0x81eaeC135cF1D9b3eE82bCB63Ac65766843076C0",
    //   "txnHash": "${txnHash}",
    //   "typeOfPayment": "matic"
    // }
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      ClearInputs();

      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

    // var response = await APIManager.createNFT(
    //   body:
    //   {
    //     "title": "Red moon",
    //     "category": "png",
    //     "description": "desc",
    //     "price": 0.01,
    //     "externalLink": "nft link",
    //     "explicit_sensitive": true,
    //     "stats": true,
    //     "royalty": 2,
    //     "imageURL": "https://salvatara.s3.us-east-2.amazonaws.com/salvatara-galleryimage_picker_99302DC9-2E50-4210-8FA6-1E8C361763C5-25891-0000089A28C0C8FD.jpg",
    //     "market": "setPrice",
    //     "collectionId": "6405bfc557a35b9247987002",
    //     "fileType": "image",
    //     "tokenId": "36",
    //     "status": "Minted",
    //     "contractAddress": "0x81eaeC135cF1D9b3eE82bCB63Ac65766843076C0",
    //     "txnHash": "0x1d1756eebb0e337c8d3263ab0d3167c8befa8528e43e4a5494c76a18ffb94040",
    //     "typeOfPayment": "matic"
    //   },
    // );
    // print(response);
    // var data = jsonDecode(response.toString());
    // if (response.statusCode == 200) {
    //   print(response.statusCode);
    //   await response.data['data'];
    //
    //   print(response.data);
    // } else {
    //   print("object");
    // }
  }


  ClearInputs(){
    TitleController.value.clear();
    DescriptionController.value.clear();
    imageLink.value = '';
    ExternalLinkController.value.clear();
    RoyaltyController.value.clear();

  }

  @override
  void onInit() {
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
}
