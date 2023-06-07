
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:salvatara/app/services/dio/api_service.dart';
import 'package:salvatara/app/services/upload_class.dart';
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;

import 'package:dio/dio.dart';
import 'package:salvatara/app/services/dio/api_service.dart';

class uploadClassMain{
Future<String> postReqUpload({required String ImageLink}) async {
  final extension = path.extension(ImageLink.toString()).replaceAll(".", "");
  var mDatajson = await FormData.fromMap(
    {
      "file": await MultipartFile.fromFile(
        ImageLink,
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
  return response.data['data'].toString();
}
}