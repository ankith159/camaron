import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeviceOnePage extends StatefulWidget {
  const DeviceOnePage({Key? key}) : super(key: key);

  @override
  _DeviceOnePageState createState() => _DeviceOnePageState();
}

class _DeviceOnePageState extends State<DeviceOnePage> {
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            "Device 1",
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  "Device Id - 123456",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                  textScaleFactor: 1,
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(top: 18, right: 20, left: 20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "PH Value",
                    labelStyle: GoogleFonts.ptSans(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 20, left: 20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Dissolved Oxygen Levles",
                    labelStyle: GoogleFonts.ptSans(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 20, left: 20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Temprature",
                    labelStyle: GoogleFonts.ptSans(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: Text(
                      "Areator Controller",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 148),
                    child: Switch(
                      activeColor: Colors.black12,
                      activeTrackColor: Colors.teal,
                      value: _switchValue,
                      onChanged: (newValue) {
                        setState(() {
                          _switchValue = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 58),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, left: 52),
                    child: OutlinedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DeleteDialog();
                            });
                      },
                      child: Text(
                        'Delete',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              color: Theme.of(context).primaryColor, width: 1),
                          padding: EdgeInsets.symmetric(
                              horizontal: 34, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 52),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Refresh',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 34, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Delete Device 1?'),
      actions: [
        CupertinoDialogAction(
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeviceOnePage(),
                ),
              );
            },
            child: Text(
              'cancel',
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.black, width: 1),
                padding: EdgeInsets.symmetric(horizontal: 34, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        CupertinoDialogAction(
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Delete',
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                padding: EdgeInsets.symmetric(horizontal: 34, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
      ],
    );
  }
}
