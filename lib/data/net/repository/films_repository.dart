import 'dart:convert';

import 'package:http/http.dart';
import 'package:showcase/data/net/api.dart';
import 'package:showcase/data/net/model/films_model.dart';

class RepositoryFilms {
  Future<Films?> execute() async {
    try {
      Response response = await takeFilm();
      if (response.statusCode == 200) {
        return _parseResult(response);
      }
    } catch (ex) {
      return null;
    }
    return null;
  }

  Future<Films?> executeWithName(String name) async {
    try {
      Response response = await takeFilmWithName(name);
      if (response.statusCode == 200) {
        return _parseResult(response);
      }
    } catch (ex) {
      return null;
    }
    return null;
  }

  Future<Films?> _parseResult(Response response) async {
    Films result;
    final data = json.decode(response.body);
    result = Films.fromJson(data);
    return result;
  }
}
