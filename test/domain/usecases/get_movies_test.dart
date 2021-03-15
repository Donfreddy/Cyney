
import 'package:cyney/data/models/movie_result_model.dart';
import 'package:cyney/domain/entities/movie_result.dart';
import 'package:cyney/domain/repositories/movie_repository.dart';
import 'package:cyney/domain/usecases/get_movies_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  GetMoviesUsecase usecase;

  MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetMoviesUsecase(mockMovieRepository);
  });

  final typeTest = MovieCat.Popular;
  final pageTest = 1;
  final movieResultTest = MovieResult(
      page: 1,
      results: [
        MovieModel(
          id: 587807,
          backdropPath: '/fev8UFNFFYsD5q7AcYS8LyTzqwl.jpg',
          originalLanguage: 'en',
          originalTitle: 'Tom & Jerry',
          posterPath: '/6KErczPBROQty7QoIsaa6wJYXZi.jpg',
          title: 'Tom & Jerry',
          voteAverage: 7.9,
          voteCount: 606,
          overview: 'Tom the cat and Jerry the mouse get kicked...',
          releaseDate: '2021-02-11',
          popularity: 4502.599,
        )
      ],
      totalPages: 100,
      totalResults: 200);

  test('should get movies from the repository', () async {
    when(mockMovieRepository.getMovies(any, any))
        .thenAnswer((_) async => Right(movieResultTest));

    final result = await usecase(Params(type: typeTest, pageIndex: pageTest));

    expect(result, Right(movieResultTest));
    verify(mockMovieRepository.getMovies(typeTest, pageTest));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
