import 'package:cyney/data/models/movie_review_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MovieReview extends Equatable {
  final int id;
  final int page;
  final List<ReviewsModel> results;
  final int totalPages;
  final int totalResults;

  MovieReview({
    @required this.id,
    @required this.page,
    @required this.results,
    @required this.totalPages,
    @required this.totalResults,
  });

  @override
  List<Object> get props {
    return [
      id,
      page,
      results,
      totalPages,
      totalResults,
    ];
  }

  @override
  bool get stringify => true;
}

class Reviews extends Equatable {
  final String author;
  final AuthorDetailsModel authorDetails;
  final String content;
  final String createdAt;
  final String id;
  final String updatedAt;
  final String url;

  Reviews({
    @required this.author,
    @required this.authorDetails,
    @required this.content,
    @required this.createdAt,
    @required this.id,
    @required this.updatedAt,
    @required this.url,
  });

  @override
  List<Object> get props {
    return [
      author,
      authorDetails,
      content,
      createdAt,
      id,
      updatedAt,
      url,
    ];
  }
}

class AuthorDetails extends Equatable {
  final String name;
  final String username;
  final String avatarPath;
  final dynamic rating;

  AuthorDetails({
    @required this.name,
    @required this.username,
    @required this.avatarPath,
    @required this.rating,
  });

  @override
  List<Object> get props => [name, username, avatarPath, rating];

  @override
  bool get stringify => true;
}
