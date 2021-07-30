import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewDevicePage extends StatefulWidget {
  const AddNewDevicePage({Key? key}) : super(key: key);

  @override
  _AddNewDevicePageState createState() => _AddNewDevicePageState();
}

class _AddNewDevicePageState extends State<AddNewDevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            "Add Devices",
            style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
            textScaleFactor: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1,
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: GoogleFonts.ptSans(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Phone Number",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1,
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        labelStyle: GoogleFonts.ptSans(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Device Id",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1,
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Device Id",
                        labelStyle: GoogleFonts.ptSans(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100, left: 100, top: 30),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 58,
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Add Device",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    textScaleFactor: 1,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
