import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_flutter/currency/currency.dart';
import 'package:sample_flutter/home/home.dart';
import 'package:sample_flutter/splash/splash.dart';

final rootNavigationKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/${SplashPage.routeName}',
  navigatorKey: rootNavigationKey,
  routes: [
    GoRoute(
      path: '/${SplashPage.routeName}',
      name: SplashPage.routeName,
      builder: (context, state) => const SplashPage(),
    ),
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/${HomePage.routeName}',
              name: HomePage.routeName,
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/${BitcoinExchangeRatesPage.routeName}',
              name: BitcoinExchangeRatesPage.routeName,
              builder: (context, state) => const BitcoinExchangeRatesPage(),
            ),
          ],
        )
      ],
      builder: (context, state, navigationShell) => BottomNavigationShell(
        navigationShell: navigationShell,
      ),
    ),
  ],
);
