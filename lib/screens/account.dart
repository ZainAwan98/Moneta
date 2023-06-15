import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/color_constants.dart';
import '../utils/route_helper.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final TextStyle _textStyle = TextStyle(
    fontFamily: 'Tenorite',
  );

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushNamed(context, RouteHelper.homeRoute);
    }
    if (index == 1) {
      Navigator.pushNamed(context, RouteHelper.locationRoute);
    }
    if (index == 2) {
      Navigator.pushNamed(context, RouteHelper.monitoringRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Account',
                style: _textStyle.copyWith(
                    color: Colors.black,
                    fontSize: 34,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider(color: Colors.black),
          SizedBox(
            height: 40,
          ),
          Container(
            width: 130,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 210, 210, 210),
              border: Border.all(
                color: Color.fromARGB(255, 210, 210, 210),
                width: 2,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                    left: 40,
                    top: 40,
                    child: Image.asset('assets/images/account_icon.png')),
                Positioned(
                    left: 57,
                    top: 47.5,
                    child: Image.asset('assets/images/ellipse_white.png')),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: 60,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Notification Settings',
                        style: _textStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Image.asset(
                        'assets/images/notifications_icon.png',
                        width: 20,
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: 60,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Feedback & suggestions',
                        style: _textStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Image.asset(
                        'assets/images/feedback_icon.png',
                        width: 20,
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: mediaHeight * 0.09,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color.fromARGB(255, 167, 167, 167),
              width: 2.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 10,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
// currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                  color: Colors.black,
                  AssetImage(
                    'assets/images/graph.png',
                  )),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                  color: Colors.black, AssetImage('assets/images/search.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                  color: Colors.black, AssetImage('assets/images/doc.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                  color: Colors.black, AssetImage('assets/images/profile.png')),
              label: '',
            ),
          ],
        ),
      ),
    ));
  }
}
