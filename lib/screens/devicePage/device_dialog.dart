import 'package:app/static_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeviceDialog extends StatefulWidget {
  final String name;
  DeviceDialog(this.name);

  @override
  _DeviceDialogState createState() => _DeviceDialogState();
}

class _DeviceDialogState extends State<DeviceDialog> {
  bool _switchValue = true;
  DataSnapshot? data;
  @override
  initState() {
    super.initState();
    getDevices();
  }

  final FirebaseDatabase database = FirebaseDatabase(app: StaticData.app);

  Future<DataSnapshot?> getDevices() async {
    final FirebaseDatabase database = FirebaseDatabase(app: StaticData.app);
    var doc =
        await database.reference().child('devices').child(widget.name).get();
    setState(() {
      data = doc;
    });
    return doc;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: StreamBuilder(
          stream:
              database.reference().child('devices').child(widget.name).onValue,
          builder: (context, AsyncSnapshot<Event> snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            if (snapshot.hasError)
              return Center(
                child: Text('No data Found'),
              );
            if (snapshot.data!.snapshot.value == null)
              return Center(
                child: Text('No data Found'),
              );
              Map map = snapshot.data!.snapshot.value;

            return Center(
              child: InkWell(
                onTap: () {},
                child: Container(
                  color: Colors.white,
                  height: 400,
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            "Device Id - ${widget.name}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                            textScaleFactor: 1,
                          ),
                        ),
                        SizedBox(height: 15),
                        map.containsKey('pH')? Padding(
                      padding:
                          const EdgeInsets.only(top: 18, right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'pH Value',
                            style: GoogleFonts.ptSans(
                              fontSize: 20,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            snapshot.data!.snapshot.value['pH']
                                .toStringAsFixed(3),
                            style: GoogleFonts.ptSans(
                              fontSize: 20,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ):Container(),
                    map.containsKey('pH')?Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, right: 20, left: 20, top: 10),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ):Container(),
                        map.containsKey('Dissolved Oxygen')? Padding(
                      padding:
                          const EdgeInsets.only(top: 8, right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dissolved Oxygen levels',
                            style: GoogleFonts.ptSans(
                              fontSize: 20,
                              color: Colors.black87,
                            ),
                          ),
                          data == null
                              ? Container()
                              : Text(
                                  snapshot
                                      .data!.snapshot.value['Dissolved Oxygen']
                                      .toStringAsFixed(3),
                                  style: GoogleFonts.ptSans(
                                    fontSize: 20,
                                    color: Colors.orange,
                                  ),
                                ),
                        ],
                      ),
                    ):Container(),
                    map.containsKey('Dissolved Oxygen')?Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, right: 20, left: 20, top: 10),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ):Container(),
                        map.containsKey('Temperature')?Padding(
                      padding:
                          const EdgeInsets.only(top: 8, right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Temperature',
                            style: GoogleFonts.ptSans(
                              fontSize: 20,
                              color: Colors.black87,
                            ),
                          ),
                          data == null
                              ? Container()
                              : Text(
                                  snapshot.data!.snapshot.value['Temperature']
                                      .toStringAsFixed(3),
                                  style: GoogleFonts.ptSans(
                                    fontSize: 20,
                                    color: Colors.green,
                                  ),
                                ),
                        ],
                      ),
                    ):Container(),
                    map.containsKey('Temperature')?Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, right: 20, left: 20, top: 10),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ):Container(),
                        SizedBox(height: 10),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 20, right: 20),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: <Widget>[
                        //       Text(
                        //         "Areator Controller",
                        //         style: GoogleFonts.roboto(
                        //           fontSize: 16,
                        //           color: Colors.black87,
                        //         ),
                        //       ),
                        //       Switch(
                        //         activeColor: Colors.black12,
                        //         activeTrackColor: Colors.teal,
                        //         value: _switchValue,
                        //         onChanged: (newValue) {
                        //           setState(() {
                        //             _switchValue = newValue;
                        //           });
                        //         },
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(height: 10),
                        // Padding(
                        //   padding: const EdgeInsets.all(20.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       ElevatedButton(
                        //         onPressed: () async {
                        //           setState(() {
                        //             _refresh = true;
                        //           });
                        //           try {
                        //             await getDevices();
                        //           } catch (e) {}
                        //           setState(() {
                        //             _refresh = false;
                        //           });
                        //         },
                        //         child: _refresh
                        //             ? CircularProgressIndicator(
                        //                 color: Colors.black,
                        //               )
                        //             : Text(
                        //                 'Refresh',
                        //                 style: GoogleFonts.roboto(
                        //                   fontSize: 16,
                        //                   color: Colors.black,
                        //                   fontWeight: FontWeight.bold,
                        //                 ),
                        //               ),
                        //         style: ElevatedButton.styleFrom(
                        //             primary: Theme.of(context).primaryColor,
                        //             padding: EdgeInsets.symmetric(
                        //                 horizontal: 34, vertical: 15),
                        //             shape: RoundedRectangleBorder(
                        //                 borderRadius:
                        //                     BorderRadius.circular(10))),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
