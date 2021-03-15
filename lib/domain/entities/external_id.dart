import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ExternalId extends Equatable {
  final int id;
  final String imdbId;
  final String facebookId;
  final String instagramId;
  final String twitterId;

  ExternalId({
    @required this.id,
    @required this.imdbId,
    @required this.facebookId,
    @required this.instagramId,
    @required this.twitterId,
  });

  @override
  List<Object> get props {
    return [
      id,
      imdbId,
      facebookId,
      instagramId,
      twitterId,
    ];
  }

  @override
  bool get stringify => true;
}
