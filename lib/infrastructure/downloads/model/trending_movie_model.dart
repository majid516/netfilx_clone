import 'dart:convert';

class TrendingMovies {
    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    TrendingMovies({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    TrendingMovies copyWith({
        int? page,
        List<Result>? results,
        int? totalPages,
        int? totalResults,
    }) => 
        TrendingMovies(
            page: page ?? this.page,
            results: results ?? this.results,
            totalPages: totalPages ?? this.totalPages,
            totalResults: totalResults ?? this.totalResults,
        );

    factory TrendingMovies.fromRawJson(String str) => TrendingMovies.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TrendingMovies.fromJson(Map<String, dynamic> json) => TrendingMovies(
        page: json["page"] ?? 0,
        results: json["results"] != null 
            ? List<Result>.from(json["results"].map((x) => Result.fromJson(x)))
            : [],
        totalPages: json["total_pages"] ?? 0,
        totalResults: json["total_results"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Result {
    String backdropPath;
    int id;
    String title;
    String originalTitle;
    String overview;
    String posterPath;
    MediaType mediaType;
    bool adult;
    OriginalLanguage originalLanguage;
    List<int> genreIds;
    double popularity;
    DateTime releaseDate;
    bool video;
    double voteAverage;
    int voteCount;

    Result({
        required this.backdropPath,
        required this.id,
        required this.title,
        required this.originalTitle,
        required this.overview,
        required this.posterPath,
        required this.mediaType,
        required this.adult,
        required this.originalLanguage,
        required this.genreIds,
        required this.popularity,
        required this.releaseDate,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    Result copyWith({
        String? backdropPath,
        int? id,
        String? title,
        String? originalTitle,
        String? overview,
        String? posterPath,
        MediaType? mediaType,
        bool? adult,
        OriginalLanguage? originalLanguage,
        List<int>? genreIds,
        double? popularity,
        DateTime? releaseDate,
        bool? video,
        double? voteAverage,
        int? voteCount,
    }) => 
        Result(
            backdropPath: backdropPath ?? this.backdropPath,
            id: id ?? this.id,
            title: title ?? this.title,
            originalTitle: originalTitle ?? this.originalTitle,
            overview: overview ?? this.overview,
            posterPath: posterPath ?? this.posterPath,
            mediaType: mediaType ?? this.mediaType,
            adult: adult ?? this.adult,
            originalLanguage: originalLanguage ?? this.originalLanguage,
            genreIds: genreIds ?? this.genreIds,
            popularity: popularity ?? this.popularity,
            releaseDate: releaseDate ?? this.releaseDate,
            video: video ?? this.video,
            voteAverage: voteAverage ?? this.voteAverage,
            voteCount: voteCount ?? this.voteCount,
        );

    factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        backdropPath: json["backdrop_path"] ?? '',
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        originalTitle: json["original_title"] ?? '',
        overview: json["overview"] ?? '',
        posterPath: json["poster_path"] ?? '',
        mediaType: mediaTypeValues.map[json["media_type"]] ?? MediaType.MOVIE,
        adult: json["adult"] ?? false,
        originalLanguage: originalLanguageValues.map[json["original_language"]] ?? OriginalLanguage.EN,
        genreIds: json["genre_ids"] != null 
            ? List<int>.from(json["genre_ids"].map((x) => x))
            : [],
        popularity: (json["popularity"] ?? 0).toDouble(),
        releaseDate: json["release_date"] != null 
            ? DateTime.parse(json["release_date"]) 
            : DateTime(1970),
        video: json["video"] ?? false,
        voteAverage: (json["vote_average"] ?? 0).toDouble(),
        voteCount: json["vote_count"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaTypeValues.reverse[mediaType] ?? "movie",
        "adult": adult,
        "original_language": originalLanguageValues.reverse[originalLanguage] ?? "en",
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "popularity": popularity,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

enum MediaType {
    MOVIE
}

final mediaTypeValues = EnumValues({
    "movie": MediaType.MOVIE
});

enum OriginalLanguage {
    EN,
    FR,
    HI
}

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN,
    "fr": OriginalLanguage.FR,
    "hi": OriginalLanguage.HI
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
