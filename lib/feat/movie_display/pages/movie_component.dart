import 'package:flutter/material.dart';
import 'package:interview_project/feat/movie_display/model/movies_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieComponent extends StatelessWidget {
  final MoviesModel movie;

  const MovieComponent({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final url = Uri.parse(movie.website);
        await canLaunchUrl(url)
            ? launchUrl(url, mode: LaunchMode.externalApplication)
            : ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Cannot Launch Url')));
      },
      child: Card(
        elevation: 5,
        surfaceTintColor: Colors.grey,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    fit: BoxFit.cover,
                    movie.poster,
                    height: 200,
                    width: 500,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "On Year: " + movie.year.toString(),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text('About'),
                Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  spacing: 20,
                  children: movie.genre
                      .map((e) => Chip(
                            label: Text(e),
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
