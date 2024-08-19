import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_project/feat/movie_display/model/movies_model.dart';
import 'package:interview_project/feat/movie_display/reposiory/movie_repo.dart';

class MovieDisplay extends AsyncNotifier<List<MoviesModel>> {
  final movieRepo = MovieRepo();

  @override
  FutureOr<List<MoviesModel>> build() {
    return movieRepo.fetchMovies();
  }
}

AsyncNotifierProvider movieProvider =
    AsyncNotifierProvider<MovieDisplay, List<MoviesModel>>(
        () => MovieDisplay());
