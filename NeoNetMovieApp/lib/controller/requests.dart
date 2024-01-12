import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:neonetmovieapp/model/movieModel.dart';
const root = "https://neonet.onrender.com";
const movie = "/movie";
const byCategory = "/find?categories=";
const mHome = "$root$movie/main";

Future<List<Movies>> getMovies() async {
  final moviesResponse = await http.get(Uri.parse((root + movie)));
  if (moviesResponse.statusCode != 200) {
    print(moviesResponse.statusCode);
  }
  List movies = jsonDecode(moviesResponse.body);
  return movies.map((e) => Movies.fromJson(e)).toList();
}

Future<List<Movies>> getMoviesByCategory(category) async {
  final moviesResponse = await http.get(Uri.parse(('$root$movie$byCategory["$category"]')));
  if (moviesResponse.statusCode != 200) {
    print(moviesResponse.statusCode);
  }
  List movies = jsonDecode(moviesResponse.body);
  return movies.map((e) => Movies.fromJson(e)).toList();
}

Future<List<Movies>> getRecommendMovies() async {
  final moviesResponse = await http.get(Uri.parse((mHome)));
  if (moviesResponse.statusCode != 200) {
    print(moviesResponse.statusCode);
  }
  Map<dynamic, dynamic> moviesRecommend = jsonDecode((moviesResponse.body));
  List movies = moviesRecommend.values.elementAt(0);
  return movies.map((e) => Movies.fromJson(e)).toList();
}

Future<MovieByID> getMoviesByID(String id) async {
  final moviesResponse = await http.get(Uri.parse("$root$movie/$id"));
  if (moviesResponse.statusCode != 200) {
    print(moviesResponse.statusCode);
  }
  Map<String, dynamic> movieData = jsonDecode(moviesResponse.body);
  return MovieByID.fromJson(movieData);
}
