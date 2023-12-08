import 'package:flutter/material.dart';
import 'package:cine_explorer/constants.dart';
import 'package:cine_explorer/models/movie.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  const MovieDetails({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Image.network(Constants.imagePath + movie.posterPath),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: movie.title,
                              style: const TextStyle(
                                  fontSize: 50.0,
                                  wordSpacing: 2,
                                  height: 0.92,
                                  fontFamily: 'BebasNeueBold')),
                        ),
                        Text(
                          movie.releaseDate,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              text: movie.overview,
                              style: const TextStyle(
                                fontSize: 18.0,
                                wordSpacing: 2,
                                height: 0.92,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 30,
              left: 10,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_rounded),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
