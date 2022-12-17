import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:mobile/router/routes.dart';
import 'package:provider/provider.dart';

import '../login_register/providers/auth_provider.dart';

class CustomRouter extends GoRouter {
  CustomRouter({required this.loggedIn})
      : super(
          routes: myRoutes(),
          initialLocation: loggedIn ? '/' : '/auth/login',
          redirect: (BuildContext context, GoRouterState state) {
            final bool loggedIn = context.read<AuthProvider>().isAuthenticated;
            final bool loggingIn = state.location == '/auth/login';

            if (!loggedIn) {
              return loggingIn ? null : '/auth/login';
            }
            if (loggingIn) {
              return '/';
            }
            return null;
          },
        );

  final bool loggedIn;
}
