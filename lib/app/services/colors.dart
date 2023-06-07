import 'package:flutter/material.dart';
import 'hexColorToFlutterColor.dart';

extension ColorUtil on BuildContext {
  Color dynamicColor({required int light, required int dark}) {
    return (Theme.of(this).brightness == Brightness.light)
        ? Color(light)
        : Color(dark);
  }

  Color dynamicColour({required Color light, required Color dark}) {
    return (Theme.of(this).brightness == Brightness.light) ? light : dark;
  }

  Color get brandColor1 =>
      dynamicColour(light: HexColor("#5D48D0"), dark: HexColor("#000000"));

  Color get brandColor2 =>
      dynamicColour(light: HexColor("#8032A8"), dark: HexColor("#000000"));

  static const Color kBlack = Color(0xff000000);
  static const Color kWhite = Color(0xffffffff);
  static const Color k1 = Color(0xfff2f7f8);
  static const Color k2 = Color(0xffd7e6ea);
  static const Color k3 = Color(0xff9fbec6);
  static const Color k4 = Color(0xff0a414e);
  static const Color k5 = Color(0xff08353f);
  static const Color k6 = Color(0xff06262d);
  static const Color k7 = Color(0xfffff7eb);

  static const Color neutral6 = Color(0xff212E31);
  static const Color neutral1 = Color(0xffF4F6F6);

  static const Color neutral2 = Color(0xffDDE2E3);
  static const Color neutral3 = Color(0xffABB7BA);

  static const Color neutral4 = Color(0xff516A70);
  static const Color green700 = Color(0xff089B6F);

  static const Color accent1 = Color(0xffFFF7EB);
  static const Color accent4 = Color(0xffFFA519);

  static const Color accent5 = Color(0xffE58C00);
  static const Color success = Color(0xff0B9943);

  static const Color danger4 = Color(0xffE5194C);
}
