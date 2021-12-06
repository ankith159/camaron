import 'package:app/screens/appDrawer/app_drawer.dart';
import 'package:app/screens/devicePage/device_dialog.dart';
import 'package:app/static_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final List<String> items = <String>['Device 1', 'Device 2'];
  String value = items.first;

  @override
  void initState() {
    super.initState();
    getDevices();
  }

  List<DataSnapshot?> deviceList = [];
  var list = [];

  Future<List<DataSnapshot?>> getDevices() async {
    var _auth = auth.FirebaseAuth.instance;
    print(_auth.currentUser!.uid);
    QuerySnapshot<Map<String, dynamic>> devices = await FirebaseFirestore
        .instance
        .collection('devices')
        .where('uid', isEqualTo: _auth.currentUser!.uid)
        .get();
    final FirebaseDatabase database = FirebaseDatabase(app: StaticData.app);

    devices.docs.forEach((element) async {
      var doc = await database
          .reference()
          .child('devices')
          .child(element.data()['deviceId'])
          .get();
      deviceList.add(doc);
      setState(() {
        deviceList = deviceList;
      });
    });
    return deviceList;
  }

  @override
  Widget build(BuildContext context) {
    Map data = {};
    deviceList.forEach((element) {
      data.putIfAbsent(element!.key, () => element.value);
    });
    list = data.keys.toList();
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(100),
          child: Text(
            "Home",
            style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
            textScaleFactor: 1,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor),
              child: ExpansionTile(
                collapsedTextColor: Colors.black,
                textColor: Colors.black,
                collapsedBackgroundColor: Theme.of(context).primaryColor,
                title: Text(
                  'Select Device',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                children: List.generate(
                  list.length,
                  (index) => Container(
                    color: Colors.white,
                    child: ListTile(
                        title: Text(
                          list[index],
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        onTap: () {
                          showGeneralDialog(
                            context: context,
                            pageBuilder: (context, _, a) {
                              return DeviceDialog(list[index]);
                            },
                          );
                        }),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
