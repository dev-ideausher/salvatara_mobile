import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salvatara/app/modules/CoinDetails/controllers/coin_details_controller.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:salvatara/app/widgets/BaseAppBar.dart';

class AllNews extends GetView<CoinDetailsController> {
  const AllNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: BaseAppBar(
        title: Text(
          "All News",
          style: TextStyleUtil.k24(),
        ),
        appBar: AppBar(

        ),
        widgets: [

        ],
        ontap: () {
          Get.back();
        },
        leading: true,
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: controller.coinnews.value.data?.length,
               
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: ()async{
                    await controller.launchInBrowser("${controller.coinnews.value.data?[index]?.url}");

                  },
                  child: Padding(
                    padding:  EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          height: 74.kh,
                          width: 92.kw,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "${controller.coinnews.value.data?[index]?.urlToImage}"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(width: 30.kw,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.coinnews.value.data?[index]?.publishedAt.toString()}",
                              style: TextStyleUtil.k14(
                                fontWeight: FontWeight.normal,
                                color: ColorUtil.neutral4
                              ),
                            ),
                            SizedBox(
                              height: 70.kh,
                              width: 200.kw,
                              child: Text(
                                "${controller.coinnews.value.data?[index]?.title}",
                                style: TextStyleUtil.k18(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],),
    );
  }
}
