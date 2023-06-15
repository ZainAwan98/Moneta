import 'package:flutter/material.dart';
import 'package:moneta_project/utils/color_constants.dart';

import '../utils/route_helper.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isLoginSelected = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 50,
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
                    elevation: 0,
                    fixedSize: Size(150, 10),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RouteHelper.loginRoute);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Tenorite',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    fixedSize: Size(mediaWidth * 0.4, 50),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Signup',
                    style: TextStyle(
                      fontFamily: 'Tenorite',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Row(
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

        const SizedBox(height: 10),

        Row(
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
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            decoration: InputDecoration(
              filled: true, // set filled to true
              fillColor: Colors.grey.withOpacity(0.1),
              hintText: 'Full name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: ImageIcon(AssetImage('assets/images/user.png')),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            decoration: InputDecoration(
              filled: true, // set filled to true
              fillColor: Colors.grey.withOpacity(0.1),
              hintText: 'Valid email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: ImageIcon(
                  color: Colors.black, AssetImage('assets/images/mail.png')),
            ),
            obscureText: true,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            decoration: InputDecoration(
              filled: true, // set filled to true
              fillColor: Colors.grey.withOpacity(0.1),
              hintText: 'Strong password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: ImageIcon(
                  color: Colors.black, AssetImage('assets/images/lock.png')),
            ),
            obscureText: true,
          ),
        ),

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
                ),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                        fontFamily: 'Tenorite', color: AppColors.textColor),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
          child: SizedBox(
            height: 50,
            width: mediaWidth * 0.8,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Signup',
                style: TextStyle(fontFamily: 'Tenorite', color: Colors.white),
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
          height: 10,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
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
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Facebook',
                          style: TextStyle(fontFamily: 'Tenorite'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 20, 0),
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
                            height: 20,
                            width: 15,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Google',
                          style: TextStyle(
                            fontFamily: 'Tenorite',
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
          height: 30,
        ),
        Center(
            child: Text(
          'By registering up you accept the',
          style: TextStyle(fontFamily: 'Tenorite', color: Colors.grey),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text(
                'Terms of service',
                style: TextStyle(
                    fontFamily: 'Tenorite', color: AppColors.textColor),
              ),
              onPressed: (() {}),
            ),
            Text(
              'and',
              style: TextStyle(fontFamily: 'Tenorite', color: Colors.grey),
            ),
            TextButton(
              child: Text(
                'Privacy Policy',
                style: TextStyle(
                    fontFamily: 'Tenorite', color: AppColors.textColor),
              ),
              onPressed: (() {}),
            ),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text(
        //       'Already a member?',
        //       style: TextStyle(color: AppColors.textColor),
        //     ),
        //     TextButton(
        //       child: Text(
        //         'Login',
        //         style: TextStyle(color: AppColors.textColor, fontSize: 14),
        //       ),
        //       onPressed: (() {}),
        //     ),
        //   ],
        // ),

        Row(
          children: [
            Expanded(
              flex: 0,
              child: Image.asset(
                'assets/images/ellipse.png',
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Already a member?',
              style: TextStyle(fontFamily: 'Tenorite', color: Colors.black),
            ),
            TextButton(
              child: Text(
                'Login',
                style: TextStyle(
                    fontFamily: 'Tenorite',
                    color: AppColors.textColor,
                    fontSize: 14),
              ),
              onPressed: (() {
                Navigator.pushReplacementNamed(context, RouteHelper.loginRoute);
              }),
            ),
          ],
        ),
      ]),
    )));
  }
}
