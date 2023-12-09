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
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
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
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Rating :',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'MontserratRegular'),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            movie.rating.toStringAsFixed(1),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'MontserratRegular'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Adult :',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'MontserratRegular'),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            movie.isAdult ? 'Yes' : 'No',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'MontserratRegular',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Release date :',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'MontserratRegular'),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            movie.releaseDate,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'MontserratRegular'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Overview :',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'MontserratRegular'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            text: movie.overview,
                            style: const TextStyle(
                                fontSize: 18.0,
                                wordSpacing: 2,
                                height: 0.92,
                                fontFamily: 'MontserratRegular')),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 44,
          left: 14,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded),
              color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}
