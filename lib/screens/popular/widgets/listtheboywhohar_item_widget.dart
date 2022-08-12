import 'package:assignment/common/app_export.dart';
import 'package:assignment/common/custom_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListtheboywhoharItemWidget extends StatelessWidget {
  ListtheboywhoharItemWidget();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: getPadding(
          top: 10.0,
          bottom: 10.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  2.00,
                ),
              ),
              child: CommonImageView(
                imagePath: ImageConstant.imgImage100X100,
                height: getSize(
                  100.00,
                ),
                width: getSize(
                  100.00,
                ),
              ),
            ),
            Container(
              margin: getMargin(
                left: 16,
                top: 4,
                bottom: 7,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: getHorizontalSize(
                        162.00,
                      ),
                      child: Text(
                        "The Boy Who Harnessed the Wind",
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ColorConstant.indigo50,
                          fontSize: getFontSize(
                            15,
                          ),
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                          height: 1.33,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 1,
                      top: 10,
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: getPadding(
                            bottom: 1,
                          ),
                          child: CommonImageView(
                            svgPath: ImageConstant.imgVector,
                            height: getVerticalSize(
                              12.00,
                            ),
                            width: getHorizontalSize(
                              13.00,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 5,
                            top: 2,
                          ),
                          child: Text(
                            "7.6 / 10 IMDb",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.indigo50,
                              fontSize: getFontSize(
                                12,
                              ),
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w400,
                              height: 1.00,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    width: 50,
                    text: "Drama",
                    margin: getMargin(
                      top: 12,
                      right: 10,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 37,
                top: 3,
                bottom: 79,
              ),
              child: CommonImageView(
                svgPath: ImageConstant.imgBookmark18X14,
                height: getVerticalSize(
                  18.00,
                ),
                width: getHorizontalSize(
                  14.00,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
