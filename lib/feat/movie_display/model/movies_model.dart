class MoviesModel {
  final String poster;
  final String title;
  final int year;
  final List<String> genre;
  final String website;

  MoviesModel({
    required this.poster,
    required this.title,
    required this.year,
    required this.genre,
    required this.website,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      poster: json['poster'],
      title: json['title'],
      year: json['year'],
      genre: List<String>.from(json['genre']),
      website: json['website'],
    );
  }
}
/*
Poster
Title
year
genre in chips
website

 */
