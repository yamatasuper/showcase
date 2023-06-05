import 'package:showcase/data/net/model/films_model.dart';
import 'package:showcase/data/net/repository/films_repository.dart';

class FilmsUseCase {
  Future<Films?> loadFilm() async => await RepositoryFilms().execute();
  Future<Films?> loadFilmWithName(String name) async =>
      await RepositoryFilms().executeWithName(name);
}
