import 'dart:convert';

import 'package:cyney/data/models/movie_result_model.dart';
import 'package:cyney/domain/entities/movie_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final jsonResponse = '';
  final movieResultModelTest = MovieResultModel(
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
    totalResults: 200,
  );

  test('Should be a subclass of MovieResult entity', () async {
    // assert
    expect(movieResultModelTest, isA<MovieResult>());
  });

  group('fromJson', () {
    test(
      'should return a valid model from Json',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(jsonResponse);
        // act
        final result = MovieResultModel.fromJson(jsonMap);
        // assert
        expect(result, movieResultModelTest);
      },
    );
  });
}
