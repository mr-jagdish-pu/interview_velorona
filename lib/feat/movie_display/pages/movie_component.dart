import 'package:flutter/material.dart';
import 'package:interview_project/feat/movie_display/model/movies_model.dart';

class MovieComponent extends StatelessWidget {
  final MoviesModel movie;

  const MovieComponent({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(
            movie.poster,
            height: 120,
            width: 300,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                movie.title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                movie.year,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          Wrap(
            children: movie.genre
                .map((e) => Chip(
                      label: Text(e),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
