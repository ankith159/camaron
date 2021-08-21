import 'package:app/static_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeviceOnePage extends StatefulWidget {
  final String name;
  DeviceOnePage(this.name);

  @override
  _DeviceOnePageState createState() => _DeviceOnePageState();
}

class _DeviceOnePageState extends State<DeviceOnePage> {
  bool _switchValue = true;
  DataSnapshot? data;
  bool _refresh = false;
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
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            widget.name,
            style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
            textScaleFactor: 1,
          ),
        ),
      ),
      body: StreamBuilder(
          stream:
              database.reference().child('devices').child(widget.name).onValue,
          builder: (context, AsyncSnapshot<Event> snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            return SafeArea(
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
                    Padding(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, right: 20, left: 20, top: 10),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Padding(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, right: 20, left: 20, top: 10),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Padding(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, right: 20, left: 20, top: 10),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Areator Controller",
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          Switch(
                            activeColor: Colors.black12,
                            activeTrackColor: Colors.teal,
                            value: _switchValue,
                            onChanged: (newValue) {
                              setState(() {
                                _switchValue = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 58),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
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
                                  color: Theme.of(context).primaryColor,
                                  width: 1),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 34, vertical: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(bottom: 10, right: 52),
                        //   child: ElevatedButton(
                        //     onPressed: () async {
                        //       setState(() {
                        //         _refresh = true;
                        //       });
                        //       try {
                        //         await getDevices();
                        //       } catch (e) {}
                        //       setState(() {
                        //         _refresh = false;
                        //       });
                        //     },
                        //     child: _refresh
                        //         ? CircularProgressIndicator(
                        //             color: Colors.black,
                        //           )
                        //         : Text(
                        //             'Refresh',
                        //             style: GoogleFonts.roboto(
                        //               fontSize: 16,
                        //               color: Colors.black,
                        //               fontWeight: FontWeight.bold,
                        //             ),
                        //           ),
                        //     style: ElevatedButton.styleFrom(
                        //         primary: Theme.of(context).primaryColor,
                        //         padding: EdgeInsets.symmetric(
                        //             horizontal: 34, vertical: 15),
                        //         shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(10))),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
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
              Navigator.pop(context);
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
