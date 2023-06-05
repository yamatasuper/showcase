import 'package:auto_route/auto_route.dart';
import 'package:showcase/presentation/ui/films_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: FilmRoute.page, path: '/'),
      ];
}
