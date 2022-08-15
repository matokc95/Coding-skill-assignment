import 'package:assignment/common/app_export.dart';
import 'package:assignment/models/genres/data/genre.dart';
import 'package:assignment/models/movies/data/movie.dart';
import 'package:flutter/material.dart';

class MovieListItem extends StatefulWidget {
  final Movie movie;
  final List<Genre> genres;

  const MovieListItem({Key? key, required this.movie, required this.genres}) : super(key: key);

  @override
  State<MovieListItem> createState() => _MovieListItemState();
}

class _MovieListItemState extends State<MovieListItem> {
  late Movie movie;

  @override
  Widget build(BuildContext context) {
    movie = widget.movie;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: getPadding(
              left: 15,
              top: 19,
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
                  width: getHorizontalSize(200),
                  margin: getMargin(
                    top: 2,
                    bottom: 27,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(
                          right: 10,
                        ),
                        child: Text(
                          movie.originalTitle ?? "N/A",
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
                                movie.voteAverage != null
                                    ? "${movie.voteAverage!.toStringAsFixed(1)} / 10 IMDb"
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
                      Container(
                        margin: getMargin(
                          top: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (Genre genre in widget.genres)
                                Container(
                                  padding: getPadding(
                                    left: 15,
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
                                    genre.name,
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
        ),
      ],
    );
  }
}
