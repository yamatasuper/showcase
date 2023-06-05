// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FilmRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FilmPage(),
      );
    }
  };
}

/// generated route for
/// [FilmPage]
class FilmRoute extends PageRouteInfo<void> {
  const FilmRoute({List<PageRouteInfo>? children})
      : super(
          FilmRoute.name,
          initialChildren: children,
        );

  static const String name = 'FilmRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
