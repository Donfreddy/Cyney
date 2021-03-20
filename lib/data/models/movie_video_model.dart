import 'package:cyney/domain/entities/movie_video.dart';
import 'package:meta/meta.dart';

class MovieVideoModel extends MovieVideo {
  MovieVideoModel({
    @required int id,
    @required List<VideoModel> results,
  }) : super(id: id, results: results);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'results': results?.map((item) => item.toJson())?.toList(),
    };
  }

  factory MovieVideoModel.fromJson(Map<String, dynamic> json) {
    return MovieVideoModel(
      id: json['id'],
      results: List<VideoModel>.from(
        json['results']?.map((item) => VideoModel.fromJson(item)),
      ),
    );
  }
}

class VideoModel extends Video {
  VideoModel({
    @required String id,
    @required String iso6391,
    @required String iso31661, 
    @required String key,
    @required String name,
    @required String site,
    @required dynamic size,
    @required String type,
  }) : super(
          id: id,
          iso6391: iso6391,
          iso31661: iso31661,
          key: key,
          name: name,
          site: site,
          size: size,
          type: type,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'iso_639_1': iso6391,
      'iso_3166_1': iso31661,
      'key': key,
      'name': name,
      'site': site,
      'size': size,
      'type': type,
    };
  }

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      iso6391: json['iso_639_1'],
      iso31661: json['iso_3166_1'],
      key: json['key'],
      name: json['name'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
    );
  }
}
