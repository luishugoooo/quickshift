import 'package:go_router/go_router.dart';
import 'package:quickshift/notifications/desktop_notifcation_handler.dart';
import 'package:quickshift/screens/main_screen.dart';
import 'package:quickshift/widgets/window/macos_menu_bar.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: "/",
    name: "Home",
    builder: (context, state) =>
        const DesktopNotifcationHandler(child: OsMenuBar(child: MainScreen())),
  )
]);
