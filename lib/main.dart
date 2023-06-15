import 'package:flutter/material.dart';
import 'package:moneta_project/router/app_routing.dart';
import 'package:moneta_project/screens/account.dart';
import 'package:moneta_project/screens/individual_property.dart';
import 'package:moneta_project/screens/monitoring.dart';
import 'package:moneta_project/screens/splash.dart';
import 'package:moneta_project/utils/route_helper.dart';

import 'screens/montoring_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: AccountScreen(),
      initialRoute: RouteHelper.initialRoute,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
