import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageService extends GetxService {
  static final _runData = GetStorage('runData');

  Future<GetStorageService> initState() async {
    await GetStorage.init('runData');
    return this;
  }

  // we are utilisig encrypt class we decrypt once we read and encrypt before write.

  String get encjwToken => _runData.read('jwToken') ?? '';

  set encjwToken(String val) => _runData.write('jwToken', val);

  void logout() {
    _runData.erase();
  }
}
