import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AerationCal extends StatefulWidget {
  const AerationCal({Key? key}) : super(key: key);

  @override
  _AerationCalState createState() => _AerationCalState();
}

class _AerationCalState extends State<AerationCal> {
  TextEditingController stocking = TextEditingController();
  TextEditingController bodyWeightPcs = TextEditingController();
  TextEditingController bodyWeight = TextEditingController();
  TextEditingController operatingHours = TextEditingController();
  TextEditingController costs = TextEditingController();
  TextEditingController numberOfPonds = TextEditingController();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Number of stocking(*)'),
            ListTile(
              title: TextField(
                controller: stocking,
              ),
              trailing: Text('pcs'),
            ),
            Text('Avg body weight(*)'),
            ListTile(
              title: TextField(
                controller: bodyWeightPcs,
              ),
              trailing: Text('pcs/KG'),
            ),
            ListTile(
              title: TextField(
                controller: bodyWeight,
              ),
              trailing: Text('g/pc'),
            ),
            Text('Operating hours/day(*)'),
            ListTile(
              title: TextField(
                controller: operatingHours,
              ),
              trailing: Text('hrs'),
            ),
            Text('Number of Ponds'),
            ListTile(
              title: TextField(controller: numberOfPonds),
              trailing: Text('ponds'),
            ),
            Text('Cost'),
            ListTile(
              title: TextField(
                controller: costs,
              ),
              trailing: Text('\$/kWh'),
            ),
            SizedBox(height: 40),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(user!.uid)
                          .update({
                        'aerationCalculator': {
                          'stocking': stocking.text,
                          'bodyWeightPcs': bodyWeightPcs.text,
                          'bodyWeight': bodyWeight.text,
                          'operatingHours': operatingHours.text,
                          'costs': costs.text,
                        }
                      }).then((value) {
                        stocking.clear();
                        bodyWeight.clear();
                        bodyWeightPcs.clear();
                        operatingHours.clear();
                        costs.clear();
                      });
                    },
                    child: Text('Save')))
          ],
        ),
      ),
    );
  }
}
