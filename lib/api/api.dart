import 'dart:convert';

import 'package:cine_explorer/constants.dart';
import 'package:cine_explorer/models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _top10Url =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}&page=1";

  Future<List<Movie>> getTop10Movies() async {
    final response = await http.get(Uri.parse(_top10Url));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) {
        return Movie.fromJson(movie);
      }).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }
}
