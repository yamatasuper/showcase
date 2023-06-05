import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:showcase/app/domains/providers/films_provider.dart';
import 'package:showcase/app/l10n/app_localizations.dart';
import 'package:showcase/app/l10n/l10n.dart';
import 'package:showcase/app/navigation/router/router.dart';
import 'package:showcase/presentation/bloc/films_bloc.dart';

const String hiveBox = 'history';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _appRouter.config(),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<FilmsProvider>(
              create: (context) => FilmsProvider(),
              lazy: false,
            ),
          ],
          child: BlocProvider<FilmsBloc>(
            create: (BuildContext context) => FilmsBloc(),
            child: Overlay(
              initialEntries: [
                OverlayEntry(
                  builder: (context) {
                    L10n.init(context);
                    return MediaQuery(
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: child ?? const SizedBox.shrink(),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
