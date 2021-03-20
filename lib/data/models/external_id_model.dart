import 'package:cyney/domain/entities/external_id.dart';
import 'package:meta/meta.dart';

class ExternalIdModel extends ExternalId {
  ExternalIdModel({
    @required int id,
    @required String imdbId,
    @required String facebookId,
    @required String instagramId,
    @required String twitterId,
  }) : super(
          id: id,
          imdbId: imdbId,
          facebookId: facebookId,
          instagramId: instagramId,
          twitterId: twitterId,
        );

  factory ExternalIdModel.fromJson(Map<String, dynamic> json) {
    return ExternalIdModel(
      id: json['id'],
      imdbId: json['imdb_id'],
      facebookId: json['facebook_id'],
      instagramId: json['instagram_id'],
      twitterId: json['twitter_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imdb_id': imdbId,
      'facebook_id': facebookId,
      'instagram_id': instagramId,
      'twitter_id': twitterId,
    };
  }
}
