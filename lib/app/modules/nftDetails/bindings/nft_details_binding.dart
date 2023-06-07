import 'package:get/get.dart';

import '../controllers/nft_details_controller.dart';

class NftDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NftDetailsController>(
      () => NftDetailsController(),
    );
  }
}
