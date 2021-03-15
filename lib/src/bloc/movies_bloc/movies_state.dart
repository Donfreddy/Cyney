import 'package:cyney/domain/entities/movie_result.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final MovieResult movieResult;

  const MoviesLoaded({@required this.movieResult})
      : assert(MovieResult != null);

  @override
  List<Object> get props => [movieResult];
}

class MoreMoviesLoaded extends MoviesState {
  final MovieResult movieResult;

  const MoreMoviesLoaded({@required this.movieResult})
      : assert(MovieResult != null);

  @override
  List<Object> get props => [movieResult];
}

class MovieDetailsLoaded extends MoviesState {
  // final MovieDetails movieDetails;
  // final VideoDetails videoDetails;
  // final MovieList similarMovies;
  // final Credit credit;

  // const MoreMoviesLoaded({@required this.movieResult})
  //     : assert(MovieResult != null);

  // @override
  // List<Object> get props => [movieResult];
}

class MoviesFailure extends MoviesState {
  final String message;

  MoviesFailure({@required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'Error { message: $message}';
}

// class Error extends MoviesState {
//   final String message;

//   Error({@required this.message});

//   @override
//   List<Object> get props => [message];

//   @override
//   String toString() => 'Error { message: $message}';
// }
