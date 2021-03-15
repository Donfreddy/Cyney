import 'package:cyney/core/error/custom_exception.dart';
import 'package:cyney/core/network/network_info.dart';
import 'package:cyney/data/datasources/movies_datasources/movies_local_data_source.dart';
import 'package:cyney/data/datasources/movies_datasources/movies_remote_data_source.dart';
import 'package:cyney/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:cyney/domain/entities/movie_result.dart';
import 'package:cyney/core/error/failure.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MoviesRemoteDataSource remoteDataSource;
  final MoviesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  MovieRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, MovieResult>> getMovies(
      MovieCat type, int pageIndex) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMovie = await remoteDataSource.getMovies(type, pageIndex);
        localDataSource.cacheMovies(remoteMovie);
        return Right(remoteMovie);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localMovie = await localDataSource.getLastMovies();
        return Right(localMovie);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
