import 'package:cyney/data/models/movie_video_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MovieVideo extends Equatable {
  final int id;
  final List<VideoModel> results;

  MovieVideo({
    @required this.id,
    @required this.results,
  });

  @override
  List<Object> get props => [id, results];

  @override
  bool get stringify => true;
}

class Video extends Equatable {
  final String id;
  final String iso6391;
  final String iso31661;
  final String key;
  final String name;
  final String site;
  final dynamic size;
  final String type;

  Video({
    @required this.id,
    @required this.iso6391,
    @required this.iso31661,
    @required this.key,
    @required this.name,
    @required this.site,
    @required this.size,
    @required this.type,
  });

  @override
  List<Object> get props {
    return [
      id,
      iso6391,
      iso31661,
      key,
      name,
      site,
      size,
      type,
    ];
  }

  @override
  bool get stringify => true;
}
