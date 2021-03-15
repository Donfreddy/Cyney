import 'package:cyney/core/http/http_client.dart';
import 'package:cyney/data/models/movie_result_model.dart';
import 'package:cyney/domain/repositories/movie_repository.dart';
import 'package:meta/meta.dart';

abstract class MoviesRemoteDataSource {
  /// Calls the {BASE_URL}/movie/{cat}?page={pageIndex} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<MovieResultModel> getMovies(MovieCat type, int pageIndex);
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  HttpClient client;

  MoviesRemoteDataSourceImpl({@required this.client});

  @override
  Future<MovieResultModel> getMovies(MovieCat type, int pageIndex) async {
    String cat = "";

    switch (type) {
      case MovieCat.Popular:
        cat = "popular";
        break;
      case MovieCat.Upcoming:
        cat = "upcoming";
        break;
      case MovieCat.TopRated:
        cat = "top_rated";
        break;
      case MovieCat.NowPlaying:
        cat = "now_playing";
        break;
      default:
    }

    String url = '/movie/$cat?page=$pageIndex&';

    return MovieResultModel.fromJson(await client.get(url));
  }
}
