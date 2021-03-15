import 'package:cyney/data/models/movie_result_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MovieResult extends Equatable {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  MovieResult({this.page, this.results, this.totalPages, this.totalResults});

  @override
  List<Object> get props => [page, results, totalPages, totalResults];

  @override
  bool get stringify => true;
}

class Movie extends Equatable {
  final int id;
  final String backdropPath;
  final String originalLanguage;
  final String originalTitle;
  final String posterPath;
  final String title;
  final dynamic voteAverage;
  final int voteCount;
  final String overview;
  final String releaseDate;
  final dynamic popularity;

  Movie(
      {@required this.backdropPath,
      @required this.originalLanguage,
      @required this.originalTitle,
      @required this.posterPath,
      @required this.title,
      @required this.voteAverage,
      @required this.voteCount,
      @required this.overview,
      @required this.releaseDate,
      @required this.id,
      @required this.popularity});

  @override
  List<Object> get props {
    return [
      id,
      backdropPath,
      originalLanguage,
      originalTitle,
      posterPath,
      title,
      voteAverage,
      voteCount,
      overview,
      releaseDate,
      popularity,
    ];
  }

  @override
  bool get stringify => true;
}
