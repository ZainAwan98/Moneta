import 'package:flutter/material.dart';
import 'package:moneta_project/utils/color_constants.dart';
import 'package:moneta_project/utils/route_helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  bool _isLoginScreen = true;

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          width: mediaWidth * 0.8,
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(50))),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: _isLoginScreen ? 2 : 0,
                    fixedSize: _isLoginScreen
                        ? Size(mediaWidth * 0.4, 50)
                        : Size(150, 10),
                    backgroundColor:
                        _isLoginScreen ? Colors.white : AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _rememberMe = false;
                      _isLoginScreen = true;
                    });
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Tenorite',
                      fontSize: 21.24,
                      color: _isLoginScreen ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: _isLoginScreen ? 0 : 2,
                    fixedSize: _isLoginScreen
                        ? Size(150, 10)
                        : Size(mediaWidth * 0.4, 50),
                    backgroundColor:
                        _isLoginScreen ? AppColors.primaryColor : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _rememberMe = false;
                      _isLoginScreen = false;
                    });
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'Tenorite',
                      fontSize: 21.24,
                      color: _isLoginScreen ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        _isLoginScreen
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: mediaWidth * 0.12,
                  ),
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      fontFamily: 'Tenorite',
                      fontSize: 37.21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: mediaWidth * 0.12,
                  ),
                  const Text(
                    'Get Started!',
                    style: TextStyle(
                      fontFamily: 'Tenorite',
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
        SizedBox(height: 5),
        _isLoginScreen
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(mediaWidth * 0.12, 0, 0, 0),
                    child: Text(
                      'Sign in to access your account',
                      style: TextStyle(
                        fontFamily: 'Tenorite',
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(mediaWidth * 0.12, 0, 0, 0),
                    child: const Text(
                      'by creating a free account',
                      style: TextStyle(
                        fontFamily: 'Tenorite',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
        const SizedBox(height: 5),
        _isLoginScreen
            ? Text('')
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                   style: TextStyle(fontFamily: "Tenorite", fontSize: 14),
                  decoration: InputDecoration(
                    filled: true, // set filled to true
                    fillColor: Colors.grey.withOpacity(0.1),
                    hintText: 'Full name',
                    hintStyle: TextStyle(fontFamily: "Tenorite", fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: ImageIcon(AssetImage('assets/images/user.png')),
                  ),
                ),
              ),
        _isLoginScreen ? const SizedBox(height: 0) : const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            style: TextStyle(fontFamily: "Tenorite", fontSize: 14),
            decoration: InputDecoration(
              hintStyle: TextStyle(fontFamily: "Tenorite", fontSize: 14),
              filled: true, // set filled to true
              fillColor: Colors.grey.withOpacity(0.1),
              hintText: _isLoginScreen ? 'Enter your email' : 'Valid Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: ImageIcon(
                  color: Colors.black, AssetImage('assets/images/mail.png')),
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            style: TextStyle(fontFamily: "Tenorite", fontSize: 14),
            decoration: InputDecoration(
                hintStyle: TextStyle(fontFamily: "Tenorite", fontSize: 14),
                filled: true, // set filled to true
                fillColor: Colors.grey.withOpacity(0.1),
                hintText: _isLoginScreen ? 'Password' : 'Strong Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: ImageIcon(
                    color: Colors.black, AssetImage('assets/images/lock.png'))),
            obscureText: true,
          ),
        ),
        SizedBox(
          height: _isLoginScreen ? 10 : 0,
        ),
        _isLoginScreen
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkResponse(
                        onTap: () {},
                        child: Image.asset('assets/images/face_detector.png')),
                    SizedBox(
                      width: 20,
                    ),
                    InkResponse(
                        onTap: () {},
                        child: Image.asset('assets/images/finger_print.png')),
                  ],
                ),
              )
            : Text(''),
        SizedBox(height: _isLoginScreen ? 10 : 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Theme(
                data: ThemeData(
                  checkboxTheme: CheckboxThemeData(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(
                          color: Colors.grey), // set the border color here
                    ),
                  ),
                ),
                child: Checkbox(
                  overlayColor:
                      MaterialStateProperty.all(AppColors.primaryColor),
                  activeColor: AppColors.primaryColor,
                  value: _rememberMe,
                  onChanged: (_) {
                    setState(() {
                      _rememberMe = !_rememberMe;
                    });
                  },
                  checkColor: Colors.white,
                ),
              ),
              const Text(
                'Remember me',
                style: TextStyle(
                  fontFamily: 'Tenorite',
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontFamily: 'Tenorite',
                      color: AppColors.textColor,
                      fontSize: 12,
                    ),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: SizedBox(
            height: 50,
            width: mediaWidth * 0.8,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, RouteHelper.homeRoute);
              },
              child: Text(
                _isLoginScreen ? 'Login' : 'Signup',
                style: TextStyle(
                  fontFamily: 'Tenorite',
                  color: Colors.white,
                  fontSize: 21.6,
                ),
              ),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor:
                    MaterialStateProperty.all(AppColors.primaryColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: const Divider(
                  color: Colors.black,
                  thickness: 0.0,
                  indent: 16.0,
                  endIndent: 16.0,
                ),
              ),
            ),
            Text(
              'or continue with',
              style: TextStyle(
                  fontFamily: 'Tenorite', color: Colors.grey, fontSize: 10),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: const Divider(
                  color: Colors.black,
                  thickness: 0.0,
                  indent: 16.0,
                  endIndent: 16.0,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 0, 0),
              child: SizedBox(
                height: 50,
                width: mediaWidth * 0.35,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.3)),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Flexible(
                          child: Image.asset(
                            'assets/images/fb_icon.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Facebook',
                          style: TextStyle(
                            fontFamily: 'Tenorite',
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 20, 0),
              child: SizedBox(
                height: 50,
                width: mediaWidth * 0.35,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.3)),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Flexible(
                          child: Image.asset(
                            'assets/images/google_icon.png',
                            width: 32,
                            height: 17,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Google',
                          style: TextStyle(
                            fontFamily: 'Tenorite',
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: _isLoginScreen ? 20 : 30,
        ),
        Center(
            child: Text(
          'By registering up you accept the',
          style: TextStyle(
              fontFamily: 'Tenorite', color: Colors.grey, fontSize: 11),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text(
                'Terms of service',
                style: TextStyle(
                    fontFamily: 'Tenorite',
                    color: AppColors.textColor,
                    fontSize: 11),
              ),
              onPressed: (() {}),
            ),
            Text(
              'and',
              style: TextStyle(color: Colors.grey, fontSize: 11),
            ),
            TextButton(
              child: Text(
                'Privacy Policy',
                style: TextStyle(
                    fontFamily: 'Tenorite',
                    color: AppColors.textColor,
                    fontSize: 11),
              ),
              onPressed: (() {}),
            ),
          ],
        ),
        SizedBox(
          height: mediaHeight * 0.15,
          child: Stack(
            children: [
              Positioned(
                bottom: -100,
                left: -90,
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Container(
                    width: 200,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          Color.fromARGB(255, 46, 78, 121),
                          Color.fromARGB(255, 217, 217, 217)
                        ],
                        center: Alignment.center,
                        radius: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FractionallySizedBox(
                        widthFactor: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    _isLoginScreen ? 'New member?' : 'Already a member',
                    style: TextStyle(
                        fontFamily: 'Tenorite',
                        color: Colors.black,
                        fontSize: 13),
                  ),
                  TextButton(
                      child: Text(
                        _isLoginScreen ? 'Register now' : 'Login',
                        style: TextStyle(
                            fontFamily: 'Tenorite',
                            color: AppColors.textColor,
                            fontSize: 13),
                      ),
                      onPressed: (() {
                        setState(() {
                          _isLoginScreen = !_isLoginScreen;
                        });
                      })),
                ],
              ),
            ],
          ),
        ),
      ]),
    )));
  }
}
