import 'package:assignment/common/app_export.dart';
import 'package:assignment/models/genres/data/genre.dart';
import 'package:assignment/models/movies/data/movie.dart';
import 'package:flutter/material.dart';

class ListintouchablesItemWidget extends StatefulWidget {
  final Movie movie;
  final List<Genre> genres;

  const ListintouchablesItemWidget(
      {Key? key, required this.movie, required this.genres})
      : super(key: key);

  @override
  State<ListintouchablesItemWidget> createState() =>
      _ListintouchablesItemWidgetState();
}

class _ListintouchablesItemWidgetState
    extends State<ListintouchablesItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: getPadding(
          top: 10.0,
          left: 15,
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
              width: getHorizontalSize(200),
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
                      widget.movie.originalTitle ?? "N/A",
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            widget.movie.voteAverage != null
                                ? "${widget.movie.voteAverage!.toStringAsFixed(1)} / 10 IMDb"
                                : "N/A",
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
                  Padding(
                    padding: getPadding(top: 10),
                    child: Container(
                      width: getHorizontalSize(200),
                      child: Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (Genre genre in widget.genres)
                                Padding(
                                  padding: getPadding(right: 10, top: 10),
                                  child: Expanded(
                                    child: Text(
                                      genre.name,
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
                                ),
                            ]),
                      ),
                    ),
                  )
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
