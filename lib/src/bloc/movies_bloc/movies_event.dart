import 'package:cyney/domain/repositories/movie_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class LoadingEvent extends MoviesEvent {
  @override
  List<Object> get props => [];
}

class GetLatestMovieEvent extends MoviesEvent {
  @override
  List<Object> get props => [];
}

class GetMoviesEvent extends MoviesEvent {
  final MovieCat type;
  final int currentPageIndex;

  const GetMoviesEvent({@required this.type, this.currentPageIndex})
      : assert(type != null),
        assert(currentPageIndex != null);

  @override
  List<Object> get props => [type, currentPageIndex];
}

class GetMoreMoviesEvent extends MoviesEvent {
  final MovieCat type;
  final currentPageIndex;

  const GetMoreMoviesEvent(
      {@required this.type, @required this.currentPageIndex})
      : assert(type != null),
        assert(currentPageIndex != null);

  @override
  List<Object> get props => [type, currentPageIndex];
}

class GetMovieDetailsEvent extends MoviesEvent {
  final int id;

  const GetMovieDetailsEvent({@required this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}

class GetMovieVideosEvent extends MoviesEvent {
  final int id;

  const GetMovieVideosEvent({@required this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}

class GetMovieReviewsEvent extends MoviesEvent {
  final int id;

  const GetMovieReviewsEvent({@required this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}

class GetMovieImagesEvent extends MoviesEvent {
  final int id;

  const GetMovieImagesEvent({@required this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}

class GetMovieCreditsEvent extends MoviesEvent {
  final int id;

  const GetMovieCreditsEvent({@required this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}

class GetMoviexternalIdsEvent extends MoviesEvent {
  final int id;

  const GetMoviexternalIdsEvent({@required this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}

//Todo: Implement get person

class GetPersonDeatailsEvent extends MoviesEvent {
  final int id;

  const GetPersonDeatailsEvent({@required this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}
