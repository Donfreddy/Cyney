import 'package:cyney/domain/entities/movie_review.dart';
import 'package:meta/meta.dart';

class MovieReviewModel extends MovieReview {
  MovieReviewModel({
    @required int id,
    @required int page,
    @required List<ReviewsModel> results,
    @required int totalPages,
    @required int totalResults,
  }) : super(
          id: id,
          page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'page': page,
      'results': results.map((item) => item.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  factory MovieReviewModel.fromMap(Map<String, dynamic> json) {
    return MovieReviewModel(
      id: json['id'],
      page: json['page'],
      results: List<ReviewsModel>.from(
        json['results'].map((item) => ReviewsModel.fromJson(item)),
      ),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class ReviewsModel extends Reviews {
  ReviewsModel({
    @required String author,
    @required AuthorDetailsModel authorDetails,
    @required String content,
    @required String createdAt,
    @required String id,
    @required String updatedAt,
    @required String url,
  }) : super(
          author: author,
          authorDetails: authorDetails,
          content: content,
          createdAt: createdAt,
          id: id,
          updatedAt: updatedAt,
          url: url,
        );

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'author_details': authorDetails.toJson(),
      'content': content,
      'created_at': createdAt,
      'id': id,
      'updated_at': updatedAt,
      'url': url,
    };
  }

  factory ReviewsModel.fromJson(Map<String, dynamic> json) {
    return ReviewsModel(
      author: json['author'],
      authorDetails: AuthorDetailsModel.fromJson(json['author_details']),
      content: json['content'],
      createdAt: json['created_at'],
      id: json['id'],
      updatedAt: json['updated_at'],
      url: json['url'],
    );
  }
}

class AuthorDetailsModel extends AuthorDetails {
  AuthorDetailsModel({
    @required String name,
    @required String username,
    @required String avatarPath,
    @required dynamic rating,
  }) : super(
          name: name,
          username: username,
          avatarPath: avatarPath,
          rating: rating,
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'avatar_path': avatarPath,
      'rating': rating,
    };
  }

  factory AuthorDetailsModel.fromJson(Map<String, dynamic> json) {
    return AuthorDetailsModel(
      name: json['name'],
      username: json['username'],
      avatarPath: json['avatar_path'],
      rating: json['rating'],
    );
  }
}
