import 'package:compound/ui/view/rescuer/amb_home_view.dart';
import 'package:compound/ui/view/car/car_home_view.dart';
import 'package:flutter/material.dart';
import 'package:compound/constants/route_names.dart';
import 'package:compound/ui/view/login_view.dart';
import 'package:compound/ui/view/signup_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );
    case CarHomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: CarHomeView(),
      );
    case AmbHomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: AmbHomeView(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
                child: Text('No route defined for ${settings.name}')),
          ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}