import 'package:assignment/common/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListintouchablesItemWidget extends StatelessWidget {
  ListintouchablesItemWidget();

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
                imagePath: ImageConstant.imgImage1,
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
                top: 2,
                bottom: 27,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(
                      right: 10,
                    ),
                    child: Text(
                      "Intouchables",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ColorConstant.indigo50,
                        fontSize: getFontSize(
                          15,
                        ),
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                        height: 1.00,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 1,
                      top: 8,
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
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
                            "8.5 / 10 IMDb",
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
                  Container(
                    width: getHorizontalSize(
                      186.00,
                    ),
                    margin: getMargin(
                      top: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          padding: getPadding(
                            left: 8,
                            top: 4,
                            right: 8,
                            bottom: 4,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.orangeA20033,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                4.00,
                              ),
                            ),
                          ),
                          child: Text(
                            "Biography",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.indigo50,
                              fontSize: getFontSize(
                                11,
                              ),
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w400,
                              height: 1.00,
                            ),
                          ),
                        ),
                        Container(
                          padding: getPadding(
                            left: 8,
                            top: 4,
                            right: 8,
                            bottom: 4,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.orangeA20033,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                4.00,
                              ),
                            ),
                          ),
                          child: Text(
                            "Comedy",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.indigo50,
                              fontSize: getFontSize(
                                11,
                              ),
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w400,
                              height: 1.00,
                            ),
                          ),
                        ),
                        Container(
                          padding: getPadding(
                            left: 8,
                            top: 4,
                            right: 8,
                            bottom: 4,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.orangeA20033,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                4.00,
                              ),
                            ),
                          ),
                          child: Text(
                            "Drama",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.indigo50,
                              fontSize: getFontSize(
                                11,
                              ),
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w400,
                              height: 1.00,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 14,
                top: 2,
                bottom: 79,
              ),
              child: CommonImageView(
                svgPath: ImageConstant.imgBookmark,
                height: getVerticalSize(
                  18.00,
                ),
                width: getHorizontalSize(
                  17.00,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
