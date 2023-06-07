class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://3.144.148.175:8000/";

  // receiveTimeout
  static const int receiveTimeout = 150000;

  // connectTimeout
  static const int connectionTimeout = 150000;
  static const String baseNFTList = "user/getListedNFT?search=null";
  static const String basesearchNFTList = "user/getListedNFT";
  static const String trendingNFT = "user/trendingNFT";
  static const String coinDetails = "user/getCryptoList";
  static const String coinOneDetails = "user/getOneCryptoData?cryptoId=";
  static const String coinNews = "user/cryptoNews?q=bitcoin";
  static const String onBoarding = "user/onboarding";
  static const String NFTDetails = "user/getOneNFT/";
  static const String addFavourite = "user/addItemToFavourites/";
  static const String removeFavourite = "user/removeItemFromFavorite/";
  static const String updateUser = "user/updateUser/";
  static const String uploadImage = "admin/uploadImage/";
  static const String mintNFT =  "user/mintNFT";
  static const String userDetails = "user/getOneUser";
  static const String Collection = "user/Collection";
  static const String OneCollection = "user/getOneCollection";
  static const String graphData = "user/candleSticky";
  static const String kycStatus = "user/getuserKYC";
  static const String kycDetails ="user/userKycDetails";
  static const String getUserFav ="user/getFavourites";
  static const String getUserKycDetails ="user/userKycDetails";
  static const String getCollectedNFT = "user/userCollection";
  static const String getMintedNFT =  "user/getMintedNFT?search=null";
  static const String getUserCollection =  "user/getUserCollections";
  static const String createUserCollection =  "user/createCollection";
  static const String postListNFT =   "user/ListNFT";
  static const String postBuyNFT =      "user/buyNFT";
  static const String createNFT =  "user/createNFT'";
  static const String cancelListing =   "user/cancelListNft";

  static const String deleteUserAccount =   "user/deleteAccount";


}
