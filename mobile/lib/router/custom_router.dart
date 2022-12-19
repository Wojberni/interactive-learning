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
            final bool loggingIn = state.subloc == '/auth/login';
            final bool registering = state.subloc == '/auth/register';
            if (!loggedIn) {
              if (loggingIn || registering) {
                return null;
              }
              else {
                return '/auth/login';
              }
            }
            else {
              if (loggingIn || registering) {
                return '/';
              }
            }
            return null;
          },
          redirectLimit: 1000,
        );

  final bool loggedIn;
}
