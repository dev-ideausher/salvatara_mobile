import 'package:firebase_core/firebase_core.dart';
import 'package:salvatara/app/modules/web3/wallet_connect/wallect_connect_class.dart';
import 'package:salvatara/app/services/notification_utils.dart';
import 'package:sizer/sizer.dart';
import 'app/modules/home/bindings/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/services/storage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetServices();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp,],);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);

  await FirebaseMessagingUtils.firebaseMessagingUtils.initFirebaseMessaging();

  return runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          defaultTransition: Transition.fade,
          smartManagement: SmartManagement.full,
          debugShowCheckedModeBanner: false,
          title: "SalvaNFT",
          initialRoute: AppPages.INITIAL,
          initialBinding: HomeBinding(),
          getPages: AppPages.routes,
        );
      },
    ),
  );
}

Future<void> initGetServices() async {
  await Get.putAsync<GetStorageService>(() => GetStorageService().initState());
  Get.put(Web3Connect());
  //await Get.find<Web3Connect>().initWalletConnect();
}
