import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/responsiveSize.dart';

class snackBarClass{

  String? MessageText;

  snackBarClass(String MessageText){
    this.MessageText = MessageText;

  }


  late  SnackbarController snackBars =
  Get.rawSnackbar(

    padding: EdgeInsets.only(left: 0, right: 32, top: 16, bottom: 16),
    borderRadius: 16,
    snackPosition: SnackPosition.TOP,
    messageText: Text(
      "$MessageText",
      style: GoogleFonts.montserrat(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 16.kh,
      ),
    ),
    backgroundColor: ColorUtil.kWhite,
    icon: Icon(
      Icons.star,
      color: Colors.amber,
    ),
    margin: EdgeInsets.only(left: 8, right: 8, top: 16),
    boxShadows: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        offset: Offset(
          5.0,
          5.0,
        ),
        blurRadius: 10.0,
        spreadRadius: 2.0,
      ), //BoxShadow
      //BoxShadow
    ],
  );

  late  SnackbarController WarningSnackBar =
  Get.rawSnackbar(

    padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
    borderRadius: 8,
    snackPosition: SnackPosition.TOP,
    messageText: Text(
      "$MessageText",
      style: GoogleFonts.montserrat(
        color: Colors.grey,
        fontWeight: FontWeight.w500,
        fontSize: 14.kh,
      ),
    ),
    backgroundColor: ColorUtil.kWhite,
    icon:Padding(
      padding:  EdgeInsets.only(left: 16.0,right: 16),
      child: Icon(Icons.warning,color: Colors.amber,),
    ),
    margin: EdgeInsets.only(left: 16, right: 8, top: 16),
    boxShadows: [
      BoxShadow(
        color: Colors.amber.withOpacity(0.2),
        offset: Offset(
          5.0,
          5.0,
        ),
        blurRadius: 5.0,
        spreadRadius: 1.0,
      ), //BoxShadow
      //BoxShadow
    ],
    borderColor: Colors.amber.withOpacity(0.1)
  );


  late  SnackbarController SuccesSnackBar =
  Get.rawSnackbar(

      padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      borderRadius: 8,
      snackPosition:SnackPosition.TOP,
      messageText: Text(
        "$MessageText",
        style: GoogleFonts.montserrat(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 14.kh,
        ),
      ),
      backgroundColor: ColorUtil.kWhite,
      icon:Padding(
        padding:  EdgeInsets.only(left: 16.0,right: 16),
        child: Icon(Icons.check_circle_sharp,color: Colors.green,),
      ),
      margin: EdgeInsets.only(left: 16, right: 8, top: 16),
      boxShadows: [
        BoxShadow(
          color: Colors.green.withOpacity(0.2),
          offset: Offset(
            5.0,
            5.0,
          ),
          blurRadius: 5.0,
          spreadRadius: 1.0,
        ), //BoxShadow
        //BoxShadow
      ],
      borderColor: Colors.green.withOpacity(0.1)
  );

  late  SnackbarController ErrorSnackBar =
  Get.rawSnackbar(

      padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      borderRadius: 8,
      snackPosition:SnackPosition.TOP,
      messageText: Text(
        "$MessageText",
        style: GoogleFonts.montserrat(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 14.kh,
        ),
      ),
      backgroundColor: ColorUtil.kWhite,
      icon:Padding(
        padding:  EdgeInsets.only(left: 16.0,right: 16),
        child: Icon(Icons.error,color: Colors.red,),
      ),
      margin: EdgeInsets.only(left: 16, right: 8, top: 16),
      boxShadows: [
        BoxShadow(
          color: Colors.red.withOpacity(0.2),
          offset: Offset(
            5.0,
            5.0,
          ),
          blurRadius: 5.0,
          spreadRadius: 1.0,
        ), //BoxShadow
        //BoxShadow
      ],
      borderColor: Colors.red.withOpacity(0.1)
  );






  late  SnackbarController snackBarsWithoutIcon =
  Get.rawSnackbar(

    padding: EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 16),
    borderRadius: 16,
    snackPosition: SnackPosition.TOP,
    messageText: Text(
      "$MessageText",
      style: GoogleFonts.montserrat(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 14.kh,
      ),
    ),
    backgroundColor: ColorUtil.kWhite,

    margin: EdgeInsets.only(left: 8, right: 8, top: 16),
    boxShadows: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        offset: Offset(
          5.0,
          5.0,
        ),
        blurRadius: 10.0,
        spreadRadius: 2.0,
      ), //BoxShadow
      //BoxShadow
    ],
  );

}