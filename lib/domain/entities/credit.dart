import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Credit extends Equatable {
  final int id;
  final List<Cast> cast;
  final List<Crew> crew;

  Credit({
    @required this.id,
    @required this.cast,
    @required this.crew,
  });

  @override
  List<Object> get props => [id, cast, crew];

  @override
  bool get stringify => true;
}

class Cast extends Equatable {
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final dynamic popularity;
  final String profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  Cast(
      {@required this.gender,
      @required this.id,
      @required this.knownForDepartment,
      @required this.name,
      @required this.originalName,
      @required this.popularity,
      @required this.profilePath,
      @required this.castId,
      @required this.character,
      @required this.creditId,
      @required this.order});

  @override
  List<Object> get props {
    return [
      gender,
      id,
      knownForDepartment,
      name,
      originalName,
      popularity,
      profilePath,
      castId,
      character,
      creditId,
      order,
    ];
  }

  @override
  bool get stringify => true;
}

class Crew extends Equatable {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final dynamic popularity;
  final String profilePath;
  final String creditId;
  final String department;
  final String job;

  Crew({
    @required this.adult,
    @required this.gender,
    @required this.id,
    @required this.knownForDepartment,
    @required this.name,
    @required this.originalName,
    @required this.popularity,
    @required this.profilePath,
    @required this.creditId,
    @required this.department,
    @required this.job,
  });

  @override
  List<Object> get props {
    return [
      adult,
      gender,
      id,
      knownForDepartment,
      name,
      originalName,
      popularity,
      profilePath,
      creditId,
      department,
      job,
    ];
  }

  @override
  bool get stringify => true;
}
