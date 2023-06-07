import 'package:get/get.dart';
import 'package:salvatara/app/modules/CoinDetails/controllers/coin_details_controller.dart';
import 'package:salvatara/app/modules/Markets/controllers/markets_controller.dart';

import '../controllers/navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(
      () => NavbarController(),
    );
    Get.lazyPut<MarketsController>(
          () => MarketsController(),
    );
    Get.lazyPut<CoinDetailsController>(
          () => CoinDetailsController(),
    );
  }
}
