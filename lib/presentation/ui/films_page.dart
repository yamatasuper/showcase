import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:showcase/app/domains/providers/films_provider.dart';
import 'package:showcase/app/l10n/l10n.dart';
import 'package:showcase/app/style/app_colors.dart';
import 'package:showcase/app/style/app_text_styles.dart';
import 'package:showcase/data/net/model/films_model.dart';
import 'package:showcase/presentation/bloc/films_bloc.dart';
import 'package:showcase/presentation/ui/widgets/film_widget.dart';
import 'package:showcase/presentation/ui/widgets/loading_widget.dart';

@RoutePage()
class FilmPage extends StatefulWidget {
  const FilmPage({super.key});

  @override
  FootballPageState createState() => FootballPageState();
}

class FootballPageState extends State<FilmPage> {
  late String searchFilm;

  @override
  void initState() {
    super.initState();
    context.read<FilmsBloc>().add(FilmsScreenOpenedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: BlocBuilder<FilmsBloc, FilmsState>(
        builder: (_, state) {
          if (state is FilmsDataLoadedState) {
            return Selector<FilmsProvider, Films?>(
              selector: (context, vm) => vm.filmsData,
              builder: (context, films, _) {
                if (films != null) {
                  return Column(
                    children: [
                      Text(films.title),
                      Image.network(
                        films.poster,
                        height: 300,
                      ),
                    ],
                  );
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                            hintText: 'Введите название фильма'),
                        onChanged: (value) {
                          searchFilm = value;
                        },
                      ),
                      Text(state.filmsModel.title),
                      Image.network(
                        state.filmsModel.poster,
                        height: 300,
                      ),
                      FilmWidget(state: state),
                    ],
                  ),
                );
              },
            );
          }
          return const LoadingWidget();
        },
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Colors.grey,
      title: TextButton(
        onPressed: () async {
          context.read<FilmsProvider>().loadFilmData(searchFilm);
        },
        child: Text(
          l10n.search,
          style: AppTextStyles.s22w500.copyWith(
            color: AppColorsLight.primary,
          ),
        ),
      ),
    );
  }
}
