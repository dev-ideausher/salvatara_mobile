

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/responsiveSize.dart';
import 'package:shimmer/shimmer.dart';

class CommonImageCircular extends StatelessWidget {
  final String ImageLink;
  final double ImageSize;
   CommonImageCircular({Key? key, required this.ImageLink, required this.ImageSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "${ImageLink}",
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: ImageSize,
        backgroundColor: ColorUtil.kWhite,
        backgroundImage: imageProvider,


      ),
      placeholder: (context, url) => Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!, child: CircleAvatar(
        radius: ImageSize,
      ),),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}


class CommonImage extends StatelessWidget {
  final String ImageLink;
  final double? height;
  final double? width;
  CommonImage({Key? key, required this.ImageLink, required this.height, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "${ImageLink}",
      imageBuilder: (context, imageProvider) =>
          Container(
            height: height ?? 300.kh,
            width: width ?? 240.kw,
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: ColorUtil.neutral2),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
            // radius: ImageSize,

        // backgroundColor: ColorUtil.kWhite,
        // backgroundImage: imageProvider,

      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
        height: height ?? 300.kh,
        width: width ?? 240.kw,


      ),),
      errorWidget: (context, url, error) => SizedBox(
          height: height ?? 300.kh,
          width: width ?? 240.kw,
          child: Icon(Icons.broken_image)),
    );
  }
}
