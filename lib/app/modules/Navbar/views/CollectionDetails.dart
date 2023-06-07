// import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:salvatara/app/modules/NFT/controllers/nft_controller.dart';
// import 'package:salvatara/app/modules/NFT/views/nft_view.dart';
// import 'package:salvatara/app/modules/Navbar/controllers/navbar_controller.dart';
// import 'package:salvatara/app/services/CustomButton.dart';
// import 'package:salvatara/app/services/TextStyleUtil.dart';
// import 'package:salvatara/app/services/colors.dart';
// import 'package:salvatara/app/services/make_input.dart';
// import 'package:salvatara/app/services/responsiveSize.dart';
//
// import '../../../routes/app_pages.dart';
// import '../../../services/storage.dart';
//
// class CollectionDetailPage extends GetView<NftController> {
//   const CollectionDetailPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 195.kh,
//                 child: Stack(
//                   children: [
//                     SizedBox(
//                       height: 160.kh,
//                       width: double.infinity,
//                       child: Image(
//                         image: NetworkImage(
//                           "${controller.collectionOneDetail.value.date?.cover}",
//                         ),
//                         fit: BoxFit.fitWidth,
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       left: 16,
//                       child: CircleAvatar(
//                         radius: 40.kh,
//                         backgroundImage: NetworkImage(
//                             "${controller.collectionOneDetail.value.date?.profile}"),
//                       ),
//                     ),
//                     Positioned(
//                       top: 14,
//                       left: 20,
//                       child: GestureDetector(
//                         onTap: () {
//                           Get.back();
//                         },
//                         child: Container(
//                           height: 45.kh,
//                           width: 45.kh,
//                           decoration: BoxDecoration(
//                             color: ColorUtil.kWhite,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Center(
//                             child: Icon(Icons.arrow_back),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "${controller.collectionOneDetail.value.date?.title}",
//                       style: TextStyleUtil.k24(),
//                     ),
//                     SizedBox(
//                       height: 12.kh,
//                     ),
//                     Text(
//                       "${controller.collectionOneDetail.value.date?.description}",
//                       style: TextStyleUtil.k14(fontWeight: FontWeight.normal),
//                     ),
//                     SizedBox(
//                       height: 24.kh,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         CollectionTile(
//                             Name: "Floor Price",
//                             Price:
//                                 "${controller.collectionOneDetail.value.date?.floorprice}",
//                         Currency: true,
//                         ),
//                         CollectionTile(
//                             Name: "Latest Price",
//                             Price:
//                                 "${controller.collectionOneDetail.value.date?.latestPrice}",
//                           Currency: true,
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 12.kh,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         CollectionTile(
//                             Name: "Total Volume",
//                             Price:
//                                 "${controller.collectionOneDetail.value.date?.volume}",
//                           Currency: true,),
//                         CollectionTile(
//                             Name: "Total Items",
//                             Price:
//                                 "${controller.collectionOneDetail.value.date?.noOfItems}",
//                           Currency: false,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   MakeInputCustomIcon(
//                     // controllerID:controller.searchQuery.value,
//                     hintText: "Search",
//                     label: "label",
//                     obscureText: false,
//                     width: 164.kh,
//                     prefixIcon: Icon(Icons.search),
//                     SuffixIcon: false,
//                     // onChanged: (String value)  =>
//                     //     controller.getCoinDetails()
//                     // },
//                   ),
//                   SizedBox(
//                     width: 164.kw,
//                     height: 44.kh,
//                     child: DropdownButtonFormField2(
//                       decoration: InputDecoration(
//                         //Add isDense true and zero Padding.
//                         //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
//                         isDense: true,
//                         contentPadding: EdgeInsets.zero,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         //Add more decoration as you want here
//                         //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
//                       ),
//                       hint: Text(
//                         'Recent',
//                         style: TextStyleUtil.k16(),
//                       ),
//                       icon: const Icon(
//                         Icons.arrow_drop_down,
//                         color: Colors.black45,
//                       ),
//                       iconSize: 30,
//                       buttonHeight: 60,
//                       buttonPadding: const EdgeInsets.only(left: 20, right: 10),
//                       dropdownDecoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       items: controller.genderItems
//                           .map((item) => DropdownMenuItem<String>(
//                                 value: item,
//                                 child: Text(
//                                   item,
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ))
//                           .toList(),
//                       validator: (value) {
//                         if (value == null) {
//                           return 'Please select gender.';
//                         }
//                       },
//                       onChanged: (value) {
//                         //Do something when changing the item if you want.
//                       },
//                       onSaved: (value) {
//                         controller.selectedValue = value.toString();
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CollectionTile extends StatelessWidget {
//   final String Name;
//   final String Price;
//   final bool Currency;
//
//   CollectionTile(
//       {Key? key,
//       required this.Name,
//       required this.Price,
//       required this.Currency})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 66.kh,
//       width: 165.kw,
//       decoration: BoxDecoration(
//           border: Border.all(color: ColorUtil.neutral2),
//           borderRadius: BorderRadius.all(Radius.circular(4))),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "${Name}",
//             style: TextStyleUtil.k12(
//               fontWeight: FontWeight.normal,
//               color: ColorUtil.neutral4,
//             ),
//           ),
//           SizedBox(
//             height: 6.kh,
//           ),
//           Currency == true
//               ? Text(
//                   "${Price} USD",
//                   style: TextStyleUtil.k14(color: ColorUtil.neutral6),
//                 )
//               : Text(
//                   "${Price}",
//                   style: TextStyleUtil.k14(color: ColorUtil.neutral6),
//                 ),
//         ],
//       ),
//     );
//   }
// }
