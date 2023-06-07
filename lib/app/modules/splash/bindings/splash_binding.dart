import 'package:get/get.dart';
import 'package:salvatara/app/modules/Profile/controllers/profile_controller.dart';
import 'package:salvatara/app/modules/web3/wallet_connect/wallect_connect_class.dart';
import 'package:salvatara/app/services/auth.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),fenix: true
    );
    Get.lazyPut<Web3Connect>(
          () => Web3Connect(),
    );
    Get.lazyPut<Auth>(
          () => Auth(),fenix: true
    );

    Get.lazyPut<ProfileController>(
            () => ProfileController(),fenix: true
    );
  }
}
