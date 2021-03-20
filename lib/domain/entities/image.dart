import 'package:cyney/data/models/image_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MovieImage extends Equatable {
  final int id;
  final List<BackdropsModel> backdrops;
  final List<PostersModel> posters;

  MovieImage({
    @required this.id,
    @required this.backdrops,
    @required this.posters,
  });

  @override
  List<Object> get props => [id, backdrops, posters];
}

class Backdrops extends Equatable {
  final dynamic aspectRatio;
  final String filePath;
  final double height;
  final String iso6391;
  final dynamic voteAverage;
  final int voteCount;
  final double width;

  Backdrops({
    @required this.aspectRatio,
    @required this.filePath,
    @required this.height,
    @required this.iso6391,
    @required this.voteAverage,
    @required this.voteCount,
    @required this.width,
  });

  @override
  List<Object> get props {
    return [
      aspectRatio,
      filePath,
      height,
      iso6391,
      voteAverage,
      voteCount,
      width,
    ];
  }

  @override
  bool get stringify => true;
}

class Posters extends Equatable {
  final dynamic aspectRatio;
  final String filePath;
  final double height;
  final String iso6391;
  final dynamic voteAverage;
  final int voteCount;
  final double width;

  Posters({
    @required this.aspectRatio,
    @required this.filePath,
    @required this.height,
    @required this.iso6391,
    @required this.voteAverage,
    @required this.voteCount,
    @required this.width,
  });

  @override
  List<Object> get props {
    return [
      aspectRatio,
      filePath,
      height,
      iso6391,
      voteAverage,
      voteCount,
      width,
    ];
  }

  @override
  bool get stringify => true;
}
