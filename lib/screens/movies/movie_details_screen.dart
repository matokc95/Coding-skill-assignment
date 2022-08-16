import 'package:assignment/common/app_export.dart';
import 'package:assignment/common/custom_icon_button.dart';
import 'package:assignment/components/bottom_sheet/custom_bottom_sheet.dart';
import 'package:assignment/models/genres/data/genre.dart';
import 'package:assignment/models/movies/data/movie.dart';
import 'package:assignment/models/movies/data/movie_with_genres.dart';
import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatefulWidget {
  final MovieWithGenres movieWithGenres;

  const MovieDetailsScreen({Key? key, required this.movieWithGenres}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: Container(
        width: size.width,
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: getVerticalSize(
                    334.00,
                  ),
                  width: size.width,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: ClipRRect(
                          child: CommonImageView(
                            url: widget.movieWithGenres.movie!.backdropPath,
                            height: getVerticalSize(
                              280.00,
                            ),
                            width: getHorizontalSize(
                              375.00,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: getPadding(
                            left: 24,
                            top: 65,
                            right: 24,
                            bottom: 36,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CommonImageView(
                              svgPath: ImageConstant.imgArrowleft,
                              height: getVerticalSize(
                                8.00,
                              ),
                              width: getHorizontalSize(
                                16.00,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomBottomSheet(
                movie: widget.movieWithGenres.movie!,
                genres: widget.movieWithGenres.genres!,
                initialChildSize: 0.7,
                minChildSize: 0.5,
                maxChildSize: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
