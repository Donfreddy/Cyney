import 'package:cached_network_image/cached_network_image.dart';
import 'package:cyney/domain/entities/movie_result.dart';
import 'package:cyney/src/utils/app_color.dart';
import 'package:cyney/src/utils/constant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:cyney/src/utils/styles.dart' as style;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';

class MovieItemVertical extends StatelessWidget {
  final Movie movie;

  const MovieItemVertical({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(style.Radius.s08),
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.1),
              blurRadius: 8.0,
              offset: Offset(0.0, 3.0),
            )
          ]),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: InkWell(
        onTap: () {},
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(style.Radius.s08),
                  child: CachedNetworkImage(
                    imageUrl: movie.posterPath != null
                        ? "${IMG_BASE_URL + movie.posterPath}"
                        : "assets/images/no-image.jpg",
                    fit: BoxFit.cover,
                    height: 130,
                    placeholder: (context, url) => Center(
                        child: Shimmer.fromColors(
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                      child: Container(
                        color: Colors.grey,
                        width: 100,
                        height: MediaQuery.of(context).size.height,
                      ),
                    )),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              flex: 7,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5) +
                    EdgeInsets.only(right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title != null
                          ? "${movie.title}"
                          : "${movie.originalTitle}",
                      style: TextStyle(
                        height: 1,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textHeightBehavior: TextHeightBehavior(),
                      softWrap: true,
                      maxLines: 1,
                    ),
                    SizedBox(height: 2),
                    Text(
                      "${DateFormat.yMMMMd().format(DateTime.parse(movie.releaseDate))}",
                      style: TextStyle(
                        color: gray,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: movie.voteAverage / 2,
                          minRating: 1,
                          itemSize: 16,
                          ignoreGestures: true,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => Icon(
                            EvaIcons.star,
                            color: yellow,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2, left: 8),
                          child: Text(
                            "${movie.voteAverage} ",
                            style: TextStyle(
                              color: yellow,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      movie.overview,
                      style: TextStyle(
                        color: gray,
                        fontSize: 11.0,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
