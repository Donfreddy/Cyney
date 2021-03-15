import 'dart:convert';

import 'package:cyney/core/error/custom_exception.dart';
import 'package:cyney/core/http/http_client.dart';
import 'package:cyney/data/datasources/movies_datasources/movies_remote_data_source.dart';
import 'package:cyney/data/models/movie_result_model.dart';
import 'package:cyney/domain/repositories/movie_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  MoviesRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();

    dataSource = MoviesRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any)).thenAnswer(
      (_) async => http.Response('movies.json', 200),
    );
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any)).thenAnswer(
      (_) async => http.Response('Something went wrong', 404),
    );
  }

  final tMovieResultModel =
      MovieResultModel.fromJson(json.decode('movies.json'));

  test(
    'should preform a GET request on a URL',
    () {
      //arrange
      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => http.Response('movies.json', 200),
      );
      // act
      dataSource.getMovies(MovieCat.Popular, 1);
      // assert
      verify(mockHttpClient.get('/movie/popular?page=1&'));
    },
  );

  test(
    'should return movies when the response code is 200 (success)',
    () async {
      // arrange
      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => http.Response('movies.json', 200),
      );
      // act
      final result = await dataSource.getMovies(MovieCat.Popular, 1);
      // assert
      expect(result, equals(tMovieResultModel));
    },
  );

  test(
    'should throw a ServerException when the response code is 404 or other',
    () async {
      // arrange
      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => http.Response('Something went wrong', 404),
      );
      // act
      final call = dataSource.getMovies;
      // assert
      expect(() => call(MovieCat.Popular, 1),
          throwsA(TypeMatcher<ServerException>()));
    },
  );
}
