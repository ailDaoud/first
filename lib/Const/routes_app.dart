import 'package:first_task2/Screen/Home.dart';
import 'package:first_task2/Screen/Login.dart';
import 'package:first_task2/Screen/Varify.dart';
import 'package:first_task2/Screen/splash.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class Myroute {
  GoRouter router = GoRouter(routes: <GoRoute>[
    GoRoute(
        name: 'Splash',
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: Splash());
        },
        routes: [
          GoRoute(
            name: 'login',
            path: 'login',
            pageBuilder: (context, state) {
              return MaterialPage(child: LoginPage());
            },
          ),
          GoRoute(
            name: 'varify',
            path: 'verify',
            pageBuilder: (context, state) {
              return MaterialPage(child: Varify());
            },
          ),
          GoRoute(
            name: 'home',
            path: 'home',
            pageBuilder: (context, state) {
              return MaterialPage(child: HomePage());
            },
          ),
          GoRoute(
            name: 'supcat',
            path: 'supcat',
            pageBuilder: (context, state) {
              return MaterialPage(child: LoginPage());
            },
          ),
        ]),
    /* GoRoute(
      name: 'login',
      path: '/login',
      pageBuilder: (context, state) {
        return MaterialPage(child: LoginPage());
      },
    ),
    GoRoute(
      name: '/varify',
      path: 'verify',
      pageBuilder: (context, state) {
        return MaterialPage(child: Varify());
      },
    ),
    GoRoute(
      name: '/register',
      path: 'register',
      pageBuilder: (context, state) {
        return MaterialPage(child: Register());
      },
    )*/
  ]);
}
