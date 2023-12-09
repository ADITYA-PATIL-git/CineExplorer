class Movie {
  String title;
  String overview;
  String posterPath;
  String backDropPath;
  String releaseDate;
  double rating;
  bool isAdult;

  Movie({
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backDropPath,
    required this.releaseDate,
    required this.rating,
    required this.isAdult,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      backDropPath: json["backdrop_path"],
      releaseDate: json["release_date"],
      rating: json["vote_average"],
      isAdult: json['adult'],
    );
  }

  // Map<String, dynamic> toJson() => {
  //   "title":title,
  //   "overview":overview,
  // };
}
