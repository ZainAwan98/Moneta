import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moneta_project/screens/montoring_details.dart';

import '../utils/color_constants.dart';
import '../utils/route_helper.dart';

class MonitoringScreen extends StatefulWidget {
  const MonitoringScreen({super.key});

  @override
  State<MonitoringScreen> createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  int count = 0;

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushNamed(context, RouteHelper.homeRoute);
    }
    if (index == 1) {
      Navigator.pushNamed(context, RouteHelper.locationRoute);
    }

    if (index == 3) {
      Navigator.pushNamed(context, RouteHelper.accountRoute);
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset('assets/images/arrow_back.png'),
              ),
              SizedBox(
                width: mediaWidth * 0.26,
              ),
              Flexible(
                child: Text(
                  'Monitoring',
                  style: TextStyle(
                    fontFamily: 'Tenorite',
                    color: Colors.black,
                    fontSize: 34,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider(color: Colors.black),
          SizedBox(
            height: 30,
          ),
          _buildTopRow(context, 2),
          SizedBox(
            height: 40,
          ),
          _buildAddressList(context, 2),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        fixedSize: Size(40, 50),
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Monitoring Properties',
                        style: TextStyle(
                          fontFamily: 'Tenorite',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      width: 30,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                              fontFamily: 'Tenorite',
                              color: Colors.black,
                              fontSize: 24),
                        ),
                      )),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        width: 30,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: AppColors.primaryColor),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          _buildAddressList(context, 1),
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
                  color: Colors.black, AssetImage('assets/images/graph.png')),
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

  Widget _buildTopRow(BuildContext context, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 2,
                  fixedSize: Size(40, 50),
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Monitoring Properties',
                  style: TextStyle(
                    fontFamily: 'Tenorite',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                width: 30,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                        fontFamily: 'Tenorite',
                        color: Colors.black,
                        fontSize: 24),
                  ),
                )),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }

  Widget _buildAddressList(BuildContext context, int itemCount) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MonitoringDetailsScreen(
                        monitoringAddress:
                            '612 Rivercrest Blvd, Allen, TX 75002',
                      )),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 0),
            ),
            padding: EdgeInsets.all(16),
            child: Text(
              '612 Rivercrest Blvd, Allen, TX 75002',
              style: TextStyle(fontFamily: 'Tenorite', fontSize: 16),
            ),
          ),
        );
      },
      itemCount: itemCount,
    );
  }
}
