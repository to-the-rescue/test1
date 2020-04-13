
import 'package:flutter/material.dart';
import 'package:compound/services/navigation_service.dart';
import 'package:compound/services/dialog_service.dart';
import 'package:compound/ui/view/login_view.dart';
import 'managers/dialog_manager.dart';
import 'ui/router.dart';
import 'locator.dart';

void main() {
  // Register all the models and services before the app starts
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compound',
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primarySwatch: Colors.red,
        secondaryHeaderColor: Colors.redAccent,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Open Sans',
        ),
      ),
      home: LoginView(),
      onGenerateRoute: generateRoute,
    );
  }
}
