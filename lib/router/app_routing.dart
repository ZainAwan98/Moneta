import 'package:countries_utils/countries.dart';
import 'package:countries_utils/models/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneta_project/screens/account.dart';
import 'package:moneta_project/screens/location_details.dart';
import 'package:moneta_project/screens/montoring_details.dart';
import 'package:moneta_project/screens/simulation.dart';
import 'package:moneta_project/screens/splash.dart';

import '../screens/location.dart';
import '../screens/login.dart';
import '../screens/monitoring.dart';
import '../screens/signup.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/SignupScreen':
        return MaterialPageRoute(builder: (_) => SignupScreen());

      case '/LoginScreen':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/SplashScreen':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/SimulationScreen':
        return MaterialPageRoute(builder: (_) => SimulationScreen());
      case '/LocationScreen':
        return MaterialPageRoute(builder: (_) => LocationScreen());
      case '/LocationDetailsScreen':
        return MaterialPageRoute(
            builder: (_) => LocationDetailsScreen(
                  countryDetails: Country(),
                ));

      case '/MonitoringDetailsScreen':
        return MaterialPageRoute(
            builder: (_) => MonitoringDetailsScreen(
                  monitoringAddress: '',
                ));
      case '/MonitoringScreen':
        return MaterialPageRoute(builder: (_) => MonitoringScreen());
      case '/AccountScreen':
        return MaterialPageRoute(builder: (_) => AccountScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
