import 'package:e_shop/main_wrapper.dart';
import 'package:e_shop/screens/account_screen.dart';
import 'package:e_shop/screens/cart_screen.dart';
import 'package:e_shop/screens/categorie_screen.dart';
import 'package:e_shop/screens/check_out_screen.dart';
import 'package:e_shop/screens/debit_card_screen.dart';
import 'package:e_shop/screens/detail_screen.dart';
import 'package:e_shop/screens/item_screen.dart';
import 'package:e_shop/screens/onboarding_sreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();

  static String intitR = '/onboarding';

  static final rootNavigatoKey = GlobalKey<NavigatorState>();
  static final rootNavigatoHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final rootNavigatoShop =
      GlobalKey<NavigatorState>(debugLabel: 'shellShop');
  static final rootNavigatoAccount =
      GlobalKey<NavigatorState>(debugLabel: 'shellAccount');

  static final GoRouter router = GoRouter(
    initialLocation: intitR,
    navigatorKey: rootNavigatoKey,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => MainWrapper(
          navigationShell: navigationShell,
        ),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: rootNavigatoHome,
            routes: [
              GoRoute(
                path: '/home',
                name: 'Home',
                builder: (context, state) => CategorieSreen(
                  key: state.pageKey,
                ),
              ),
              GoRoute(
                path: '/categorie',
                name: 'Categorie',
                builder: (context, state) => VegetableScren(
                  key: state.pageKey,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: rootNavigatoShop,
            routes: [
              GoRoute(
                path: '/shop',
                name: 'Shop',
                builder: (context, state) => CartSreen(
                  key: state.pageKey,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: rootNavigatoAccount,
            routes: [
              GoRoute(
                path: '/account',
                name: 'Account',
                builder: (context, state) => AcountScreen(
                  key: state.pageKey,
                ),
              ),
              GoRoute(
                path: '/cart',
                name: 'Cart',
                builder: (context, state) => CartSreen(
                  key: state.pageKey,
                ),
              ),
              GoRoute(
                path: '/check_out',
                name: 'Check_out',
                builder: (context, state) => CheckOutScreen(
                  key: state.pageKey,
                ),
              )
            ],
          )
        ],
      ),
      GoRoute(
        path: '/detail/:id',
        name: 'Detail',
        parentNavigatorKey: rootNavigatoKey,
        builder: (context, state) => DetailScreen(
          id: state.pathParameters['id']!,
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/credit_card',
        name: 'Credit_card',
        parentNavigatorKey: rootNavigatoKey,
        builder: (context, state) => DebitCardScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'Onboarding',
        parentNavigatorKey: rootNavigatoKey,
        builder: (context, state) => OnboardingScreen(
          key: state.pageKey,
        ),
      ),
    ],
  );
}
