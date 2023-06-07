import 'package:flutter/material.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/responsiveSize.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.red;
  final Text title;
  final AppBar appBar;
  final List<Widget> widgets;
  final Function() ontap;
  final bool leading;


  /// you can add more fields that meet your needs

   BaseAppBar(
      {Key? key,
      required this.title,
      required this.appBar,
      required this.widgets,
      required this.ontap, required this.leading })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: title,
      centerTitle: true,
      leading:leading == false ? SizedBox(): Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: Stack(
          children: [
            Container(
              height: 50.kw,
              width: 50.kw,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ColorUtil.k2),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                  color: ColorUtil.neutral6,
                ),
              ),
            ),
            Material(
              shape: const CircleBorder(),
              color: Colors.transparent,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: ontap,
                child: Ink(
                  width: 48.kh,
                  height: 48.kh,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: ColorUtil.kWhite,
      actions: widgets,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
