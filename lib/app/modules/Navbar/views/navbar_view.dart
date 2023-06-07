import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:salvatara/app/modules/KYC/controllers/kyc_controller.dart';
import 'package:salvatara/app/modules/KYC/views/kyc_view.dart';
import 'package:salvatara/app/modules/Markets/views/markets_view.dart';
import 'package:salvatara/app/modules/NFT/views/nft_view.dart';
import 'package:salvatara/app/modules/NavWallet/views/nav_wallet_view.dart';
import 'package:salvatara/app/modules/Profile/views/profile_view.dart';
import 'package:salvatara/app/modules/Trade/views/trade_view.dart';
import 'package:salvatara/app/modules/Wallet/views/wallet_view.dart';
import 'package:salvatara/app/services/CustomButton.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import '../../../services/dynamicLinks.dart';
import '../../../services/notification_utils.dart';
import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  const NavbarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    initDynamicLinks(context);
    Get.put(KycController());
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex.value,
          children: [
            //CommentsView(),
            NftView(),
            MarketsView(),
            //TradeView(),
            // NavWalletView(),
            //KycView(),
            ProfileView()
            //TradeView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: ColorUtil.neutral3,
          selectedItemColor: ColorUtil.neutral6,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex.value,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 22,
          items: [
            _bottomNavigationBarItem(
              icon: 'assets/SVG/NFT.svg',
              label: 'NFT',
            ),
            _bottomNavigationBarItem(
              icon: 'assets/SVG/MARKET.svg',
              label: 'Markets',
            ),
            // _bottomNavigationBarItem(
            //   icon: 'assets/SVG/TRADE.svg',
            //   label: 'Trade',
            // ),
            // _bottomNavigationBarItem(
            //   icon: 'assets/SVG/WALLET.svg',
            //   label: 'Wallet',
            // ),
            _bottomNavigationBarItem(
              icon: 'assets/SVG/PROFILE.svg',
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }

  _bottomNavigationBarItem({required icon, required String label}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        color: ColorUtil.neutral3,
      ),
      activeIcon: SvgPicture.asset(
        icon,
        color: ColorUtil.neutral6,
      ),
      label: label,
    );
  }
}
