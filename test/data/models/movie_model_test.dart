
import 'package:cyney/data/models/movie_result_model.dart';
import 'package:cyney/domain/entities/movie_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final movieModelTest = MovieModel(
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
  );

  test('Should be a subclass of Movie entity', () async {
    // assert
    expect(movieModelTest, isA<Movie>());
  });
}
