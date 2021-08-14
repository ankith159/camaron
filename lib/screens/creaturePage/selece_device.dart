import 'package:app/screens/creaturePage/creatures_page.dart';
import 'package:app/static_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';

class SelectDevicePage extends StatefulWidget {
  const SelectDevicePage({Key? key}) : super(key: key);

  @override
  _SelectDevicePageState createState() => _SelectDevicePageState();
}

class _SelectDevicePageState extends State<SelectDevicePage> {
  @override
  void initState() {
    super.initState();
    getDevices();
  }

  List<DataSnapshot?> deviceList = [];
  var list = [];

  Future getDevices() async {
    var _auth = auth.FirebaseAuth.instance;
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
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            " Manage Devices",
            style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
            textScaleFactor: 1,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(15),
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (ctx, index) => ManageDeviceCard(name: list[index])),
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: FloatingActionButton(
      //     backgroundColor: Theme.of(context).primaryColor,
      //     onPressed: () {},
      //     child: IconButton(
      //       icon: Icon(Icons.add),
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => CreaturesPage(),
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}

class ManageDeviceCard extends StatelessWidget {
  final String name;
  const ManageDeviceCard({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreaturesPage(name),
          ),
        );
      },
      child: Container(
        child: Text(
          "$name",
          style: GoogleFonts.roboto(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/next.png",
            ),
            alignment: Alignment.topRight,
            fit: BoxFit.contain,
          ),
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
