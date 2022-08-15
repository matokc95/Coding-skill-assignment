// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:assignment/common/app_export.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'color_constant.dart';

class CommonImageView extends StatelessWidget {
  ///[url] is required parameter for fetching network image
  String? url;
  String? imagePath;
  String? svgPath;
  File? file;
  double? height;
  double? width;
  Color? color;
  String? additionalText;
  final BoxFit fit;
  final String placeHolder;

  ///a [CommonNetworkImageView] it can be used for showing any network images
  /// it will shows the placeholder image if image is not found on network
  CommonImageView({
    this.url,
    this.imagePath,
    this.svgPath,
    this.file,
    this.height,
    this.width,
    this.color,
    this.additionalText,
    this.fit = BoxFit.fill,
    this.placeHolder = 'assets/images/image_not_found.png',
  });

  @override
  Widget build(BuildContext context) {
    return _buildImageView();
  }

  Widget _buildImageView() {
    if (svgPath != null && svgPath!.isNotEmpty) {
      return Container(
        height: height,
        width: width,
        child: Wrap(
          children: [
            Padding(
              padding: getPadding(bottom: 20),
              child: SvgPicture.asset(
                svgPath!,
                height: height,
                width: width,
                color: color,
                fit: fit,
              ),
            ),
            additionalText != null ?
            Expanded(
              child: Text(
                additionalText!,
                style: TextStyle(
                  color: ColorConstant.indigo50,
                  fontSize: getFontSize(
                    22,
                  ),
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w600,
                  height: 1.00,
                ),
              ),
            ) : Container()
          ],
        ),
      );
    } else if (file != null && file!.path.isNotEmpty) {
      return Image.file(
        file!,
        height: height,
        width: width,
        fit: fit,
      );
    } else if (url != null && url!.isNotEmpty) {
      return CachedNetworkImage(
        height: height,
        width: width,
        fit: fit,
        imageUrl: Constants.IMAGES_PATH + url!,
        placeholder: (context, url) => Container(
          height: 30,
          width: 30,
          child: LinearProgressIndicator(
            color: Colors.grey.shade200,
            backgroundColor: Colors.grey.shade100,
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(
          placeHolder,
          height: height,
          width: width,
          fit: fit,
        ),
      );
    } else if (imagePath != null && imagePath!.isNotEmpty) {
      return Image.asset(
        imagePath!,
        height: height,
        width: width,
        fit: fit,
      );
    }
    return SizedBox();
  }
}
