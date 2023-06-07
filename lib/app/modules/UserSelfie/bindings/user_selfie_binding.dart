import 'package:get/get.dart';

import '../controllers/user_selfie_controller.dart';

class UserSelfieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserSelfieController>(
      () => UserSelfieController(),
    );
  }
}
