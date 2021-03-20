import 'package:meta/meta.dart';
import 'package:cyney/domain/entities/credit.dart';

class CreditModel extends Credit {
  CreditModel({
    @required int id,
    @required List<CastModel> cast,
    @required List<CrewModel> crew,
  }) : super(id: id, cast: cast, crew: crew);

  static CreditModel fromJson(dynamic json) {
    List<dynamic> castLists = json['cast'];
    List<dynamic> crewLists = json['crew'];

    return CreditModel(
      id: json['id'] as int,
      cast: castLists.map((m) => CastModel.fromJson(m)).toList(),
      crew: crewLists.map((m) => CrewModel.fromJson(m)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cast': cast.map((m) => m.toJson()).toList(),
      'crew': crew.map((m) => m.toJson()).toList(),
    };
  }
}

class CastModel extends Cast {
  CastModel({
    @required int id,
    @required int gender,
    @required String knownForDepartment,
    @required String name,
    @required String originalName,
    @required dynamic popularity,
    @required String profilePath,
    @required int castId,
    @required String character,
    @required String creditId,
    @required int order,
  }) : super(
          id: id,
          gender: gender,
          knownForDepartment: knownForDepartment,
          name: name,
          originalName: originalName,
          popularity: popularity,
          profilePath: profilePath,
          castId: castId,
          character: character,
          creditId: creditId,
          order: order,
        );

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      id: json['id'],
      gender: json['gender'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'],
      castId: json['cast_id'],
      character: json['character'],
      creditId: json['credit_id'],
      order: json['order'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'gender': gender,
      'known_for_department': knownForDepartment,
      'name': name,
      'original_name': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
      'cast_id': castId,
      'character': character,
      'credit_id': creditId,
      'order': order,
    };
  }
}

class CrewModel extends Crew {
  CrewModel({
    @required int id,
    @required bool adult,
    @required int gender,
    @required String knownForDepartment,
    @required String name,
    @required String originalName,
    @required dynamic popularity,
    @required String profilePath,
    @required String creditId,
    @required String department,
    @required String job,
  }) : super(
          id: id,
          adult: adult,
          gender: gender,
          knownForDepartment: knownForDepartment,
          name: name,
          originalName: originalName,
          popularity: popularity,
          profilePath: profilePath,
          creditId: creditId,
          department: department,
          job: job,
        );

  factory CrewModel.fromJson(Map<String, dynamic> json) {
    return CrewModel(
      id: json['id'],
      adult: json['adult'],
      gender: json['gender'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'],
      creditId: json['credit_id'],
      department: json['department'],
      job: json['job'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'adult': adult,
      'gender': gender,
      'known_for_department': knownForDepartment,
      'name': name,
      'original_name': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
      'credit_id': creditId,
      'department': department,
      'job': job,
    };
  }
}
