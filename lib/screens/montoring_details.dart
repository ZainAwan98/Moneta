import 'package:flutter/material.dart';
import 'package:moneta_project/utils/route_helper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import '../utils/color_constants.dart';
import 'package:intl/intl.dart';

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

class MonitoringDetailsScreen extends StatefulWidget {
  String monitoringAddress;
  MonitoringDetailsScreen({required this.monitoringAddress});
  @override
  _MonitoringDetailsScreenState createState() =>
      _MonitoringDetailsScreenState();
}

class _MonitoringDetailsScreenState extends State<MonitoringDetailsScreen> {
  List<Statistics> _statsData = [
    Statistics(amount: '\$400,00', title: 'Price'),
    Statistics(amount: '40%', title: 'Down Payment'),
    Statistics(amount: '6%', title: 'Mortgage rate'),
    Statistics(amount: '6%', title: 'Rent per month'),
    Statistics(amount: '5.5%', title: 'Inflation rate'),
    Statistics(amount: '2.5%', title: 'Property tax'),
    Statistics(amount: '\$700', title: 'Insurance'),
    Statistics(amount: '\$200', title: 'Initial expense'),
    Statistics(amount: '\$600', title: 'Monthly expense'),
  ];

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
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
                Flexible(
                  child: Text(
                    'Monitoring',
                    style: TextStyle(
                      fontFamily: 'Tenorite',
                      color: Colors.black,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.monitoringAddress,
                    style: TextStyle(
                      fontFamily: 'Tenorite',
                      color: Colors.black,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            // Add the line chart widget here
            SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
              height: 10,
            ),

            SizedBox(
              height: mediaHeight * 0.37,
              child: ListView(
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
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.7,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: List.generate(_statsData.length, (index) {
                      return _buildStatisticTile(
                          _statsData[index].title, _statsData[index].amount);
                    }),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
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
                              'Delete from list',
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
                ],
              ),
            )
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

  Widget _buildXAxisRow() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(55, 10, 20, 5),
            child: Divider(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChartRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
            child: Text(
              "\$",
              style: TextStyle(
                fontFamily: 'Tenorite',
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 20, 10),
            child: Divider(
              color: Colors.grey,
            ),
          ),
        ),
      ],
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

  Widget _buildStatisticTile(String title, String value) {
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
                  fontFamily: 'Tenorite', fontSize: 17, color: Colors.black),
            ),
            Text(
              value,
              style: const TextStyle(
                  fontFamily: 'Tenorite', fontSize: 17, color: Colors.grey),
            ),
          ],
        ),
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
