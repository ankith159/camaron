import 'package:app/screens/devicePage/device_page.dart';
import 'package:app/screens/tab_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNewDevicePage extends StatefulWidget {
  const AddNewDevicePage({Key? key}) : super(key: key);

  @override
  _AddNewDevicePageState createState() => _AddNewDevicePageState();
}

class _AddNewDevicePageState extends State<AddNewDevicePage> {
  addDevice() {
    var _auth = auth.FirebaseAuth.instance;
    FirebaseFirestore.instance.collection('devices').doc().set({
      'deviceId': deviceId.text,
      'uid': _auth.currentUser!.uid,
      'phone': _auth.currentUser!.phoneNumber,
      'name': name.text
    });
    // print(StaticData.app);
    // final FirebaseDatabase database = FirebaseDatabase(app: StaticData.app);
    // print(',id');
    // var _auth = auth.FirebaseAuth.instance;
    // await database
    //     .reference()
    //     .child('devices')
    //     .child(deviceId.text)
    //     .set({'uid': _auth.currentUser!.uid});
  }

  TextEditingController deviceId = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      controller: name,
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
                      controller: number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
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
                      controller: deviceId,
                      decoration: InputDecoration(
                        hintText: "Device Id",
                        hintStyle: GoogleFonts.ptSans(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
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
                  onPressed: () {
                    if (number.text.length != 10) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Please enter a valid phone number')));
                      return;
                    }
                    try {
                      addDevice();
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Device added Successfully')));
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TabPage(),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error adding device')));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
