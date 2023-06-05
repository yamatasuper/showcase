part of 'films_bloc.dart';

@immutable
abstract class FilmsEvent {
  const FilmsEvent();
}

class FilmsScreenOpenedEvent extends FilmsEvent {}