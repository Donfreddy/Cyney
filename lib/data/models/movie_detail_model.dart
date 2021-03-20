import 'package:meta/meta.dart';
import 'package:cyney/domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  MovieDetailModel({
    @required int id,
    @required String backdropPath,
    @required dynamic budget,
    @required List<GenresModel> genres,
    @required String homepage,
    @required String originalLanguage,
    @required String originalTitle,
    @required String overview,
    @required dynamic popularity,
    @required String posterPath,
    @required List<ProductionCompaniesModel> productionCompanies,
    @required List<ProductionCountriesModel> productionCountries,
    @required String releaseDate,
    @required dynamic revenue,
    @required int runtime,
    @required List<SpokenLanguagesModel> spokenLanguages,
    @required String status,
    @required String tagline,
    @required String title,
    @required dynamic voteAverage,
    @required int voteCount,
  }) : super(
          id: id,
          backdropPath: backdropPath,
          budget: budget,
          genres: genres,
          homepage: homepage,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          productionCompanies: productionCompanies,
          productionCountries: productionCountries,
          releaseDate: releaseDate,
          revenue: revenue,
          runtime: runtime,
          spokenLanguages: spokenLanguages,
          status: status,
          tagline: tagline,
          title: title,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'backdrop_path': backdropPath,
      'budget': budget,
      'genres': genres.map((item) => item.toJson()).toList(),
      'homepage': homepage,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'production_companies':
          productionCompanies.map((item) => item.toJson()).toList(),
      'production_countries':
          productionCountries.map((item) => item.toJson()).toList(),
      'release_date': releaseDate,
      'revenue': revenue,
      'runtime': runtime,
      'spoken_languages': spokenLanguages.map((item) => item.toJson()).toList(),
      'status': status,
      'tagline': tagline,
      'title': title,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      budget: json['budget'],
      genres: List<GenresModel>.from(
        json['genres'].map((item) => GenresModel.fromJson(item)),
      ),
      homepage: json['homepage'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      productionCompanies: List<ProductionCompaniesModel>.from(
        json['production_companies']
            .map((item) => ProductionCompaniesModel.fromJson(item)),
      ),
      productionCountries: List<ProductionCountriesModel>.from(
        json['production_countries']
            .map((item) => ProductionCountriesModel.fromJson(item)),
      ),
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: List<SpokenLanguagesModel>.from(
        json['spoken_languages']
            .map((item) => SpokenLanguagesModel.fromJson(item)),
      ),
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}

class GenresModel extends Genres {
  GenresModel({@required int id, @required String name})
      : super(id: id, name: name);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ProductionCompaniesModel extends ProductionCompanies {
  ProductionCompaniesModel({
    @required int id,
    @required String logoPath,
    @required String name,
    @required String originCountry,
  }) : super(
            id: id,
            logoPath: logoPath,
            name: name,
            originCountry: originCountry);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'logo_path': logoPath,
      'name': name,
      'origin_country': originCountry,
    };
  }

  factory ProductionCompaniesModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompaniesModel(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }
}

class ProductionCountriesModel extends ProductionCountries {
  ProductionCountriesModel({
    @required String name,
    @required String iso31661,
  }) : super(name: name, iso31661: iso31661);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'iso_3166_1': iso31661,
    };
  }

  factory ProductionCountriesModel.fromJson(Map<String, dynamic> json) {
    return ProductionCountriesModel(
      name: json['name'],
      iso31661: json['iso_3166_1'],
    );
  }
}

class SpokenLanguagesModel extends SpokenLanguages {
  SpokenLanguagesModel({
    @required String englishName,
    @required String iso6391,
    @required String name,
  }) : super(englishName: englishName, iso6391: iso6391, name: name);

  Map<String, dynamic> toJson() {
    return {
      'english_name': englishName,
      'iso_639_1': iso6391,
      'name': name,
    };
  }

  factory SpokenLanguagesModel.fromJson(Map<String, dynamic> json) {
    return SpokenLanguagesModel(
      englishName: json['english_name'],
      iso6391: json['iso_639_1'],
      name: json['name'],
    );
  }
}
