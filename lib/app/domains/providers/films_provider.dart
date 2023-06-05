import 'package:flutter/widgets.dart';
import 'package:showcase/data/net/model/films_model.dart';
import 'package:showcase/data/net/use_cases/films_usecase.dart';

class FilmsProvider with ChangeNotifier {
  Films? _filmsData;

  Films? get filmsData => _filmsData;

  set filmsData(Films? filmsData) {
    _filmsData = filmsData;
    notifyListeners();
  }

  Future<Films?> loadFilmData(String film) async {
    final response = await FilmsUseCase().loadFilmWithName(film);
    filmsData = response;
    return response;
  }
}
