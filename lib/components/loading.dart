import 'package:assignment/common/app_export.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: SizedBox(
        height: size.height / 2,
        width: size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: CommonImageView(
                svgPath: ImageConstant.imgLocation,
                height: getVerticalSize(
                  50.00,
                ),
                width: getHorizontalSize(
                  100.00,
                ),
                additionalText: "Loading...",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
