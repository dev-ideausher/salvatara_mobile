import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:salvatara/app/data/getUserFav.dart';
import 'client.dart';
import 'endpoints.dart';

class APIManager {
  static Future<Response> fileUpload({required dynamic body}) async =>
      await DioClient(
        Dio(),
        showSnakbar: true,
        isOverlayLoader: true,
      ).post(Endpoints.uploadImage,
          data: body,
          options: Options(headers: {'Content-Type': 'multipart/form-data'}));

  ///Post API
  static Future<Response> postApiExample({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .post(Endpoints.baseUrl, data: jsonEncode(body));

  static Future<Response> postupdateUser({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .post(Endpoints.updateUser, data: jsonEncode(body));

  static Future<Response> getApiNFT_List() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .get(Endpoints.baseNFTList);



  static Future<Response> getSearchNFT_List({required String SearchQuery}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false)
          .get(Endpoints.basesearchNFTList,
      queryParameters: {'search':'${SearchQuery}'}
      );

  static Future<Response> getApiTreading_NFT_List() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .get(Endpoints.trendingNFT);

  static Future<Response> getOneCollectionDetail({required String CollectionID}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .get(Endpoints.OneCollection,
      queryParameters: {'collectionId':CollectionID}
      );

  static Future<Response> getCollectionDetail() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .get(Endpoints.Collection);

  static Future<Response> getCoinDetails({required String SearchQuery}) async =>
      await DioClient(Dio(), showSnakbar: false, isOverlayLoader: true).get(
          Endpoints.coinDetails,
          queryParameters: {'search': "${SearchQuery}"});

  static Future<Response> getCoinNews() async =>
      await DioClient(Dio(), showSnakbar: false, isOverlayLoader: false)
          .get(Endpoints.coinNews);

  static Future<Response> getCoinOneDetails() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .get(Endpoints.coinOneDetails);

  static Future<Response> postOnboarding({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .post(Endpoints.onBoarding, data: jsonEncode(body));

  static Future<Response> uploadImage({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(
        Endpoints.uploadImage,
        data: jsonEncode(body),
        options: Options(),
      );

  static Future<Response> getNFTDetails({required String NFTID}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).get(
        Endpoints.NFTDetails + NFTID,
      );

  static Future<Response> getAddFavourite({required String NFTID}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).get(
        Endpoints.addFavourite + NFTID,
      );

  static Future<Response> getRemoveFavourite({required String NFTID}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).get(
        Endpoints.removeFavourite + NFTID,
      );



  static Future<Response> getUserDetails() async =>
      await DioClient(Dio(), showSnakbar: false, isOverlayLoader: false)
          .get(Endpoints.userDetails);

  static Future<Response> getGraphData({required String coinName}) async =>
      await DioClient(Dio(), showSnakbar: false, isOverlayLoader: true)
          .get(Endpoints.graphData + coinName
      );

  static Future<Response> getKycStatus() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .get(Endpoints.kycStatus);

  static Future<Response> getKycDetails() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .get(Endpoints.kycDetails);

  static Future<Response> getUserFav() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .get(Endpoints.getUserFav);

  static Future<Response> getUserKyCDetails() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .get(Endpoints.getUserKycDetails);

  static Future<Response> getMintedNFTDetails() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false)
          .get(Endpoints.getMintedNFT);

  static Future<Response> getUserCollection() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false)
          .get(Endpoints.getUserCollection);

  static Future<Response> postListNFT({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .post(Endpoints.postListNFT, data: jsonEncode(body));

  static Future<Response> postCreateUserCollection({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .post(Endpoints.createUserCollection, data: jsonEncode(body));

  static Future<Response> getCollectedNFTDetails() async =>
      await DioClient(Dio(), showSnakbar: false, isOverlayLoader: false)
          .get(Endpoints.getCollectedNFT);

  static Future<Response> postBuyNFT({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .post(Endpoints.postBuyNFT, data: jsonEncode(body));

  static Future<Response> postMintNFT({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .post(Endpoints.mintNFT, data: jsonEncode(body));

  static Future<Response> createNFT({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .post(Endpoints.createNFT, data: jsonEncode(body));

  static Future<Response> cancelListing({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .post(Endpoints.cancelListing, data: jsonEncode(body));



  static Future<Response> deleteUserAccount() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .get(Endpoints.deleteUserAccount);
}
