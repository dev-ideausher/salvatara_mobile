import 'package:get/get.dart';

import '../modules/CoinDetails/bindings/coin_details_binding.dart';
import '../modules/CoinDetails/views/coin_details_view.dart';
import '../modules/CollectionDetails/bindings/collection_details_binding.dart';
import '../modules/CollectionDetails/views/collection_details_view.dart';
import '../modules/EditProfile/bindings/edit_profile_binding.dart';
import '../modules/EditProfile/views/edit_profile_view.dart';
import '../modules/IdentityProof/bindings/identity_proof_binding.dart';
import '../modules/IdentityProof/views/identity_proof_view.dart';
import '../modules/KYC/bindings/kyc_binding.dart';
import '../modules/KYC/views/kyc_view.dart';
import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/Markets/bindings/markets_binding.dart';
import '../modules/Markets/views/markets_view.dart';
import '../modules/MintNFT/bindings/mint_n_f_t_binding.dart';
import '../modules/MintNFT/views/mint_n_f_t_view.dart';
import '../modules/NFT/bindings/nft_binding.dart';
import '../modules/NFT/views/nft_view.dart';
import '../modules/NavWallet/bindings/nav_wallet_binding.dart';
import '../modules/NavWallet/views/nav_wallet_view.dart';
import '../modules/Navbar/bindings/navbar_binding.dart';
import '../modules/Navbar/views/navbar_view.dart';
import '../modules/Notifications/bindings/notifications_binding.dart';
import '../modules/Notifications/views/notifications_view.dart';
import '../modules/PersonalInformation/bindings/personal_information_binding.dart';
import '../modules/PersonalInformation/views/personal_information_view.dart';
import '../modules/Profile/bindings/profile_binding.dart';
import '../modules/Profile/views/profile_view.dart';
import '../modules/SignUp/bindings/sign_up_binding.dart';
import '../modules/SignUp/views/sign_up_view.dart';
import '../modules/Trade/bindings/trade_binding.dart';
import '../modules/Trade/views/trade_view.dart';
import '../modules/UserSelfie/bindings/user_selfie_binding.dart';
import '../modules/UserSelfie/views/user_selfie_view.dart';
import '../modules/VerifyEmail/bindings/verify_email_binding.dart';
import '../modules/VerifyEmail/views/verify_email_view.dart';
import '../modules/Wallet/bindings/wallet_binding.dart';
import '../modules/Wallet/views/wallet_view.dart';
import '../modules/WalletConnect/bindings/wallet_connect_binding.dart';
import '../modules/WalletConnect/views/wallet_connect_view.dart';
import '../modules/createCollection/bindings/create_collection_binding.dart';
import '../modules/createCollection/views/create_collection_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/nftDetails/bindings/nft_details_binding.dart';
import '../modules/nftDetails/views/nft_details_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR,
      page: () => const NavbarView(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: _Paths.NFT,
      page: () => NftView(),
      binding: NftBinding(),
    ),
    GetPage(
      name: _Paths.MARKETS,
      page: () => const MarketsView(),
      binding: MarketsBinding(),
    ),
    GetPage(
      name: _Paths.TRADE,
      page: () => const TradeView(),
      binding: TradeBinding(),
    ),
    GetPage(
      name: _Paths.WALLET,
      page: () => const WalletView(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.KYC,
      page: () => KycView(),
      binding: KycBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_INFORMATION,
      page: () => const PersonalInformationView(),
      binding: PersonalInformationBinding(),
    ),
    GetPage(
      name: _Paths.IDENTITY_PROOF,
      page: () => const IdentityProofView(),
      binding: IdentityProofBinding(),
    ),
    GetPage(
      name: _Paths.USER_SELFIE,
      page: () => UserSelfieView(),
      binding: UserSelfieBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.WALLET_CONNECT,
      page: () => WalletConnectView(),
      binding: WalletConnectBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_EMAIL,
      page: () => const VerifyEmailView(),
      binding: VerifyEmailBinding(),
    ),
    GetPage(
      name: _Paths.NFT_DETAILS,
      page: () =>  NftDetailsView(),
      binding: NftDetailsBinding(),
    ),
    GetPage(
      name: _Paths.NAV_WALLET,
      page: () => NavWalletView(),
      binding: NavWalletBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.COIN_DETAILS,
      page: () => CoinDetailsView(),
      binding: CoinDetailsBinding(),
    ),
    GetPage(
      name: _Paths.MINT_N_F_T,
      page: () => MintNFTView(),
      binding: MintNFTBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_COLLECTION,
      page: () => CreateCollectionView(),
      binding: CreateCollectionBinding(),
    ),
    GetPage(
      name: _Paths.COLLECTION_DETAILS,
      page: () => const CollectionDetailsView(),
      binding: CollectionDetailsBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
  ];
}
