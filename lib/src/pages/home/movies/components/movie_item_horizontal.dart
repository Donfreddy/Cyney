import 'package:cached_network_image/cached_network_image.dart';
import 'package:cyney/domain/entities/movie_result.dart';
import 'package:cyney/src/utils/app_color.dart';
import 'package:cyney/src/utils/constant.dart';
import 'package:cyney/src/utils/styles.dart' as style;
import 'package:easy_localization/easy_localization.dart';
//import 'package:easy_localization/easy_localization.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieItemHorizontal extends StatelessWidget {
  final Movie movie;

  const MovieItemHorizontal({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(style.Radius.s08),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black54,
        //     offset: Offset(0.0, 4.0),
        //     blurRadius: 6.0,
        //   ),
        // ],
      ),
      margin: EdgeInsets.all(4),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(style.Radius.s08),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: movie.posterPath != null
                    ? "${IMG_BASE_URL + movie.posterPath}"
                    : '',
                fit: BoxFit.cover,
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
            Container(
              margin: EdgeInsets.only(top: 6),
              decoration: BoxDecoration(
                color: red,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(2),
                  bottomRight: Radius.circular(2),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Text(
                  "${DateFormat.yMMM().format(DateTime.parse(movie.releaseDate))}",
                  style: TextStyle(
                    color: white,
                    fontSize: 5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Positioned(
            //   top: 4,
            //   right: 4,
            //   child: BouncingWidget(
            //     child: CircleAvatar(
            //       backgroundColor: white.withOpacity(0.4),
            //       radius: 8,
            //       child: Icon(
            //         EvaIcons.moreHorizotnal,
            //         color: black.withOpacity(0.4),
            //         size: 16,
            //       ),
            //     ),
            //     onPressed: () {},
            //   ),
            // ),
            Positioned(
              bottom: 4,
              right: 4,
              child: Icon(
                EvaIcons.star,
                color: yellow,
                size: 20,
              ),
            ),
            Positioned(
              bottom: 9,
              right: '${movie.voteAverage}'.contains('.1')
                  ? 10
                  : '${movie.voteAverage}'.contains('.')
                      ? 9
                      : 12,
              child: Text(
                '${movie.voteAverage}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: white,
                  fontSize: 5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
