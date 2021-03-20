import 'package:meta/meta.dart';
import 'package:cyney/domain/entities/image.dart';

class MovieImageModel extends MovieImage {
  MovieImageModel({
    @required int id,
    @required List<BackdropsModel> backdrops,
    @required List<PostersModel> posters,
  }) : super(id: id, backdrops: backdrops, posters: posters);

  factory MovieImageModel.fromMap(Map<String, dynamic> json) {
    List<dynamic> backdropsLists = json['backdrops'];
    List<dynamic> postersLists = json['posters'];

    return MovieImageModel(
      id: json['id'],
      backdrops: backdropsLists.map((x) => BackdropsModel.fromJson(x)).toList(),
      posters: postersLists.map((x) => PostersModel.fromJson(x)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'backdrops': backdrops.map((x) => x.toJson()).toList(),
      'posters': posters.map((x) => x.toJson()).toList(),
    };
  }
}

class BackdropsModel extends Backdrops {
  BackdropsModel({
    @required dynamic aspectRatio,
    @required String filePath,
    @required double height,
    @required String iso6391,
    @required dynamic voteAverage,
    @required int voteCount,
    @required double width,
  }) : super(
          aspectRatio: aspectRatio,
          filePath: filePath,
          height: height,
          iso6391: iso6391,
          voteAverage: voteAverage,
          voteCount: voteCount,
          width: width,
        );

  factory BackdropsModel.fromJson(Map<String, dynamic> json) {
    return BackdropsModel(
      aspectRatio: json['aspect_ratio'],
      filePath: json['file_path'],
      height: json['height'],
      iso6391: json['iso_639_1'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      width: json['width'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'aspect_ratio': aspectRatio,
      'file_path': filePath,
      'height': height,
      'iso_639_1': iso6391,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'width': width,
    };
  }
}

class PostersModel extends Posters {
  PostersModel({
    @required dynamic aspectRatio,
    @required String filePath,
    @required double height,
    @required String iso6391,
    @required dynamic voteAverage,
    @required int voteCount,
    @required double width,
  }) : super(
          aspectRatio: aspectRatio,
          filePath: filePath,
          height: height,
          iso6391: iso6391,
          voteAverage: voteAverage,
          voteCount: voteCount,
          width: width,
        );

  factory PostersModel.fromJson(Map<String, dynamic> json) {
    return PostersModel(
      aspectRatio: json['aspect_ratio'],
      filePath: json['file_path'],
      height: json['height'],
      iso6391: json['iso_639_1'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      width: json['width'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'aspect_ratio': aspectRatio,
      'file_path': filePath,
      'height': height,
      'iso_639_1': iso6391,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'width': width,
    };
  }
}
