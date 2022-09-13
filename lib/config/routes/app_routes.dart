import 'package:flutter/material.dart';
import 'package:postes_app_clean_architecture/core/utils/app_string.dart';
import 'package:postes_app_clean_architecture/featrues/test.dart';
import 'package:postes_app_clean_architecture/my_app.dart';

class Routes {
  static const String initialRoute = '/';
}

class AppRoutes {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context) => const MyApp()));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppString.noRoute),
              )   ,
            )));
  }
}

// final Map<String,dynamic> routes = {
//   Routes.initialRoute: (context) => const QuoteScreen(),
//   '/testScreen' : (context)   => const TestRout()
// };
