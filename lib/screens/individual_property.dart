import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter_plot/flutter_plot.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../utils/color_constants.dart';
import '../utils/route_helper.dart';

class IndividualPropertyScreen extends StatefulWidget {
  String propertyAddress;
  IndividualPropertyScreen({required this.propertyAddress});

  @override
  State<IndividualPropertyScreen> createState() =>
      _IndividualPropertyScreenState();
}

class Statistics {
  String title;
  String amount;
  Statistics({
    required this.amount,
    required this.title,
  });
}

class SalesData {
  String title;
  int value;
  SalesData(
    this.title,
    this.value,
  );
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

class _IndividualPropertyScreenState extends State<IndividualPropertyScreen> {
  bool _isBookmarked = false;
  List<ChartData> chartData = [
    ChartData('Beverages', 25),
    ChartData('Seafood', 15),
    ChartData('Produce', 15),
    ChartData('Meat', 5),
    ChartData('Grains', 10),
    ChartData('Dairy', 10),
    ChartData('Confection', 20),
  ];

  final List<double> rents = [];
  final List<double> expenses = [];
  final List<double> sqfts = [];
  List<SalesData> data1 = [
    SalesData('1 yr', 5),
    SalesData('5 yr', 40),
    SalesData('10 yr', 5),
    SalesData('15 yr', 40),
  ];

  // List<SalesData> data2 = [
  //   SalesData('1 yr', 15),
  //   SalesData('5 yr', 20),
  //   SalesData('10 yr', 30),
  //   SalesData('15 yr', 40),
  // ];
  // List<SalesData> data3 = [
  //   SalesData('1 yr', 10),
  //   SalesData('5 yr', 10),
  //   SalesData('10 yr', 10),
  //   SalesData('15 yr', 10),
  // ];
  // List<SalesData> data4 = [
  //   SalesData('1 yr', 1),
  //   SalesData('5 yr', 5),
  //   SalesData('10 yr', 7),
  //   SalesData('15 yr', 9),
  // ];

  List<Statistics> _statsData = [
    Statistics(amount: '400,00', title: 'Price'),
    Statistics(amount: '40', title: 'Down Payment'),
    Statistics(amount: '6', title: 'Mortgage rate'),
    Statistics(amount: '6', title: 'Rent per month'),
    Statistics(amount: '5.5', title: 'Inflation rate'),
    Statistics(amount: '2.5', title: 'Property tax'),
    Statistics(amount: '700', title: 'Insurance'),
    Statistics(amount: '200', title: 'Initial expense'),
    Statistics(amount: '600', title: 'Monthly expense'),
  ];

