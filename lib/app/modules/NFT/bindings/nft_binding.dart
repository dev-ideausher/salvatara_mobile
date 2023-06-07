import 'package:get/get.dart';

import '../controllers/nft_controller.dart';

class NftBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NftController>(
      () => NftController(),
    );
  }
}
