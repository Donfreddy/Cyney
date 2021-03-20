import 'package:cyney/domain/entities/person.dart';
import 'package:meta/meta.dart';

class PersonModel extends Person {
  PersonModel({
    @required bool adult,
    @required List<String> alsoKnownAs,
    @required String biography,
    @required String birthday,
    @required String deathday,
    @required int gender,
    @required String homepage,
    @required int id,
    @required String imdbId,
    @required String knownForDepartment,
    @required String name,
    @required String placeOfBirth,
    @required dynamic popularity,
    @required String profilePath,
  }) : super(
          adult: adult,
          alsoKnownAs: alsoKnownAs,
          biography: biography,
          birthday: birthday,
          deathday: deathday,
          gender: gender,
          homepage: homepage,
          id: id,
          imdbId: imdbId,
          knownForDepartment: knownForDepartment,
          name: name,
          placeOfBirth: placeOfBirth,
          popularity: popularity,
          profilePath: profilePath,
        );

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'also_known_as': alsoKnownAs,
      'biography': biography,
      'birthday': birthday,
      'deathday': deathday,
      'gender': gender,
      'homepage': homepage,
      'id': id,
      'imdb_id': imdbId,
      'known_for_department': knownForDepartment,
      'name': name,
      'place_of_birth': placeOfBirth,
      'popularity': popularity,
      'profile_path': profilePath,
    };
  }

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      adult: json['adult'],
      alsoKnownAs: List<String>.from(json['also_known_as']),
      biography: json['biography'],
      birthday: json['birthday'],
      deathday: json['deathday'],
      gender: json['gender'],
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      placeOfBirth: json['place_of_birth'],
      popularity: json['popularity'],
      profilePath: json['profile_path'],
    );
  }
}
