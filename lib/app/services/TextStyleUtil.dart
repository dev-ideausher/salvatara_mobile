import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'responsiveSize.dart';

class TextStyleUtil {
  final Color color;
  final double fontsize;
  final FontWeight fontWeight;

  TextStyleUtil({
    this.color = Colors.white,
    this.fontsize = 24,
    this.fontWeight = FontWeight.w600,
  });

  static TextStyle textNimbusSanLStyleS14Wregular({
    //NimbusSanL
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(

        color: color,
        fontSize: 14.kh,
        fontWeight: fontWeight,

    );
  }




  static k32({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 32.kh,
      decoration: textDecoration,
      letterSpacing: 0,

    );
  }

  static k32Poppin({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return  GoogleFonts.nunito(
        fontWeight: fontWeight,
        color: color,
        fontStyle: FontStyle.normal,
        fontSize: 25.kh,
        decoration: textDecoration,
        letterSpacing: 0,

    );
  }

  static k20Poppin({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return  GoogleFonts.nunito(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 14.kh,
      decoration: textDecoration,


    );
  }

  static k28({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 28.kh,
      decoration: textDecoration,
      letterSpacing: 0,
    );
  }

  static k24({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontFamily: 'BlackEcho',
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 24.kh,
      decoration: textDecoration,
      letterSpacing: 0,
    );
  }

  static k40splash({
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontFamily: 'BlackEcho',
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 40.kh,
      decoration: textDecoration,
      letterSpacing: 0,
    );
  }

  static k20({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontFamily: 'BlackEcho',
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 20.kh,
      decoration: textDecoration,
      letterSpacing: 0,
    );
  }

  static k18({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 18.kh,
      decoration: textDecoration,
      letterSpacing: 0,
    );
  }

  static k16({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return TextStyle(

      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 16.kh,
      decoration: textDecoration,
      letterSpacing: 0,

    );
  }

  static k14({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 14.kh,
      decoration: textDecoration,
      letterSpacing: 0,
    );
  }

  static k12({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 12.kh,
      decoration: textDecoration,
      letterSpacing: 0,
    );
  }

  static k18w400({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 18.kh,
      decoration: textDecoration,
      letterSpacing: 0,
    );
  }

  static k16w400({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 16.kh,
      decoration: textDecoration,
      letterSpacing: 0,
    );
  }

  static k14w400({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 14.kh,
      decoration: textDecoration,
      letterSpacing: 0,
    );
  }

  static k12w400({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 12.kh,
      decoration: textDecoration,
      letterSpacing: 0,
    );
  }

}


