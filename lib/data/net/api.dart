import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<Response> takeFilm() async {
  final Uri uri =
      Uri.parse('https://www.omdbapi.com/?apikey=beff57c&t=Blade+Runner');
  return await http.post(uri);
}

Future<Response> takeFilmWithName(String name) async {
  final Uri uri = Uri.parse('https://www.omdbapi.com/?apikey=beff57c&t=$name');
  return await http.post(uri);
}
