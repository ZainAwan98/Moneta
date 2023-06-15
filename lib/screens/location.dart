import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:countries_utils/countries_utils.dart';
import 'package:moneta_project/screens/location_details.dart';
import 'package:moneta_project/utils/route_helper.dart';

import '../utils/color_constants.dart';
import 'individual_property.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

// class Countries {
//   String code;
//   String name;
//   Countries({
//     required this.code,
//     required this.name,
//   });
// }

class _LocationScreenState extends State<LocationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  List<Country> _countries = Countries.all();

  final TextStyle _textStyle = TextStyle(
    fontFamily: 'Tenorite',
  );
  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushNamed(context, RouteHelper.homeRoute);
    }

    if (index == 2) {
      Navigator.pushNamed(context, RouteHelper.monitoringRoute);
    }
    if (index == 3) {
      Navigator.pushNamed(context, RouteHelper.accountRoute);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                InkResponse(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('assets/images/arrow_back.png')),
                SizedBox(
                  width: mediaWidth * 0.28,
                ),
                Text(
                  'Location',
                  style: _textStyle.copyWith(
                      color: Colors.black,
                      fontSize: 34,
                      fontWeight: FontWeight.w600),
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: Colors.grey),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: AppColors.primaryColor,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.white,
                      onPressed: () {
                        // Perform search
                      },
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              childAspectRatio: 1.6,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(_countries.length, (index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LocationDetailsScreen(
                                countryDetails: _countries[index],
                              )),
                    );
                  },
                  child: countryTileWidget(
                    context,
                    _countries[index].alpha2Code!,
                    _countries[index].name!,
                  ),
                );
              }),
            ),
          ]),
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

Widget countryTileWidget(
  BuildContext context,
  String countryCode,
  String countryName,
) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    margin: EdgeInsets.symmetric(vertical: 0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Colors.grey,
        width: 0,
      ),
    ),
    child: SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            countryCode,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'Tenorite',
            ),
          ),
          Flexible(
            child: Text(
              countryName,
              style: TextStyle(
                  fontFamily: 'Tenorite',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.fade),
            ),
          ),
        ],
      ),
    ),
  );
}
