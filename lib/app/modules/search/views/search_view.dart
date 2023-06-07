import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:salvatara/app/modules/NFT/views/nft_view.dart';
import 'package:salvatara/app/routes/app_pages.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/make_input.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:salvatara/app/widgets/BaseAppBar.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.kWhite,
      appBar: BaseAppBar(
          title: Text(
            "Search Results",
            style: TextStyleUtil.k24(),
          ),
          appBar: AppBar(),
          widgets: [],
          ontap: () {
            Get.back();
          },
          leading: true),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  MakeInputCustomIcon(
                    controllerID: controller.searchQuery.value,
                    hintText: "Search NFT",
                    label: "label",
                    obscureText: false,
                    width: 343.kw,
                    prefixIcon: Icon(Icons.search),
                    SuffixIcon: false,
                    onChanged: (String value) => controller.getNFTList(),
                  ),
                  // Spacer(),
                  // Stack(
                  //   children: [
                  //     Container(
                  //       height: 44.kh,
                  //       width: 44.kw,
                  //       decoration: BoxDecoration(
                  //           color: ColorUtil.neutral1,
                  //           borderRadius: BorderRadius.all(Radius.circular(4)),
                  //           border: Border.all(color: ColorUtil.neutral2)),
                  //       child: Center(
                  //         child: SvgPicture.asset("assets/SVG/filterIcon.svg"),
                  //       ),
                  //     ),
                  //     Material(
                  //       color: Colors.transparent,
                  //       child: InkWell(
                  //         onTap: () {
                  //           Get.bottomSheet(Container(
                  //             height: 607.kh,
                  //             decoration: BoxDecoration(color: ColorUtil.kWhite),
                  //             child: Stack(
                  //               children: [
                  //                 Padding(
                  //                   padding: const EdgeInsets.all(8.0),
                  //                   child: Column(
                  //                     mainAxisAlignment: MainAxisAlignment.start,
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       SizedBox(
                  //                         height: 32.kh,
                  //                       ),
                  //                       Text(
                  //                         "Sort By",
                  //                         style: TextStyleUtil.k14(),
                  //                       ),
                  //                       SizedBox(
                  //                         height: 12.kh,
                  //                       ),
                  //                       GridView.builder(
                  //                         shrinkWrap: true,
                  //                         itemCount: 2,
                  //                         gridDelegate:
                  //                             SliverGridDelegateWithFixedCrossAxisCount(
                  //                           crossAxisCount: 3,
                  //                           crossAxisSpacing: 7,
                  //                           mainAxisSpacing: 7,
                  //                           childAspectRatio:
                  //                               MediaQuery.of(context)
                  //                                       .size
                  //                                       .width /
                  //                                   (MediaQuery.of(context)
                  //                                           .size
                  //                                           .height /
                  //                                       4.3),
                  //                         ),
                  //                         itemBuilder: (
                  //                           context,
                  //                           index,
                  //                         ) {
                  //                           return
                  //                               //language_tile(controller.genre.value , index,controller.genre.value[index]!.genre,);
                  //
                  //                               Container(
                  //                                   height: 36.kh,
                  //                                   width: 130.kw,
                  //                                   padding: EdgeInsets.symmetric(
                  //                                       horizontal: 20.0,
                  //                                       vertical: 20),
                  //                                   //margin: EdgeInsets.only(bottom: 20.0),
                  //                                   decoration: BoxDecoration(
                  //                                     border: Border.all(
                  //                                       color: ColorUtil.k6,
                  //                                     ),
                  //                                     borderRadius:
                  //                                         BorderRadius.circular(
                  //                                             8.0),
                  //                                     color: Colors.white,
                  //                                   ),
                  //                                   child: Text(
                  //                                     "Option ${index}"
                  //                                         .toUpperCase(),
                  //                                     style: TextStyle(
                  //                                         fontSize: 12.kw,
                  //                                         fontWeight:
                  //                                             FontWeight.normal,
                  //                                         color: Colors.black),
                  //                                   ));
                  //                         },
                  //                       ),
                  //                       SizedBox(
                  //                         height: 16.kh,
                  //                       ),
                  //                       Text(
                  //                         "Categories",
                  //                         style: TextStyleUtil.k14(),
                  //                       ),
                  //                       SizedBox(
                  //                         height: 12.kh,
                  //                       ),
                  //                       GridView.builder(
                  //                         shrinkWrap: true,
                  //                         itemCount: 2,
                  //                         gridDelegate:
                  //                             SliverGridDelegateWithFixedCrossAxisCount(
                  //                           crossAxisCount: 3,
                  //                           crossAxisSpacing: 7,
                  //                           mainAxisSpacing: 7,
                  //                           childAspectRatio:
                  //                               MediaQuery.of(context)
                  //                                       .size
                  //                                       .width /
                  //                                   (MediaQuery.of(context)
                  //                                           .size
                  //                                           .height /
                  //                                       4.3),
                  //                         ),
                  //                         itemBuilder: (
                  //                           context,
                  //                           index,
                  //                         ) {
                  //                           return
                  //                               //language_tile(controller.genre.value , index,controller.genre.value[index]!.genre,);
                  //
                  //                               Container(
                  //                                   height: 36.kh,
                  //                                   width: 130.kw,
                  //                                   padding: EdgeInsets.symmetric(
                  //                                       horizontal: 20.0,
                  //                                       vertical: 20),
                  //                                   //margin: EdgeInsets.only(bottom: 20.0),
                  //                                   decoration: BoxDecoration(
                  //                                     border: Border.all(
                  //                                       color: ColorUtil.k6,
                  //                                     ),
                  //                                     borderRadius:
                  //                                         BorderRadius.circular(
                  //                                             8.0),
                  //                                     color: Colors.white,
                  //                                   ),
                  //                                   child: Text(
                  //                                     "Option ${index}"
                  //                                         .toUpperCase(),
                  //                                     style: TextStyle(
                  //                                         fontSize: 12.kw,
                  //                                         fontWeight:
                  //                                             FontWeight.normal,
                  //                                         color: Colors.black),
                  //                                   ));
                  //                         },
                  //                       ),
                  //                       SizedBox(
                  //                         height: 16.kh,
                  //                       ),
                  //                       Text(
                  //                         "File Type",
                  //                         style: TextStyleUtil.k14(),
                  //                       ),
                  //                       SizedBox(
                  //                         height: 12.kh,
                  //                       ),
                  //                       GridView.builder(
                  //                         shrinkWrap: true,
                  //                         itemCount: 2,
                  //                         gridDelegate:
                  //                             SliverGridDelegateWithFixedCrossAxisCount(
                  //                           crossAxisCount: 3,
                  //                           crossAxisSpacing: 7,
                  //                           mainAxisSpacing: 7,
                  //                           childAspectRatio:
                  //                               MediaQuery.of(context)
                  //                                       .size
                  //                                       .width /
                  //                                   (MediaQuery.of(context)
                  //                                           .size
                  //                                           .height /
                  //                                       4.3),
                  //                         ),
                  //                         itemBuilder: (
                  //                           context,
                  //                           index,
                  //                         ) {
                  //                           return
                  //                               //language_tile(controller.genre.value , index,controller.genre.value[index]!.genre,);
                  //
                  //                               Container(
                  //                                   height: 36.kh,
                  //                                   width: 130.kw,
                  //                                   padding: EdgeInsets.symmetric(
                  //                                       horizontal: 20.0,
                  //                                       vertical: 20),
                  //                                   //margin: EdgeInsets.only(bottom: 20.0),
                  //                                   decoration: BoxDecoration(
                  //                                     border: Border.all(
                  //                                       color: ColorUtil.k6,
                  //                                     ),
                  //                                     borderRadius:
                  //                                         BorderRadius.circular(
                  //                                             8.0),
                  //                                     color: Colors.white,
                  //                                   ),
                  //                                   child: Text(
                  //                                     "Option ${index}"
                  //                                         .toUpperCase(),
                  //                                     style: TextStyle(
                  //                                         fontSize: 12.kw,
                  //                                         fontWeight:
                  //                                             FontWeight.normal,
                  //                                         color: Colors.black),
                  //                                   ));
                  //                         },
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //                 Container(
                  //                   height: 375.kh,
                  //                   width: double.infinity,
                  //                   child: Column(
                  //                     children: [
                  //                       Divider(
                  //                         thickness: 1.kh,
                  //                         color: ColorUtil.neutral2,
                  //                       ),
                  //                       Container(
                  //                         height: 44.kh,
                  //                         width: 164.kw,
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ));
                  //         },
                  //         child: Ink(
                  //           height: 44.kh,
                  //           width: 44.kw,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              SizedBox(
                height: 24.kh,
              ),
              Obx(
                () => Expanded(
                  child: controller.Loader.value == true
                      ? SizedBox()
                      :               (controller.nftData.value.nft?.length == null ||
                      controller.nftData.value.nft?.length == 0) ? Center(
                    child: Text("No Results Found"),
                  ) :GridView.builder(
                          itemCount:
                              (controller.nftData.value.nft?.length == null ||
                                      controller.nftData.value.nft?.length == 0)
                                  ? 0
                                  : controller.nftData.value.nft?.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 2.0,
                                  mainAxisSpacing: 10.0),
                          itemBuilder: (BuildContext context, int index) {
                            return NFTCoverSmall(
                              isBuy: true,
                              fontstyle: TextStyle(),
                              fontstyleSmall: TextStyle(),
                              Name:
                                  "${controller.nftData.value.nft?[index]?.title}",
                              Description:
                                  "${controller.nftData.value.nft?[index]?.collectionId?.user?.firstname}",
                              imgLink:
                                  "${controller.nftData.value.nft?[index]?.imageURL}",
                              OnTap: () {
                                Get.toNamed(Routes.NFT_DETAILS, arguments: [
                                  controller.nftData.value.nft?[index]?.Id
                                      .toString(),
                                  false,
                                ]);
                              },
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
//
// language_tile(List language_tile, int index,val) {
//   return GestureDetector(
//     onTap: () {
//       //print("${val}");
//       if(controller.selectedGeneregetedFromApi.value.contains(val)) {
//         if(!controller.selectedgenrelist.value.contains(val)){
//           controller.selectedlanguage_tiles.add(index);
//           controller.selectedgenrelist.add('"' + language_tile[index]!.genre.toString() +'"');
//           controller.selectedGeneregetedFromApi.value.remove(val);
//         }
//       }
//       if (controller.selectedlanguage_tiles.contains(index)) {
//         controller.selectedlanguage_tiles.remove(index);
//         controller.selectedgenrelist.remove('"' + language_tile[index]!.genre.toString() +'"');
//         print("what are non gen ${controller.selectedgenrelist}");
//       } else {
//         controller.selectedlanguage_tiles.add(index);
//         controller.selectedgenrelist.add('"' + language_tile[index]!.genre.toString() +'"');
//
//         print("what are gen ${controller.selectedgenrelist.value}");
//       }
//     },
//     // child: Obx(
//     //       () =>
//     //       Container(
//     //           padding: EdgeInsets.symmetric(horizontal: 20.0),
//     //           //margin: EdgeInsets.only(bottom: 20.0),
//     //           decoration: BoxDecoration(
//     //             border: Border.all(
//     //               color: controller.selectedlanguage_tiles.contains(index) || controller.selectedGeneregetedFromApi.value.contains(language_tile[index]?.genre)
//     //                   ? ColorUtil.kBlack
//     //                   : ColorUtil.k6,
//     //             ),
//     //             borderRadius: BorderRadius.circular(14.0),
//     //             color: controller.selectedlanguage_tiles.contains(index) || controller.selectedGeneregetedFromApi.value.contains(language_tile[index]?.genre)
//     //                 ? ColorUtil.accent4
//     //                 : Colors.transparent,
//     //           ),
//     //           child: Row(
//     //             children: [
//     //               Expanded(
//     //                 flex: 5,
//     //                 child: Text(
//     //                   "${language_tile[index]?.genre}"[0].toUpperCase() +
//     //                       "${language_tile[index]?.genre?.substring(1).toLowerCase()}",
//     //                   style: TextStyle(
//     //                       fontSize: 12.kw,
//     //                       fontWeight:
//     //                       controller.selectedlanguage_tiles.contains(index)  || controller.selectedGeneregetedFromApi.value.contains(language_tile[index]?.genre)
//     //                           ? FontWeight.bold
//     //                           : FontWeight.normal,
//     //                       color: controller.selectedlanguage_tiles.contains(index)  || controller.selectedGeneregetedFromApi.value.contains(language_tile[index]?.genre)
//     //                           ? Colors.white
//     //                           : Colors.black),
//     //                 ),
//     //               ),
//     //               // Expanded(
//     //               //   child: SvgPicture.asset(
//     //               //
//     //               //       'assets/SVG/Approved Icon.svg',
//     //               //   // height: 16.kh,
//     //               //   //   width: 16.kw,
//     //               //   ),
//     //               // ),
//     //             ],
//     //           )),
//     // ),
//   );
// }
}
