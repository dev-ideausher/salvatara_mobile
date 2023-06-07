import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/responsiveSize.dart';

class UploadDocButton extends StatelessWidget {
  final String text;
  final Function() ontap;
  final String url;

  UploadDocButton(
      {Key? key, required this.text, required this.ontap, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: DottedBorder(
        dashPattern: [9, 4],
        color: ColorUtil.k2,
        borderType: BorderType.RRect,
        radius: Radius.circular(8),
        // padding: EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: Container(
            height: 120.kh,
            width: 343.kw,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(
                  File("${url}"),

                ),
                fit: BoxFit.cover
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.kh,
                    width: 30.kw,
                    child: SvgPicture.asset("assets/SVG/uploadDoc.svg"),
                  ),
                  SizedBox(
                    height: 20.kh,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Upload file",
                        style: TextStyleUtil.k16(
                            color: ColorUtil.k6, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "(PNG, JPG, PDF)",
                        style: TextStyleUtil.k16(
                            color: ColorUtil.k4, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
