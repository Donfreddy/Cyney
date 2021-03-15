import 'package:cyney/core/usecase/usecase.dart';
import 'package:cyney/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:cyney/core/error/failure.dart';
import 'package:cyney/domain/entities/movie_result.dart';

class GetMoviesUsecase extends UseCase<MovieResult, Params> {
  final MovieRepository repository;

  GetMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, MovieResult>> call(Params params) async {
    return await repository.getMovies(params.type, params.pageIndex);
  }
}

class Params extends Equatable {
  final MovieCat type;
  final int pageIndex;

  Params({@required this.type, @required this.pageIndex});

  @override
  List<Object> get props => [type, pageIndex];
}
