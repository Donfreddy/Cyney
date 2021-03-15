import 'package:cyney/domain/entities/movie_result.dart';
import 'package:dartz/dartz.dart';
import 'package:cyney/core/error/failure.dart';

enum MovieCat { Popular, NowPlaying, Upcoming, TopRated, Similar, Search }

abstract class MovieRepository {
  Future<Either<Failure, MovieResult>> getMovies(MovieCat type, int pageIndex);
}
