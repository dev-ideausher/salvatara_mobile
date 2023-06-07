import 'package:get/get.dart';

import '../controllers/mint_n_f_t_controller.dart';

class MintNFTBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MintNFTController>(
      () => MintNFTController(),
    );
  }
}
