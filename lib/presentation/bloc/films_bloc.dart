import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase/data/net/model/films_model.dart';
import 'package:showcase/data/net/use_cases/films_usecase.dart';

part 'films_event.dart';
part 'films_state.dart';

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  FilmsBloc() : super(FilmsInitial()) {
    on<FilmsScreenOpenedEvent>(_mapPageOpenedToState);
  }

  Future<void> _mapPageOpenedToState(
      FilmsScreenOpenedEvent event, Emitter<FilmsState> emit) async {
    try {
      Films? filmsModel = (await FilmsUseCase().loadFilm());
      emit(FilmsDataLoadedState(filmsModel!));
    } catch (_) {
      rethrow;
    }
  }
}
