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
    AddFinanceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddFinanceScreen(),
      );
    },
    FinanceListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FinanceListScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    NewsInfoRoute.name: (routeData) {
      final args = routeData.argsAs<NewsInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsInfoScreen(
          key: args.key,
          news: args.news,
        ),
      );
    },
    NewsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsListScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    QuizGameRoute.name: (routeData) {
      final args = routeData.argsAs<QuizGameRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QuizGameScreen(
          key: args.key,
          quiz: args.quiz,
        ),
      );
    },
    QuizListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QuizListScreen(),
      );
    },
    QuizResultRoute.name: (routeData) {
      final args = routeData.argsAs<QuizResultRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QuizResultScreen(
          key: args.key,
          result: args.result,
          quiz: args.quiz,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [AddFinanceScreen]
class AddFinanceRoute extends PageRouteInfo<void> {
  const AddFinanceRoute({List<PageRouteInfo>? children})
      : super(
          AddFinanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddFinanceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FinanceListScreen]
class FinanceListRoute extends PageRouteInfo<void> {
  const FinanceListRoute({List<PageRouteInfo>? children})
      : super(
          FinanceListRoute.name,
          initialChildren: children,
        );

  static const String name = 'FinanceListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsInfoScreen]
class NewsInfoRoute extends PageRouteInfo<NewsInfoRouteArgs> {
  NewsInfoRoute({
    Key? key,
    required NewsModel news,
    List<PageRouteInfo>? children,
  }) : super(
          NewsInfoRoute.name,
          args: NewsInfoRouteArgs(
            key: key,
            news: news,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsInfoRoute';

  static const PageInfo<NewsInfoRouteArgs> page =
      PageInfo<NewsInfoRouteArgs>(name);
}

class NewsInfoRouteArgs {
  const NewsInfoRouteArgs({
    this.key,
    required this.news,
  });

  final Key? key;

  final NewsModel news;

  @override
  String toString() {
    return 'NewsInfoRouteArgs{key: $key, news: $news}';
  }
}

/// generated route for
/// [NewsListScreen]
class NewsListRoute extends PageRouteInfo<void> {
  const NewsListRoute({List<PageRouteInfo>? children})
      : super(
          NewsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QuizGameScreen]
class QuizGameRoute extends PageRouteInfo<QuizGameRouteArgs> {
  QuizGameRoute({
    Key? key,
    required QuizModel quiz,
    List<PageRouteInfo>? children,
  }) : super(
          QuizGameRoute.name,
          args: QuizGameRouteArgs(
            key: key,
            quiz: quiz,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizGameRoute';

  static const PageInfo<QuizGameRouteArgs> page =
      PageInfo<QuizGameRouteArgs>(name);
}

class QuizGameRouteArgs {
  const QuizGameRouteArgs({
    this.key,
    required this.quiz,
  });

  final Key? key;

  final QuizModel quiz;

  @override
  String toString() {
    return 'QuizGameRouteArgs{key: $key, quiz: $quiz}';
  }
}

/// generated route for
/// [QuizListScreen]
class QuizListRoute extends PageRouteInfo<void> {
  const QuizListRoute({List<PageRouteInfo>? children})
      : super(
          QuizListRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuizListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QuizResultScreen]
class QuizResultRoute extends PageRouteInfo<QuizResultRouteArgs> {
  QuizResultRoute({
    Key? key,
    required int result,
    required QuizModel quiz,
    List<PageRouteInfo>? children,
  }) : super(
          QuizResultRoute.name,
          args: QuizResultRouteArgs(
            key: key,
            result: result,
            quiz: quiz,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizResultRoute';

  static const PageInfo<QuizResultRouteArgs> page =
      PageInfo<QuizResultRouteArgs>(name);
}

class QuizResultRouteArgs {
  const QuizResultRouteArgs({
    this.key,
    required this.result,
    required this.quiz,
  });

  final Key? key;

  final int result;

  final QuizModel quiz;

  @override
  String toString() {
    return 'QuizResultRouteArgs{key: $key, result: $result, quiz: $quiz}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
