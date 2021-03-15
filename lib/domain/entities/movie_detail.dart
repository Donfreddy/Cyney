import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final dynamic budget;
  final List<Genres> genres;
  final String homepage;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final dynamic popularity;
  final String posterPath;
  final List<ProductionCompanies> productionCompanies;
  final List<ProductionCountries> productionCountries;
  final String releaseDate;
  final dynamic revenue;
  final int runtime;
  final List<SpokenLanguages> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final dynamic voteAverage;
  final int voteCount;

  MovieDetail({
    @required this.backdropPath,
    @required this.budget,
    @required this.genres,
    @required this.homepage,
    @required this.id,
    @required this.originalLanguage,
    @required this.originalTitle,
    @required this.overview,
    @required this.popularity,
    @required this.posterPath,
    @required this.productionCompanies,
    @required this.productionCountries,
    @required this.releaseDate,
    @required this.revenue,
    @required this.runtime,
    @required this.spokenLanguages,
    @required this.status,
    @required this.tagline,
    @required this.title,
    @required this.voteAverage,
    @required this.voteCount,
  });

  @override
  List<Object> get props {
    return [
      backdropPath,
      budget,
      genres,
      homepage,
      id,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      productionCompanies,
      productionCountries,
      releaseDate,
      revenue,
      runtime,
      spokenLanguages,
      status,
      tagline,
      title,
      voteAverage,
      voteCount,
    ];
  }

  @override
  bool get stringify => true;
}

class Genres extends Equatable {
  final int id;
  final String name;

  Genres({@required this.id, @required this.name});

  @override
  List<Object> get props => [id, name];

  @override
  bool get stringify => true;
}

class ProductionCompanies extends Equatable {
  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  ProductionCompanies({
    @required this.id,
    @required this.logoPath,
    @required this.name,
    @required this.originCountry,
  });

  @override
  List<Object> get props => [id, logoPath, name, originCountry];

  @override
  bool get stringify => true;
}

class ProductionCountries extends Equatable {
  final String iso31661;
  final String name;

  ProductionCountries({
    @required this.iso31661,
    @required this.name,
  });

  @override
  List<Object> get props => [iso31661, name];
}

class SpokenLanguages extends Equatable {
  final String englishName;
  final String iso6391;
  final String name;

  SpokenLanguages({
    @required this.englishName,
    @required this.iso6391,
    @required this.name,
  });

  @override
  List<Object> get props => [englishName, iso6391, name];

  @override
  bool get stringify => true;
}
