import 'package:get/get.dart';

import '../controllers/nav_wallet_controller.dart';

class NavWalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavWalletController>(
      () => NavWalletController(),
    );
  }
}
