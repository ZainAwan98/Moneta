import 'package:flutter/material.dart';
import 'package:moneta_project/screens/login.dart';
import 'package:moneta_project/utils/color_constants.dart';
import 'package:moneta_project/utils/route_helper.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteHelper.loginRoute, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: mediaHeight * 0.35),
              Image.asset(
                'assets/images/logo.png', // replace with your own logo
                width: 150.0,
                height: 150.0,
              ),
              SizedBox(height: mediaHeight * 0.3),
              const Text(
                'Beta Version V1',
                style: TextStyle(
                  fontFamily: 'Tenorite',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
