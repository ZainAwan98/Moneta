import 'package:countries_utils/countries_utils.dart';
import 'package:flutter/material.dart';
import 'package:moneta_project/screens/individual_property.dart';
import 'package:moneta_project/utils/color_constants.dart';

import '../utils/route_helper.dart';

class LocationDetailsScreen extends StatefulWidget {
  Country countryDetails;

  LocationDetailsScreen({required this.countryDetails});

  @override
  State<LocationDetailsScreen> createState() => _LocationDetailsScreenState();
}

class _LocationDetailsScreenState extends State<LocationDetailsScreen> {
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
    if (index == 3) {
      Navigator.pushNamed(context, RouteHelper.accountRoute);
    }
  }

  _splitCountryName() {}
  List<String> _properties = [
    '708 Rivercrest Blvd, Allen, TX 75002',
    "612 Rivercrest Blvd, Allen, TX 75002",
    '710 Rivercrest Blvd, Allen, TX 75002',
    '720 Rivercrest Blvd, Allen, TX 75002',
    '650 Rivercrest Blvd, Allen, TX 75002',
    '850 Rivercrest Blvd, Allen, TX 75002',
    '900 Rivercrest Blvd, Allen, TX 75002',
  ];
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
                SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset('assets/images/arrow_back.png'),
                ),
                Flexible(
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        widget.countryDetails.name!,
                        style: TextStyle(
                          fontFamily: 'Tenorite',
                          color: Colors.black,
                          fontSize: 34,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                        ),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(color: Colors.black),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Location',
                  style: TextStyle(
                      fontFamily: 'Tenorite',
                      color: Colors.black,
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Properties',
                  style: TextStyle(
                    fontFamily: 'Tenorite',
                    color: Colors.black,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0,
                    ),
                  ),
                  child: SizedBox(
                    height: mediaHeight * 0.07,
                    width: 110,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            widget.countryDetails.alpha2Code!,
                            style: TextStyle(
                              fontFamily: 'Tenorite',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            widget.countryDetails.name!,
                            style: TextStyle(
                              fontFamily: 'Tenorite',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '7',
                        style: TextStyle(
                          fontFamily: 'Tenorite',
                          color: Colors.white,
                          fontSize: 33,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Material(
              elevation: 5,
              shadowColor: Colors.white,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: mediaHeight * 0.5,
                width: mediaWidth * 0.9,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IndividualPropertyScreen(
                                    propertyAddress: _properties[index],
                                  )),
                        );
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 0),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          _properties[index],
                          style:
                              TextStyle(fontFamily: 'Tenorite', fontSize: 16),
                        ),
                      ),
                    );
                  },
                  itemCount: _properties.length,
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
                    color: Colors.black, AssetImage('assets/images/graph.png')),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                    color: Colors.black,
                    AssetImage('assets/images/search.png')),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                    color: Colors.black, AssetImage('assets/images/doc.png')),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                    color: Colors.black,
                    AssetImage('assets/images/profile.png')),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
