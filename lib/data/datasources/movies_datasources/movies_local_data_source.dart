import 'dart:convert';

import 'package:cyney/core/error/custom_exception.dart';
import 'package:cyney/data/models/movie_result_model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHED_MOVIES = 'CACHED_MOVIES';

abstract class MoviesLocalDataSource {
  /// Gets the cached [MovieResultModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<MovieResultModel> getLastMovies();

  Future<void> cacheMovies(MovieResultModel movieResultModel);
}

class MoviesLocalDataSourceImpl extends MoviesLocalDataSource {
  final SharedPreferences sharedPreferences;

  MoviesLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<MovieResultModel> getLastMovies() {
    final jsonString = sharedPreferences.getString(CACHED_MOVIES);
    if (jsonString != null) {
      return Future.value(MovieResultModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheMovies(MovieResultModel movieResulToCache) {
    return sharedPreferences.setString(
      CACHED_MOVIES,
      json.encode(movieResulToCache.toJson()),
    );
  }
}
