import 'package:flutter/material.dart';
import 'package:showcase/presentation/bloc/films_bloc.dart';

class FilmWidget extends StatelessWidget {
  final FilmsDataLoadedState state;

  const FilmWidget({super.key, required this.state});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.filmsModel.ratings.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return SizedBox(
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.filmsModel.ratings[index].source),
              const SizedBox(width: 10),
              Text(state.filmsModel.ratings[index].value),
            ],
          ),
        );
      },
    );
  }
}
