import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_project/feat/movie_display/model/movies_model.dart';
import 'package:interview_project/feat/movie_display/pages/movie_component.dart';
import 'package:interview_project/feat/movie_display/presentation/riverpod_movie.dart';

class MovieDisplayPage extends ConsumerWidget {
  const MovieDisplayPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(movieProvider);
    return Scaffold(body: Builder(builder: (context) {
      return switch (state) {
        AsyncData(:final value as List<MoviesModel>) => ListView.builder(itemBuilder: (ctx, ind){
          return MovieComponent(movie: value[ind]);
        }, itemCount: value.length,),
        // TODO: Handle this case.
        AsyncError(:final error, :final stackTrace) => Center(child: Text('error: $error'),),
        AsyncLoading() => CircularProgressIndicator(),
        _ => Center()
      };
    }));
  }
}
