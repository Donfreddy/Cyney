import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Person extends Equatable {
  final bool adult;
  final List<String> alsoKnownAs;
  final String biography;
  final String birthday;
  final String deathday;
  final int gender;
  final String homepage;
  final int id;
  final String imdbId;
  final String knownForDepartment;
  final String name;
  final String placeOfBirth;
  final dynamic popularity;
  final String profilePath;

  Person({
    @required this.adult,
    @required this.alsoKnownAs,
    @required this.biography,
    @required this.birthday,
    @required this.deathday,
    @required this.gender,
    @required this.homepage,
    @required this.id,
    @required this.imdbId,
    @required this.knownForDepartment,
    @required this.name,
    @required this.placeOfBirth,
    @required this.popularity,
    @required this.profilePath,
  });

  @override
  List<Object> get props {
    return [
      adult,
      alsoKnownAs,
      biography,
      birthday,
      deathday,
      gender,
      homepage,
      id,
      imdbId,
      knownForDepartment,
      name,
      placeOfBirth,
      popularity,
      profilePath,
    ];
  }

  @override
  bool get stringify => true;
}
