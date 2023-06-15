import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class SimulationScreen extends StatefulWidget {
  @override
  _SimulationScreenState createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<SimulationScreen> {
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Simulation',
                  style: TextStyle(
                      fontFamily: 'Tenorite',
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),

            Divider(color: Colors.black),
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
                    _lineGraph(mediaHeight, mediaWidth),
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

            SizedBox(height: 8),
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

            // Add the line chart widget here
            SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Statistics',
                  style: TextStyle(
                      fontFamily: 'Tenorite',
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
            ),

            SizedBox(
              height: mediaHeight * 0.33,
              child: GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                crossAxisSpacing: 30,
                mainAxisSpacing: 20,
                childAspectRatio: 1.7,
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(_statsData.length, (index) {
                  // final controller =
                  //     TextEditingController(text: _statsData[index].amount);
                  final controller = TextEditingController();
                  return _buildStatisticTile(
                    _statsData[index].title,
                    _statsData[index].amount,
                    index,
                    controller,
                  );
                }),
              ),
            ),

            const SizedBox(height: 5),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteHelper.locationRoute);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 50,
                      width: mediaWidth * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColors.primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Search Location',
                            style: TextStyle(
                                fontFamily: 'Tenorite',
                                color: Colors.white,
                                fontSize: 15),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
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

  Widget _lineGraph(mediaHeight, mediaWidth) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: SizedBox(
        height: mediaHeight * 0.3,
        width: mediaWidth * 0.84,
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
            majorGridLines:
                MajorGridLines(width: 0), // Hide X-axis major gridlines
            minorGridLines:
                MinorGridLines(width: 0), // Hide X-axis minor gridlines
          ),
          // Chart title

          // Enable legend

          // Enable tooltip
          primaryYAxis: NumericAxis(
            labelFormat: '\$',
            majorGridLines:
                MajorGridLines(width: 0), // Hide Y-axis major gridlines
            minorGridLines:
                MinorGridLines(width: 0), // Hide Y-axis minor gridlines
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
    );
  }
  //  SfCartesianChart(
  //               primaryXAxis: CategoryAxis(),
  //               // Chart title
  //               title: ChartTitle(text: 'Half yearly sales analysis'),
  //               // Enable legend
  //               legend: Legend(isVisible: true),
  //               // Enable tooltip
  //               tooltipBehavior: TooltipBehavior(enable: true),
  //               series: <ChartSeries<SalesData, String>>[
  //                 LineSeries<SalesData, String>(
  //                     dataSource: data,
  //                     xValueMapper: (SalesData sales, _) => sales.title,
  //                     yValueMapper: (SalesData sales, _) => sales.value,
  //                     name: 'Sales',
  //                     // Enable data label
  //                     dataLabelSettings: DataLabelSettings(isVisible: true))
  //               ]),

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
}
