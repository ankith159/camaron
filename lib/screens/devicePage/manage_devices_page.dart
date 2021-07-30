import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_new_device.dart';
import 'device_one_page.dart';

class ManageDevicePage extends StatefulWidget {
  const ManageDevicePage({Key? key}) : super(key: key);

  @override
  _ManageDevicePageState createState() => _ManageDevicePageState();
}

class _ManageDevicePageState extends State<ManageDevicePage> {
  @override
  Widget build(BuildContext context) {
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
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20),
            ManageDeviceCard(
              name: 'Device 1',
            ),
            SizedBox(height: 10),
            ManageDeviceCard(
              name: 'Device 2',
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: () {},
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/add.svg',
              width: 20,
              height: 20,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNewDevicePage(),
                ),
              );
            },
          ),
        ),
      ),
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
            builder: (context) => DeviceOnePage(),
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
