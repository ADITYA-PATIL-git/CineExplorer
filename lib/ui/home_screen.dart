import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cine_explorer/bloc/home_screen_bloc.dart';
import 'package:cine_explorer/constants.dart';
import 'package:cine_explorer/models/movie.dart';
import 'package:cine_explorer/ui/movie_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeScreenBloc>().add(LoadMoviesEvent());
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: [
          Container(
            height: 38,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-o3JQMZx1y_yeBD2-wofqb5DZB4ktIs826ZEiwIMyTwm5iKrVZGHubuy4Jm6OeGX-l-A&usqp=CAU',
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          )
        ],
        title: const Text(
          'Cine-Explorer',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 34,
              fontFamily: 'BebasNeueBold'),
        ),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Text(
                            'Top 10',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, mainAxisExtent: 276),
                        itemBuilder: (context, index) {
                          final Movie movie = state.movies[index];
                          return GestureDetector(
                            onTap: () => _navigateToTaskDetails(context, movie),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.amber.withOpacity(0),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 260,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                            Constants.imagePath +
                                                movie.posterPath),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: 10),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  void _navigateToTaskDetails(BuildContext context, Movie movie) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MovieDetails(movie: movie)));
  }
}
