import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PondCal extends StatefulWidget {
  const PondCal({Key? key}) : super(key: key);

  @override
  _PondCalState createState() => _PondCalState();
}

class _PondCalState extends State<PondCal> {
  String? shape;
  String? sides;
  TextEditingController dimensionA = TextEditingController();
  TextEditingController dimensionB = TextEditingController();
  TextEditingController depth = TextEditingController();
  var user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            "Feeding Calculator",
            style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
            textScaleFactor: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                        value: shape,
                        onChanged: (val) {
                          setState(() {
                            shape = val;
                          });
                        },
                        items: [
                          DropdownMenuItem(
                            child: Text('Rectangle'),
                            value: 'rectangle',
                          ),
                          DropdownMenuItem(
                            child: Text('Circle or Ellipse'),
                            value: 'circle',
                          ),
                          DropdownMenuItem(
                            child: Text('U-shape'),
                            value: 'uShape',
                          ),
                          DropdownMenuItem(
                            child: Text('Irregular'),
                            value: 'irregular',
                          ),
                          DropdownMenuItem(
                            child: Text('L-shape'),
                            value: 'lShape',
                          ),
                          DropdownMenuItem(
                            child: Text('Peanut'),
                            value: 'peanut',
                          ),
                          DropdownMenuItem(
                            child: Text('Bean'),
                            value: 'bean',
                          ),
                          DropdownMenuItem(
                            child: Text('Right triangle'),
                            value: 'rightTriangle',
                          ),
                        ],
                        hint: Text('Shape')),
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                        value: sides,
                        onChanged: (val) {
                          setState(() {
                            sides = val;
                          });
                        },
                        items: [
                          DropdownMenuItem(
                            child: Text('Straight'),
                            value: 'straight',
                          ),
                          DropdownMenuItem(
                            child: Text('Irregular'),
                            value: 'irregular',
                          ),
                        ],
                        hint: Text('Sides')),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Depth'),
                  Expanded(
                    child: ListTile(
                      title: TextField(
                        controller: depth,
                      ),
                      trailing: Text('m'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Dimensions (A)'),
                  Expanded(
                    child: ListTile(
                      title: TextField(
                        controller: dimensionA,
                      ),
                      trailing: Text('m'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Dimensions (B)'),
                  Expanded(
                    child: ListTile(
                      title: TextField(controller: dimensionB),
                      trailing: Text('m'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(user!.uid)
                            .update({
                          'pondCalculator': {
                            'shape': shape,
                            'sides': sides,
                            'depth': depth.text,
                            'dimensionA': dimensionA.text,
                            'dimensionB': dimensionB.text
                          }
                        }).then((value) {
                          setState(() {
                            shape = null;
                            sides = null;
                          });
                          dimensionA.clear();
                          dimensionB.clear();
                        });
                      },
                      child: Text('Save')))
            ],
          ),
        ),
      ),
    );
  }
}
