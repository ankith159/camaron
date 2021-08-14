import 'dart:async';
import 'dart:math';

import 'package:app/screens/appDrawer/app_drawer.dart';
import 'package:app/static_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:high_chart/high_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  initState() {
    super.initState();
    var ref = database.reference().child('devices').child('CAM001');
    ref.onValue.listen((event) => addData(event));
  }

  addData(event) {
    print('yo');
    // dat.add(
    //     TimeSeriesSales(DateTime.now(), event.snapshot.value['Temperature']));
    // });
    temp.removeAt(0);
    ph.removeAt(0);
    oxy.removeAt(0);
    setState(() {
      temp.add(event.snapshot.value['Temperature']);
      ph.add(event.snapshot.value['pH'] ?? ph.last);
      oxy.add(event.snapshot.value['Dissolved Oxygen'] ?? oxy.last);
    });
  }

  List<DataSnapshot?> data = [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ];
  List<double> temp = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<double> ph = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<double> oxy = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  final FirebaseDatabase database = FirebaseDatabase(app: StaticData.app);
  List<TimeSeriesSales> dat = [];

  // Future<DataSnapshot?> getDevices() async {
  //   var doc = await database.reference().child('devices').child('CAM001').get();
  //   data.removeAt(0);
  //   temp.removeAt(0);
  //   setState(() {
  //     data.add(doc);
  //     temp.add(doc!.value['Temperature']);
  //   });
  //   // print(data[9]!.value['Temperature']);
  //   return doc;
  // }

  @override
  Widget build(BuildContext context) {
    // Stream<int> stream = Stream.periodic(Duration(seconds: 1), (a) {
    //   getDevices();
    //   return a;
    // });

    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.all(0),
            child: Text(
              "Statistics",
              style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
              textScaleFactor: 1,
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: LineChart(LineChartData(
                minX: 0,
                maxX: 10,
                maxY: 50,
                minY: 0,
                lineBarsData: [
                  LineChartBarData(
                      spots: List.generate(
                          temp.length,
                          (index) => FlSpot(
                              double.parse(index.toString()), temp[index])))
                ],
              )),
            ),
            Flexible(
              child: LineChart(LineChartData(
                minX: 0,
                maxX: 10,
                maxY: 14,
                minY: 0,
                lineBarsData: [
                  LineChartBarData(
                      spots: List.generate(
                          ph.length,
                          (index) => FlSpot(
                              double.parse(index.toString()), ph[index])))
                ],
              )),
            ),
            Flexible(
              child: LineChart(LineChartData(
                titlesData: FlTitlesData(
                  leftTitles: SideTitles(
                    showTitles: true,
                    interval: 20,
                    getTextStyles: (value) => const TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                    margin: 15,
                  ),
                  rightTitles: SideTitles(showTitles: false),
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    margin: 16,
                  ),
                  topTitles: SideTitles(showTitles: false),
                ),
                gridData: FlGridData(
                  show: true,
                  verticalInterval: 20,
                  drawHorizontalLine: true,
                  drawVerticalLine: true,
                  checkToShowHorizontalLine: (value) {
                    return value.toInt() == 0;
                  },
                  checkToShowVerticalLine: (value) {
                    return value.toInt() == 0;
                  },
                ),
                minX: 0,
                maxX: 10,
                maxY: 180,
                minY: 0,
                lineBarsData: [
                  LineChartBarData(
                      spots: List.generate(
                          oxy.length,
                          (index) => FlSpot(
                              double.parse(index.toString()), oxy[index])))
                ],
              )),
            )
          ],
        )
        // body: Container(
        //   padding: EdgeInsets.all(15),
        //   child: ListView(
        //     children: <Widget>[
        //       SizedBox(height: 20),
        //       GestureDetector(
        //         onTap: () {},
        //         child: Container(
        //           child: Text(
        //             "Device 1",
        //             style: GoogleFonts.roboto(
        //               fontSize: 20,
        //               color: Colors.black,
        //             ),
        //           ),
        //           padding: EdgeInsets.all(18),
        //           decoration: BoxDecoration(
        //             image: DecorationImage(
        //               image: AssetImage(
        //                 "assets/next.png",
        //               ),
        //               alignment: Alignment.topRight,
        //               fit: BoxFit.contain,
        //             ),
        //             color: Theme.of(context).primaryColor,
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //         ),
        //       ),
        //       SizedBox(height: 10),
        //       GestureDetector(
        //         onTap: () {},
        //         child: Container(
        //           child: Text(
        //             "Device 2",
        //             style: GoogleFonts.roboto(
        //               fontSize: 20,
        //               color: Colors.black,
        //             ),
        //           ),
        //           padding: EdgeInsets.all(18),
        //           decoration: BoxDecoration(
        //             image: DecorationImage(
        //               image: AssetImage(
        //                 "assets/next.png",
        //               ),
        //               alignment: Alignment.topRight,
        //               fit: BoxFit.contain,
        //             ),
        //             color: Theme.of(context).primaryColor,
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //         ),
        //       ),
        //       SizedBox(height: 10),
        //       GestureDetector(
        //         onTap: () {},
        //         child: Container(
        //           child: Text(
        //             "Device 3",
        //             style: GoogleFonts.roboto(
        //               fontSize: 20,
        //               color: Colors.black,
        //             ),
        //           ),
        //           padding: EdgeInsets.all(18),
        //           decoration: BoxDecoration(
        //             image: DecorationImage(
        //               image: AssetImage(
        //                 "assets/next.png",
        //               ),
        //               alignment: Alignment.topRight,
        //               fit: BoxFit.contain,
        //             ),
        //             color: Theme.of(context).primaryColor,
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}

class TimeSeriesSales {
  final DateTime time;
  final double sales;

  TimeSeriesSales(this.time, this.sales);
}
