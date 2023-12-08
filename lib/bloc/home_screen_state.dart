part of 'home_screen_bloc.dart';

@immutable
class HomeScreenState {
  final List<Movie> movies;
  final bool isLoading;

  // HomeScreenState copyWith({
  //   List<Movie>? movies,
  // }) {
  //   return HomeScreenState(movies: movies ?? this.movies);
  // }

  const HomeScreenState({required this.movies, required this.isLoading});

  factory HomeScreenState.loading() {
    return const HomeScreenState(movies: [], isLoading: true);
  }

  factory HomeScreenState.loaded(List<Movie> movies) {
    return HomeScreenState(movies: movies, isLoading: false);
  }
}
