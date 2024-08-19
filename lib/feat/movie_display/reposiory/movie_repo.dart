import 'package:dio/dio.dart';

import '../model/movies_model.dart';

class MovieRepo {
  final url = "https://freetestapi.com/api/v1/movies";
  final dio = Dio();

  Future<List<MoviesModel>> fetchMovies() async {
    final rawResponse = await dio.get(url);
    final response = rawResponse.data as List;
    final movies = response.map((e) => MoviesModel.fromJson(e)).toList();
    return movies;
  }
}
