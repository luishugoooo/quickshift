import 'package:go_router/go_router.dart';
import 'package:quickshift/screens/fluent/main_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: "/",
    name: "Home",
    builder: (context, state) => const MainScreen(),
  )
]);