  final List<Point> data = [
    const Point(21.0, 19.0),
    const Point(3.0, 7.0),
    const Point(8.0, 9.0),
    const Point(11.0, 14.0),
    const Point(18.0, 17.0),
    const Point(7.0, 8.0),
    const Point(-4.0, -4.0),
    const Point(6.0, 12.0),
  ];
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

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/arrow_back.png',
                    height: 17,
                  ),
                ),
                SizedBox(
                  width: mediaWidth * 0.28,
                ),
                Text(
                  'Properties',
                  style: TextStyle(
                    fontFamily: 'Tenorite',
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: mediaWidth * 0.15,
                ),
                InkResponse(
                  onTap: () {
                    setState(() {
                      _isBookmarked = !_isBookmarked;
                    });
                  },
                  child: Icon(
                    _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(color: Colors.black),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.propertyAddress,
                      style: TextStyle(
                        fontFamily: 'Tenorite',
                        color: Colors.black,
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Container(
                height: mediaHeight * 0.3,
                width: mediaWidth * 0.6,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SizedBox(
                        height: mediaHeight * 0.3,
                        width: mediaWidth * 0.84,
                        child: SfCartesianChart(
                          primaryXAxis: CategoryAxis(
                            majorGridLines: MajorGridLines(
                                width: 0), // Hide X-axis major gridlines
                            minorGridLines: MinorGridLines(
                                width: 0), // Hide X-axis minor gridlines
                          ),
                          // Chart title

                          // Enable legend

                          // Enable tooltip
                          primaryYAxis: NumericAxis(
                            labelFormat: '\$',
                            majorGridLines: MajorGridLines(
                                width: 0), // Hide Y-axis major gridlines
                            minorGridLines: MinorGridLines(
                                width: 0), // Hide Y-axis minor gridlines
                            axisLine: AxisLine(
                              width: 0,
                            ), // Hide Y-axis line
                          ),
                          tooltipBehavior: TooltipBehavior(
                            enable: true,
                          ),
                          series: <ChartSeries<SalesData, String>>[
                            StackedLineSeries<SalesData, String>(
                              markerSettings: MarkerSettings(
                                color: Colors.purple,
                                borderColor: AppColors.primaryColor,
                                width: 12,
                                isVisible: true,
                              ),
                              dataSource: data1,
                              xValueMapper: (SalesData sales, _) => sales.title,
                              yValueMapper: (SalesData sales, _) => sales.value,
                              name: 'Sales 2',
                              color: Colors.blue, // Set the color for this line
                              // Enable data label
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      right: mediaWidth * 0.5,
                      top: 20,
                      bottom: mediaHeight * 0.19,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        child: Container(
                          width: mediaWidth * 0.25,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              _buildRow('Initial Investment', '\$80k'),
                              _buildRow('Asset in 5 years', '\$80k'),
                              _buildRow('Asset in 5 years', '\$80k'),
                              _buildRow('Years for double investment', '\$80k'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCircleText(Colors.blue, 'Value'),
                  _buildCircleText(Colors.orange, 'Mortgage'),
                  _buildCircleText(Colors.yellow, 'True Asset'),
                  _buildCircleText(
                      Color.fromARGB(255, 184, 98, 199), 'Expense'),
                ],
              ),
            ),
            SizedBox(
              height: mediaHeight * 0.35,
              child: ListView(
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Property Info',
                        style: TextStyle(
                            fontFamily: 'Tenorite',
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      _propertyInfo(
                        title: 'Bedroom 3 \nBath 2\nSize 1,1,2 \nsqft',
                        value: '\$379,000',
                      ),
                      _propertyInfo(
                        title: 'Property type\nSingle Family',
                        value: '',
                      ),
                      _propertyInfo(
                        title: 'Built in 1987',
                        value: '',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Statistics',
                        style: TextStyle(
                            fontFamily: 'Tenorite',
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ),
                  GridView.count(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.7,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: List.generate(_statsData.length, (index) {
                      final controller = TextEditingController();
                      return _buildStatisticTile(_statsData[index].title,
                          _statsData[index].amount, index, controller);
                    }),
                  ),
                  InkResponse(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Text('Google Access Link',
                              style: TextStyle(
                                fontFamily: 'Tenorite',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              )),
                          Icon(Icons.attachment),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.propertyAddress,
                          style: TextStyle(
                            fontFamily: 'Tenorite',
                            color: Colors.black,
                            fontSize: 17,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                              fixedSize: Size(mediaWidth * 0.4, 50),
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Get Connected',
                              style: TextStyle(
                                fontFamily: 'Tenorite',
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Comp',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Tenorite',
                            fontWeight: FontWeight.w600)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
                    child: Container(
                      height: mediaHeight * 0.3,
                      width: mediaWidth * 0.6,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Plot(
                        height: 200.0,
                        data: data,
                        gridSize: new Offset(2.0, 2.0),
                        style: new PlotStyle(
                          pointRadius: 3.0,
                          outlineRadius: 1.0,
                          primary: Colors.white,
                          secondary: Colors.orange,
                          textStyle: new TextStyle(
                            fontSize: 8.0,
                            color: Colors.blueGrey,
                          ),
                          axis: Colors.blueGrey[600],
                          gridline: Colors.white,
                        ),
                        padding:
                            const EdgeInsets.fromLTRB(40.0, 12.0, 12.0, 40.0),
                        xTitle: 'sqft',
                        yTitle: 'rent/month',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text('City Info',
                        style: TextStyle(
                            fontFamily: 'Tenorite',
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      _propertyInfo(
                        title: 'Since 2000\nPopulation Change',
                        value: '+142.5%',
                      ),
                      _propertyInfo(
                        title: 'Estimated median\nhousehold income\nin 2019',
                        value: '\$101,366',
                      ),
                      _propertyInfo(
                        title: 'Allen: \$101,944\nTx: \$64,554',
                        value: '',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Common Industries',
                        style: TextStyle(
                            fontFamily: 'Tenorite',
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: SfCircularChart(
                      legend: Legend(isVisible: true),
                      series: <CircularSeries>[
                        DoughnutSeries<ChartData, String>(
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          pointColorMapper: (ChartData data, _) {
                            switch (data.x) {
                              case 'Beverages':
                                return Colors.pink;
                              case 'Seafood':
                                return Colors.green;
                              case 'Produce':
                                return Colors.orange;
                              case 'Meat':
                                return Colors.pinkAccent;
                              case 'Grains':
                                return Colors.blue;
                              case 'Dairy':
                                return Colors.black;
                              case 'Confection':
                                return Colors.greenAccent;
                              default:
                                return Colors.grey;
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 7,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return _bulletText(
                                    text:
                                        'Professional,scientific,technical,services(10.3%)');
                              },
                            ),
                          ],
                        ) // add child widget here
                        ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Allen compared to Texas state average:',
                        style: TextStyle(
                            fontFamily: 'Tenorite',
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 12,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return _bulletText(
                                    text:
                                        'Median household income above state average');
                              },
                            ),
                          ],
                        ) // add child widget here
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
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

  Widget _buildStatisticTile(
      String title, String value, int index, TextEditingController controller) {
    String prefix = '';
    String suffix = '';

    if (title == 'Price' ||
        title == 'Insurance' ||
        title == 'Initial expense' ||
        title == 'Monthly expense') {
      prefix = '\$';
    } else {
      suffix = '%';
    }
    controller.text = '$prefix$value$suffix';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Container(
        height: 20,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontFamily: 'Tenorite', fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 15,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      readOnly: title == 'Price' ? true : false,
                      controller: controller,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^[\d\.]+$'),
                        ),
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '',
                        hintStyle: TextStyle(
                          fontFamily: 'Tenorite',
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Tenorite',
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                      onChanged: (newValue) {
                        if (title == 'Price' ||
                            title == 'Insurance' ||
                            title == 'Initial expense' ||
                            title == 'Monthly expense') {
                          // controller.text = '\$$newValue';
                          _statsData[index].amount = newValue;
                        } else {
                          // controller.text = '$newValue%';
                          _statsData[index].amount = newValue;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String title, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Tenorite',
                    fontSize: 5,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  value,
                  style: TextStyle(
                    fontFamily: 'Tenorite',
                    fontSize: 5,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Divider(
          height: 0,
          indent: 24,
          endIndent: 25,
          thickness: 0,
          color: Colors.grey,
        ),
        SizedBox(
          height: 3,
        ),
      ],
    );
  }

  Widget _buildCircleText(Color color, String text) {
    return Row(
      children: [
        CircleAvatar(backgroundColor: color, radius: 6),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(fontFamily: 'Tenorite', fontSize: 10),
        ),
      ],
    );
  }
}

class _bulletText extends StatelessWidget {
  String text;
  _bulletText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            color: Colors.black,
            size: 7,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontFamily: 'Tenorite', fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

class _propertyInfo extends StatelessWidget {
  String title;
  String value;
  _propertyInfo({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 0,
          ),
        ),
        child: Center(
          child: SizedBox(
            height: 65,
            width: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: FittedBox(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontFamily: 'Tenorite',
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        value,
                        style: TextStyle(
                          fontFamily: 'Tenorite',
                          color: Colors.yellow,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
