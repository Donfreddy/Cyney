import 'package:cyney/domain/entities/movie_result.dart';
import 'package:meta/meta.dart';

class MovieResultModel extends MovieResult {
  MovieResultModel({
    @required int page,
    @required List<MovieModel> results,
    @required int totalPages,
    @required int totalResults,
  }) : super(
          page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  static MovieResultModel fromJson(dynamic json) {
    List<dynamic> resultsLists = json['results'];

    return MovieResultModel(
      page: json['page'] as int,
      results: resultsLists.map((m) => MovieModel.fromJson(m)).toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((m) => m.toJson()).toList(),
      'totalPages': totalPages,
      'totalResults': totalResults,
    };
  }
}

class MovieModel extends Movie {
  MovieModel({
    @required int id,
    @required String backdropPath,
    @required String originalLanguage,
    @required String originalTitle,
    @required String posterPath,
    @required String title,
    @required dynamic voteAverage,
    @required int voteCount,
    @required String overview,
    @required String releaseDate,
    @required dynamic popularity,
  }) : super(
          id: id,
          backdropPath: backdropPath,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          posterPath: posterPath,
          title: title,
          voteAverage: voteAverage,
          voteCount: voteCount,
          overview: overview,
          releaseDate: releaseDate,
          popularity: popularity,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] as int,
      backdropPath: json['backdrop_path'] as String,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      posterPath: json['poster_path'] as String,
      title: json['title'] as String,
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      overview: json['overview'] as String,
      releaseDate: json['release_date'] as String,
      popularity: json['popularity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'backdropPath': backdropPath,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'posterPath': posterPath,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
      'overview': overview,
      'releaseDate': releaseDate,
      'popularity': popularity,
    };
  }
}
