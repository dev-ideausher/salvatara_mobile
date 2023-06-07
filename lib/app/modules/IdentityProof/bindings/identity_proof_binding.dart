import 'package:get/get.dart';

import '../controllers/identity_proof_controller.dart';

class IdentityProofBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IdentityProofController>(
      () => IdentityProofController(),
    );
  }
}
