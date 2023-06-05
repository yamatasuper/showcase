part of 'films_bloc.dart';

@immutable
abstract class FilmsState {}

class FilmsInitial extends FilmsState {}

class FilmsDataLoadedState extends FilmsState {
  FilmsDataLoadedState(this.filmsModel);
  late final Films filmsModel;
}
