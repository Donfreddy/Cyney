import 'package:cyney/core/error/custom_exception.dart';
import 'package:cyney/core/error/failure.dart';
import 'package:cyney/core/network/network_info.dart';
import 'package:cyney/data/datasources/movies_datasources/movies_local_data_source.dart';
import 'package:cyney/data/datasources/movies_datasources/movies_remote_data_source.dart';
import 'package:cyney/data/models/movie_result_model.dart';
import 'package:cyney/data/repository/movie_repository_impl.dart';
import 'package:cyney/domain/entities/movie_result.dart';
import 'package:cyney/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock implements MoviesRemoteDataSource {}

class MockLocalDataSource extends Mock implements MoviesLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MovieRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = MovieRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group(
    'getMovies',
    () {
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

      final MovieResult movieResultTest = movieResultModelTest;

      test('should check if the device is online', () {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        repository.getMovies(MovieCat.Popular, 1);
        // assert
        verify(mockNetworkInfo.isConnected);
      });

      runTestsOnline(() {
        test(
          'should return remote data when the call to remote data source is successful',
          () async {
            // arrange
            when(mockRemoteDataSource.getMovies(MovieCat.Popular, 1))
                .thenAnswer((_) async => movieResultModelTest);
            // act
            final result = await repository.getMovies(MovieCat.Popular, 1);
            // assert
            verify(mockRemoteDataSource.getMovies(MovieCat.Popular, 1));
            expect(result, equals(Right(movieResultTest)));
          },
        );

        test(
          'should cache the data locally when the call to remote data source is successful',
          () async {
            // arrange
            when(mockRemoteDataSource.getMovies(MovieCat.Popular, 1))
                .thenAnswer((_) async => movieResultModelTest);
            // act
            await repository.getMovies(MovieCat.Popular, 1);
            // assert
            verify(mockRemoteDataSource.getMovies(MovieCat.Popular, 1));
            verify(mockLocalDataSource.cacheMovies(movieResultTest));
          },
        );
        test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
            // arrange
            when(mockRemoteDataSource.getMovies(MovieCat.Popular, 1))
                .thenThrow(ServerException());
            // act
            final result = await repository.getMovies(MovieCat.Popular, 1);
            // assert
            verify(mockRemoteDataSource.getMovies(MovieCat.Popular, 1));
            verifyZeroInteractions(mockLocalDataSource);
            expect(result, equals(Left(ServerFailure())));
          },
        );
      });
      runTestsOffline(() {
        test(
          'should return last locally cached data when the cached data is present',
          () async {
            // arrange
            when(mockLocalDataSource.getLastMovies())
                .thenAnswer((_) async => movieResultModelTest);
            // act
            final result = await repository.getMovies(MovieCat.Popular, 1);
            // assert
            verifyZeroInteractions(mockRemoteDataSource);
            verify(mockLocalDataSource.getLastMovies());
            expect(result, equals(Right(movieResultTest)));
          },
        );

        test(
          'should return CacheFailure when there is no cached data present',
          () async {
            // arrange
            when(mockLocalDataSource.getLastMovies())
                .thenThrow(CacheException());
            // act
            final result = await repository.getMovies(MovieCat.Popular, 1);
            // assert
            verifyZeroInteractions(mockRemoteDataSource);
            verify(mockLocalDataSource.getLastMovies());
            expect(result, equals(Left(CacheFailure())));
          },
        );
      });
    },
  );
}
