
import 'package:assignment/common/app_export.dart';
import 'package:assignment/common/custom_button.dart';
import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        appBar: AppBar(
          backgroundColor: ColorConstant.gray900,
          title: Padding(
            padding: getPadding(
              top: 29,
              right: 23,
            ),
            child: CommonImageView(
              svgPath: ImageConstant.imgLocation24X24,
              height: getSize(
                24.00,
              ),
              width: getSize(
                24.00,
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                      left: 15,
                      right: 20,
                      bottom: 10
                  ),
                  child: Text(
                    "Favourites",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
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
                ),
              ],
            ),
          ),
        ),
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        left: 20,
                        top: 22,
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              imagePath: ImageConstant.imgImage,
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
                                    "Green Book",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                          "8.2 / 10 IMDb",
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        left: 20,
                        top: 20,
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        left: 20,
                        top: 20,
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
