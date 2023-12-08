import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:cine_explorer/api/api.dart';
import 'package:cine_explorer/models/movie.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(const HomeScreenState(movies: [], isLoading: true)) {
    on<LoadMoviesEvent>((event, emit) async {
      try {
        final List<Movie> top10Movies = await Api().getTop10Movies();
        emit(HomeScreenState.loaded(top10Movies));
      } catch (error) {
        print('Error loading movies: $error');
      }
    });
  }
}
