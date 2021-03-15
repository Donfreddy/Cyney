import 'dart:convert';

import 'package:cyney/core/error/custom_exception.dart';
import 'package:cyney/data/datasources/movies_datasources/movies_local_data_source.dart';
import 'package:cyney/data/models/movie_result_model.dart';
import 'package:matcher/matcher.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  MoviesLocalDataSourceImpl dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = MoviesLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
  });

  group('getLastNumberTrivia', () {
    final movieResultModel = MovieResultModel.fromJson(json.decode(''));

    test(
      'should return NumberTrivia from SharedPreferences when there is one in the cache',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn('');
        // act
        final result = await dataSource.getLastMovies();
        // assert
        verify(mockSharedPreferences.getString('CACHED_NUMBER_TRIVIA'));
        expect(result, equals(movieResultModel));
      },
    );

    test('should throw a CacheException when there is not a cached value', () {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      // act
      // Not calling the method here, just storing it inside a call variable
      final call = dataSource.getLastMovies;
      // assert
      // Calling the method happens from a higher-order function passed.
      // This is needed to test if calling a method throws an exception.
      // ignore: deprecated_member_use
      expect(() => call(), throwsA(TypeMatcher<CacheException>()));
    });

    group('cacheNumberTrivia', () {
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

      test('should call SharedPreferences to cache the data', () {
        // act
        dataSource.cacheMovies(movieResultModelTest);
        // assert
        // final expectedJsonString = json.encode(movieResultModelTest.toJson());
        verify(mockSharedPreferences.setString(CACHED_MOVIES, ''
            // expectedJsonString,
            ));
      });
    });
  });
}
