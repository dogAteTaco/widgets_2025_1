import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/theme/router/routes_list.dart';

final GoRouter appRouter = GoRouter(
  routes: routesList,
  initialLocation: '/',
  debugLogDiagnostics: true,
);