import 'package:go_router/go_router.dart';

import 'package:mobile/router/routes.dart';

class CustomRouter extends GoRouter {
  CustomRouter({required this.initialRoute})
      : super(routes: myRoutes(), initialLocation: initialRoute);

  final String initialRoute;
}
