import 'package:app/screens/appDrawer/app_drawer.dart';
import 'package:app/static_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class StatisticsPage extends StatefulWidget {
  final String name;
  const StatisticsPage(this.name);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  initState() {
    super.initState();
    var ref = database.reference().child('devices').child(widget.name);
    ref.onValue.listen((event) => addData(event));
  }

  Map graphs = {};
  addData(event) {
    DataSnapshot data = event.snapshot;
    Map keys = data.value;
    graphs = keys;
    temp.removeAt(0);
    ph.removeAt(0);
    oxy.removeAt(0);
    setState(() {
      Map keys = data.value;
      if (keys.containsKey('Temperature'))
        temp.add(event.snapshot.value['Temperature']);
      if (keys.containsKey('pH')) ph.add(event.snapshot.value['pH']);
      if (keys.containsKey('Dissolved Oxygen'))
        oxy.add(event.snapshot.value['Dissolved Oxygen']);
    });
  }

  List<dynamic> temp = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<dynamic> ph = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<dynamic> oxy = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
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
        body: Container(
          margin: EdgeInsets.only(left: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (!graphs.containsKey('Temperature'))
                    ? Container()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Temperature",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            child: Container(
                              height: 200,
                              margin:
                                  EdgeInsets.only(top: 5, right: 20, left: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFFFC542),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.8),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  margin: EdgeInsets.only(right: 10, top: 7),
                                  child: LineChart(
                                    LineChartData(
                                      gridData: FlGridData(
                                          show: true,
                                          drawHorizontalLine: true,
                                          horizontalInterval: 5,
                                          getDrawingHorizontalLine: (value) {
                                            return FlLine(
                                                color: Colors.white,
                                                strokeWidth: 1);
                                          }),
                                      titlesData: FlTitlesData(
                                        leftTitles: SideTitles(
                                          showTitles: true,
                                          reservedSize: 22,
                                          getTextStyles: (value) =>
                                              const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                          margin: 10,
                                          getTitles: (value) {
                                            if (value.toInt() % 10 == 0) {
                                              return '${value.toInt()}';
                                            } else {
                                              return '';
                                            }
                                          },
                                        ),
                                      ),
                                      minX: 0,
                                      maxX: 10,
                                      maxY: 50,
                                      minY: 0,
                                      lineBarsData: [
                                        LineChartBarData(
                                            spots: List.generate(
                                                temp.length,
                                                (index) => FlSpot(
                                                    double.parse(
                                                        index.toString()),
                                                    double.parse(temp[index]
                                                        .toString()))))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                (!graphs.containsKey('pH'))
                    ? Container()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "PH Value",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            child: Container(
                              height: 200,
                              margin:
                                  EdgeInsets.only(top: 5, right: 20, left: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFF3EC94C),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.8),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  margin: EdgeInsets.only(right: 10, top: 7),
                                  child: LineChart(
                                    LineChartData(
                                      gridData: FlGridData(
                                          show: true,
                                          drawHorizontalLine: true,
                                          horizontalInterval: 2,
                                          getDrawingHorizontalLine: (value) {
                                            return FlLine(
                                                color: Colors.white,
                                                strokeWidth: 1);
                                          }),
                                      titlesData: FlTitlesData(
                                        leftTitles: SideTitles(
                                          showTitles: true,
                                          reservedSize: 22,
                                          getTextStyles: (value) =>
                                              const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                          margin: 10,
                                          getTitles: (value) {
                                            if (value.toInt() % 2 == 0) {
                                              return '${value.toInt()}';
                                            } else {
                                              return '';
                                            }
                                          },
                                        ),
                                      ),
                                      minX: 0,
                                      maxX: 10,
                                      maxY: 14,
                                      minY: 0,
                                      lineBarsData: [
                                        LineChartBarData(
                                            spots: List.generate(
                                                ph.length,
                                                (index) => FlSpot(
                                                    double.parse(
                                                        index.toString()),
                                                    double.parse(
                                                        ph[index].toString()))))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                (!graphs.containsKey('Dissolved Oxygen'))
                    ? Container()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Oxygen Value",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            child: Container(
                              height: 200,
                              margin:
                                  EdgeInsets.only(top: 5, right: 20, left: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFF359EBF),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.8),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  margin: EdgeInsets.only(right: 10, top: 7),
                                  child: LineChart(
                                    LineChartData(
                                      gridData: FlGridData(
                                        horizontalInterval: 20,
                                        show: true,
                                        drawHorizontalLine: true,
                                        getDrawingHorizontalLine: (value) {
                                          return FlLine(
                                              color: Colors.white,
                                              strokeWidth: 1);
                                        },
                                      ),
                                      titlesData: FlTitlesData(
                                        leftTitles: SideTitles(
                                          showTitles: true,
                                          reservedSize: 22,
                                          getTextStyles: (value) =>
                                              const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                          margin: 10,
                                          getTitles: (value) {
                                            if (value.toInt() % 20 == 0) {
                                              return '${value.toInt()}';
                                            } else {
                                              return '';
                                            }
                                          },
                                        ),
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
                                              double.parse(index.toString()),
                                              double.parse(
                                                  oxy[index].toString()),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
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
