import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cyney/core/error/failure.dart';
import 'package:cyney/data/repository/movie_repository_impl.dart';
import 'package:cyney/domain/entities/movie_result.dart';
import 'package:cyney/domain/usecases/get_movies_usecase.dart';
import 'package:cyney/src/bloc/movies_bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesUsecase getMoviesUsecase;
  MovieRepositoryImpl repository;

  MoviesBloc({@required GetMoviesUsecase movies})
      : assert(movies != null),
        getMoviesUsecase = movies,
        super(MoviesInitial());

  // for testing
  MoviesState get initialState => MoviesInitial();

  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    if (event is GetMoviesEvent) {
      final failureOrMovies = await getMoviesUsecase(
          Params(type: event.type, pageIndex: event.currentPageIndex));

      yield* _eitherLoadedOrErrorState(failureOrMovies);
    }
  }

  Stream<MoviesState> _eitherLoadedOrErrorState(
    Either<Failure, MovieResult> failureOrMovies,
  ) async* {
    yield failureOrMovies.fold(
      (failure) => MoviesFailure(message: _mapFailureToMessage(failure)),
      (movies) => MoviesLoaded(movieResult: movies),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
