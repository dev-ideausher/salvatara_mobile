import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salvatara/app/routes/app_pages.dart';

Future<void> initDynamicLinks(BuildContext context) async {
  await Future.delayed(Duration(seconds: 3));

  FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
    final Uri? deepLink = dynamicLinkData.link;
    print("Deep Link URl : ${deepLink}");

    if (deepLink != null) {
      if (deepLink.path == '/NFT') {
        print(deepLink.queryParameters['nftID']);
        //Get.snackbar("Message", "DeepLink");
        Get.toNamed(Routes.NFT_DETAILS,
            arguments: [deepLink.queryParameters['nftID'],false]);
        //Get.toNamed(Routes.MUSIC_PLAYER,);
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             ChangeNotifierProvider<songcount>(create: (context) => songcount(),
        //               child: Audio_player_testtest(
        //                 fromtrendingtracks: true,
        //                 fromartistprofile: false,
        //                 miniplayer: false,
        //                 fromSearch: true,
        //                 type: 'trending',
        //                 index: deepLink.queryParameters['index'].toString(),
        //                 id: deepLink.queryParameters['songID'].toString(),
        //                 score: deepLink.queryParameters['Score'].toString(),
        //                 songname: deepLink.queryParameters['sName'].toString(),
        //                 artistname:
        //                 deepLink.queryParameters['aName'].toString(),
        //                 artistID:
        //                 deepLink.queryParameters['artistID'].toString(),
        //                 link: deepLink.queryParameters['link'].toString(), mediaItems: [
        //                 MediaItem(
        //                   id: '${deepLink.queryParameters['songID'].toString()}',
        //                   album: '${deepLink.queryParameters['sName'].toString()}',
        //                   title: '${deepLink.queryParameters['sName'].toString()}',
        //                   artUri: Uri.parse("${deepLink.queryParameters['link'].toString()}"),
        //                   artist: '${deepLink.queryParameters['aName'].toString()}',
        //                   extras: {
        //                     'url'   :  'https://rairplaybucketstack-rairplaybucketstack33380899-kxqktejyxb6o.s3.amazonaws.com/rairplay_song_${deepLink.queryParameters['songID'].toString()}/full_song.mp3',
        //                     'score' :  '${deepLink.queryParameters['Score'].toString()}',
        //                     'artistID' : '${deepLink.queryParameters['artistID'].toString()}'
        //                   },
        //                 )
        //               ],
        //               ),
        //             )));

      } else if (deepLink.path == '/Artist') {

        // Get.toNamed(Routes.ARTIST_PROFILE,
        //     arguments: [deepLink.queryParameters['ID'].toString()]);

      }
    }
  }).onError((error) {
    print('onLink error');
    print(error.message);
  });
  try {
    await Future.delayed(Duration(seconds: 3));
    var data = await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data!.link;
    if (deepLink.path != null) {
      print("initial");
      if (deepLink.path == '/NFT'){
        Get.snackbar("Message", "DeepLink Initil");
        Get.toNamed(Routes.NFT_DETAILS,
            arguments: [deepLink.queryParameters['nftID'],false]);
        // Get.toNamed(Routes.ARTIST_PROFILE,
        //     arguments: [deepLink.queryParameters['ID'].toString()]);
      }else if(deepLink.path == '/NFT'){
        Get.toNamed(Routes.NFT_DETAILS,
            arguments: [deepLink.queryParameters['nftID'],false]);
     //   Get.toNamed(Routes.MUSIC_PLAYER,);
      }
    }
  } catch (e) {
    print(e);
  }
}

Future<String> createDynamicLink(
    {required bool short,
      required nftID
    }) async {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://salvatara.page.link',
    link: Uri.parse("https://salvatara.page.link/NFT?nftID="+"${nftID}"),
    androidParameters: AndroidParameters(
      packageName: 'com.iu.salvatara.salvatara',
      minimumVersion: 0,
    ),
    iosParameters: IOSParameters(
      bundleId: "com.iu.salvatara.salvatara",
      appStoreId: "6443813214",
      minimumVersion: "1.0.1",
    ),
  );

  Uri url;
  if (short) {
    final ShortDynamicLink shortLink = await dynamicLinks.buildShortLink(parameters);
    url = shortLink.shortUrl;
  } else {
    url = await dynamicLinks.buildLink(parameters);
  }
  return url.toString();
}

// Future<String> createDynamicLinkArist(
//     {required bool short, required ID}) async {
//   FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
//   final DynamicLinkParameters parameters = DynamicLinkParameters(
//     uriPrefix: 'https://musiccoastuser.page.link',
//     link: Uri.parse("https://musiccoastuser.page.link/Artist?ID=" + "${ID}"),
//     androidParameters: AndroidParameters(
//       packageName: 'com.ideausher.musicCoast',
//       minimumVersion: 0,
//     ),
//     iosParameters: IOSParameters(bundleId: "com.ideausher.musicCoast",
//       appStoreId: "6443813214",
//       minimumVersion: "1.0.1",
//     ),
//   );
//
//   Uri url;
//   if (short == true) {
//     ShortDynamicLink shortLink = await dynamicLinks.buildShortLink(parameters);
//     url = shortLink.shortUrl;
//   } else {
//     url = await dynamicLinks.buildLink(parameters);
//   }
//   return url.toString();
// }
//var encrypted = encryptAESCryptoJS(_card.toString());